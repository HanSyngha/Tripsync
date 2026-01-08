import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:naver_login_sdk/naver_login_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:cloud_functions/cloud_functions.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Google Sign In
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  // Kakao Sign In using Firebase OIDC
  Future<UserCredential?> signInWithKakao() async {
    try {
      print('[KakaoLogin] Starting Kakao login with OIDC...');

      // Check if KakaoTalk is installed
      bool isInstalled = await kakao.isKakaoTalkInstalled();
      print('[KakaoLogin] KakaoTalk installed: $isInstalled');

      kakao.OAuthToken token;
      if (isInstalled) {
        token = await kakao.UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await kakao.UserApi.instance.loginWithKakaoAccount();
      }
      print('[KakaoLogin] Got OAuth token');
      print('[KakaoLogin] Access token: ${token.accessToken.substring(0, 20)}...');
      print('[KakaoLogin] ID token exists: ${token.idToken != null}');

      // Check if we have ID token (requires OpenID Connect enabled in Kakao)
      if (token.idToken != null) {
        print('[KakaoLogin] Using OIDC method with ID token...');
        // Use Firebase OIDC provider
        final credential = OAuthProvider('oidc.kakao').credential(
          idToken: token.idToken,
          accessToken: token.accessToken,
        );
        return await _auth.signInWithCredential(credential);
      } else {
        print('[KakaoLogin] No ID token - falling back to Cloud Functions...');
        // Fallback to Cloud Functions method
        final kakaoUser = await kakao.UserApi.instance.me();
        print('[KakaoLogin] User ID: ${kakaoUser.id}');

        final functions = FirebaseFunctions.instanceFor(region: 'us-central1');
        final result = await functions.httpsCallable('createKakaoToken').call({
          'kakaoId': kakaoUser.id.toString(),
          'email': kakaoUser.kakaoAccount?.email,
          'displayName': kakaoUser.kakaoAccount?.profile?.nickname,
          'photoUrl': kakaoUser.kakaoAccount?.profile?.profileImageUrl,
        });

        final customToken = result.data['token'] as String;
        return await _auth.signInWithCustomToken(customToken);
      }
    } catch (e, stackTrace) {
      print('[KakaoLogin] ERROR: $e');
      print('[KakaoLogin] Stack: $stackTrace');
      rethrow;
    }
  }

  // Naver Sign In using naver_login_sdk
  Future<UserCredential?> signInWithNaver() async {
    final completer = Completer<UserCredential?>();

    print('[NaverLogin] Starting Naver login with new SDK...');

    NaverLoginSDK.authenticate(
      callback: OAuthLoginCallback(
        onSuccess: () async {
          print('[NaverLogin] Authentication successful, getting profile...');
          try {
            // Get user profile after successful login
            NaverLoginSDK.profile(
              callback: ProfileCallback(
                onSuccess: (resultCode, message, response) async {
                  print('[NaverLogin] Profile received: $resultCode - $message');
                  final profile = NaverLoginProfile.fromJson(response: response);
                  print('[NaverLogin] ID: ${profile.id}');
                  print('[NaverLogin] Email: ${profile.email}');
                  print('[NaverLogin] Name: ${profile.name}');

                  try {
                    final result = await _signInNaverWithAccount(
                      profile.id ?? '',
                      profile.email ?? '',
                      profile.name ?? profile.nickName ?? 'User',
                      profile.profileImage ?? '',
                    );
                    completer.complete(result);
                  } catch (e) {
                    print('[NaverLogin] Firebase sign in error: $e');
                    completer.completeError(e);
                  }
                },
                onFailure: (httpStatus, message) {
                  print('[NaverLogin] Profile failed: $httpStatus - $message');
                  completer.completeError(Exception('Profile failed: $message'));
                },
                onError: (errorCode, message) {
                  print('[NaverLogin] Profile error: $errorCode - $message');
                  completer.completeError(Exception('Profile error: $message'));
                },
              ),
            );
          } catch (e) {
            print('[NaverLogin] Error getting profile: $e');
            completer.completeError(e);
          }
        },
        onFailure: (httpStatus, message) {
          print('[NaverLogin] Auth failed: $httpStatus - $message');
          completer.completeError(Exception('Naver login failed: $message'));
        },
        onError: (errorCode, message) {
          print('[NaverLogin] Auth error: $errorCode - $message');
          completer.completeError(Exception('Naver login error: $message'));
        },
      ),
    );

    return completer.future;
  }

  Future<UserCredential?> _signInNaverWithAccount(
    String naverId,
    String email,
    String displayName,
    String photoUrl,
  ) async {
    print('[NaverLogin] Creating custom token for account: $naverId');

    // Create custom token via Cloud Functions
    final functions = FirebaseFunctions.instanceFor(region: 'us-central1');
    print('[NaverLogin] Calling Cloud Function createNaverToken...');

    final tokenResult = await functions.httpsCallable('createNaverToken').call({
      'naverId': naverId,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
    });
    print('[NaverLogin] Cloud Function returned: ${tokenResult.data}');

    final customToken = tokenResult.data['token'] as String;
    print('[NaverLogin] Signing in with custom token...');
    return await _auth.signInWithCustomToken(customToken);
  }

  // Apple Sign In
  Future<UserCredential?> signInWithApple() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      return await _auth.signInWithCredential(oauthCredential);
    } catch (e) {
      rethrow;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      // Sign out from Google
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }

      // Sign out from Kakao
      try {
        await kakao.UserApi.instance.logout();
      } catch (_) {}

      // Sign out from Naver
      try {
        NaverLoginSDK.logout();
      } catch (_) {}

      // Sign out from Firebase
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  // Delete Account
  Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.delete();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Helper methods for Apple Sign In
  String _generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
