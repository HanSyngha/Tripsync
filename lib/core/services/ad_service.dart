import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  bool _isInitialized = false;
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;

  // Test Ad Unit IDs (Google Official)
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; // Android Test
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // iOS Test
    }
    throw UnsupportedError('Unsupported platform');
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712'; // Android Test
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910'; // iOS Test
    }
    throw UnsupportedError('Unsupported platform');
  }

  /// Initialize Mobile Ads SDK
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await MobileAds.instance.initialize();
      _isInitialized = true;
      debugPrint('[AdService] MobileAds initialized successfully');

      // Preload interstitial ad
      _loadInterstitialAd();
    } catch (e) {
      debugPrint('[AdService] Failed to initialize MobileAds: $e');
    }
  }

  /// Load interstitial ad
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdReady = true;
          debugPrint('[AdService] Interstitial ad loaded');

          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('[AdService] Interstitial ad dismissed');
              ad.dispose();
              _isInterstitialAdReady = false;
              _loadInterstitialAd(); // Preload next ad
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('[AdService] Interstitial ad failed to show: $error');
              ad.dispose();
              _isInterstitialAdReady = false;
              _loadInterstitialAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          debugPrint('[AdService] Interstitial ad failed to load: $error');
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  /// Show interstitial ad
  Future<bool> showInterstitialAd() async {
    if (!_isInterstitialAdReady || _interstitialAd == null) {
      debugPrint('[AdService] Interstitial ad not ready');
      return false;
    }

    try {
      await _interstitialAd!.show();
      return true;
    } catch (e) {
      debugPrint('[AdService] Failed to show interstitial ad: $e');
      return false;
    }
  }

  /// Check if interstitial ad is ready
  bool get isInterstitialAdReady => _isInterstitialAdReady;

  /// Dispose resources
  void dispose() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
    _isInterstitialAdReady = false;
  }
}
