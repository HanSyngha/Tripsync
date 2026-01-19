import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String displayName;
  final String? photoUrl;
  final String? phoneNumber;
  final String provider; // google, kakao, naver, apple
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  final String? fcmToken;
  final UserSettings settings;
  final List<BlockedUser> blockedUsers;

  UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.phoneNumber,
    required this.provider,
    required this.createdAt,
    this.lastLoginAt,
    this.fcmToken,
    required this.settings,
    this.blockedUsers = const [],
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      email: data['email'] ?? '',
      displayName: data['displayName'] ?? '',
      photoUrl: data['photoUrl'],
      phoneNumber: data['phoneNumber'],
      provider: data['provider'] ?? 'unknown',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      lastLoginAt: (data['lastLoginAt'] as Timestamp?)?.toDate(),
      fcmToken: data['fcmToken'],
      settings: UserSettings.fromMap(data['settings'] ?? {}),
      blockedUsers: (data['blockedUsers'] as List<dynamic>?)
          ?.map((e) => BlockedUser.fromMap(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'provider': provider,
      'createdAt': Timestamp.fromDate(createdAt),
      'lastLoginAt': lastLoginAt != null ? Timestamp.fromDate(lastLoginAt!) : null,
      'fcmToken': fcmToken,
      'settings': settings.toMap(),
      'blockedUsers': blockedUsers.map((e) => e.toMap()).toList(),
    };
  }

  bool isUserBlocked(String userId) {
    return blockedUsers.any((blocked) => blocked.userId == userId);
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
    String? provider,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    String? fcmToken,
    UserSettings? settings,
    List<BlockedUser>? blockedUsers,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      provider: provider ?? this.provider,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      fcmToken: fcmToken ?? this.fcmToken,
      settings: settings ?? this.settings,
      blockedUsers: blockedUsers ?? this.blockedUsers,
    );
  }
}

class BlockedUser {
  final String userId;
  final String userName;
  final DateTime blockedAt;

  BlockedUser({
    required this.userId,
    required this.userName,
    required this.blockedAt,
  });

  factory BlockedUser.fromMap(Map<String, dynamic> map) {
    return BlockedUser(
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      blockedAt: (map['blockedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'blockedAt': Timestamp.fromDate(blockedAt),
    };
  }
}

class UserSettings {
  final bool notificationsEnabled;
  final bool tripScheduleNotifications;
  final bool newMessageNotifications;
  final String locale;
  final String themeMode; // light, dark, system
  final double fontSize;

  UserSettings({
    this.notificationsEnabled = true,
    this.tripScheduleNotifications = true,
    this.newMessageNotifications = true,
    this.locale = 'en',
    this.themeMode = 'system',
    this.fontSize = 1.0,
  });

  factory UserSettings.fromMap(Map<String, dynamic> map) {
    return UserSettings(
      notificationsEnabled: map['notificationsEnabled'] ?? true,
      tripScheduleNotifications: map['tripScheduleNotifications'] ?? true,
      newMessageNotifications: map['newMessageNotifications'] ?? true,
      locale: map['locale'] ?? 'en',
      themeMode: map['themeMode'] ?? 'system',
      fontSize: (map['fontSize'] ?? 1.0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notificationsEnabled': notificationsEnabled,
      'tripScheduleNotifications': tripScheduleNotifications,
      'newMessageNotifications': newMessageNotifications,
      'locale': locale,
      'themeMode': themeMode,
      'fontSize': fontSize,
    };
  }

  UserSettings copyWith({
    bool? notificationsEnabled,
    bool? tripScheduleNotifications,
    bool? newMessageNotifications,
    String? locale,
    String? themeMode,
    double? fontSize,
  }) {
    return UserSettings(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      tripScheduleNotifications: tripScheduleNotifications ?? this.tripScheduleNotifications,
      newMessageNotifications: newMessageNotifications ?? this.newMessageNotifications,
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
