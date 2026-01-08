import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection('users');

  // Get user by ID
  Future<UserModel?> getUser(String userId) async {
    try {
      final doc = await _usersCollection.doc(userId).get();
      if (!doc.exists) return null;
      return UserModel.fromFirestore(doc);
    } catch (e) {
      rethrow;
    }
  }

  // Get user stream
  Stream<UserModel?> getUserStream(String userId) {
    return _usersCollection.doc(userId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return UserModel.fromFirestore(doc);
    });
  }

  // Create or update user from Firebase Auth user
  Future<UserModel> createOrUpdateUser(User firebaseUser) async {
    try {
      final existingUser = await getUser(firebaseUser.uid);

      if (existingUser != null) {
        // Update last login
        await _usersCollection.doc(firebaseUser.uid).update({
          'lastLoginAt': Timestamp.now(),
        });
        return existingUser.copyWith(lastLoginAt: DateTime.now());
      }

      // Create new user
      final newUser = UserModel(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        displayName: firebaseUser.displayName ?? 'User',
        photoUrl: firebaseUser.photoURL,
        provider: _getProviderFromProviderId(firebaseUser.providerData),
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
        settings: UserSettings(),
      );

      await _usersCollection.doc(firebaseUser.uid).set(newUser.toFirestore());
      return newUser;
    } catch (e) {
      rethrow;
    }
  }

  // Update user profile
  Future<void> updateUserProfile({
    required String userId,
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
    File? imageFile,
  }) async {
    try {
      final updates = <String, dynamic>{
        'updatedAt': Timestamp.now(),
      };

      if (displayName != null) updates['displayName'] = displayName;
      if (photoUrl != null) updates['photoUrl'] = photoUrl;
      if (phoneNumber != null) updates['phoneNumber'] = phoneNumber;

      // Upload image if provided
      if (imageFile != null) {
        final uploadedUrl = await uploadProfileImage(userId, imageFile);
        updates['photoUrl'] = uploadedUrl;
      }

      await _usersCollection.doc(userId).update(updates);
    } catch (e) {
      rethrow;
    }
  }

  // Upload profile image to Firebase Storage
  Future<String> uploadProfileImage(String userId, File imageFile) async {
    try {
      final ref = _storage.ref().child('profile_images/$userId.jpg');
      final uploadTask = await ref.putFile(
        imageFile,
        SettableMetadata(contentType: 'image/jpeg'),
      );
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }

  // Update user settings
  Future<void> updateUserSettings({
    required String userId,
    String? preferredLanguage,
    bool? notificationsEnabled,
    bool? darkModeEnabled,
  }) async {
    try {
      final updates = <String, dynamic>{
        'updatedAt': Timestamp.now(),
      };

      if (preferredLanguage != null) {
        updates['settings.preferredLanguage'] = preferredLanguage;
      }
      if (notificationsEnabled != null) {
        updates['settings.notificationsEnabled'] = notificationsEnabled;
      }
      if (darkModeEnabled != null) {
        updates['settings.darkModeEnabled'] = darkModeEnabled;
      }

      await _usersCollection.doc(userId).update(updates);
    } catch (e) {
      rethrow;
    }
  }

  // Update FCM token
  Future<void> updateFcmToken(String userId, String? fcmToken) async {
    try {
      await _usersCollection.doc(userId).update({
        'fcmToken': fcmToken,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Delete user data
  Future<void> deleteUserData(String userId) async {
    try {
      await _usersCollection.doc(userId).delete();
    } catch (e) {
      rethrow;
    }
  }

  // Helper to determine auth provider from provider data
  String _getProviderFromProviderId(List<UserInfo> providerData) {
    if (providerData.isEmpty) return 'unknown';

    final providerId = providerData.first.providerId;
    switch (providerId) {
      case 'google.com':
        return 'google';
      case 'apple.com':
        return 'apple';
      case 'password':
        return 'email';
      default:
        // For custom providers like Kakao, Naver
        if (providerId.contains('kakao')) return 'kakao';
        if (providerId.contains('naver')) return 'naver';
        return providerId;
    }
  }
}
