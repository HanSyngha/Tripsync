/// App-wide constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'TripSync';
  static const String appVersion = '1.0.0';
  static const String packageName = 'com.yourcompany.tripsync';

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String tripsCollection = 'trips';
  static const String itinerariesCollection = 'itineraries';
  static const String participantsCollection = 'participants';
  static const String messagesCollection = 'messages';
  static const String notificationsCollection = 'notifications';
  static const String invitesCollection = 'invites';

  // Storage Paths
  static const String profileImagesPath = 'profile_images';
  static const String tripImagesPath = 'trip_images';
  static const String attachmentsPath = 'attachments';

  // Shared Preferences Keys
  static const String prefThemeMode = 'theme_mode';
  static const String prefLocale = 'locale';
  static const String prefFontSize = 'font_size';
  static const String prefNotificationsEnabled = 'notifications_enabled';
  static const String prefFirstLaunch = 'first_launch';
  static const String prefUserId = 'user_id';

  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Pagination
  static const int defaultPageSize = 20;
  static const int chatPageSize = 50;

  // Limits
  static const int maxTripNameLength = 100;
  static const int maxDescriptionLength = 500;
  static const int maxParticipants = 100;
  static const int maxAttachmentSizeMB = 10;

  // Default Values
  static const String defaultProfileImage = 'assets/images/default_avatar.png';
  static const String defaultTripCover = 'assets/images/default_trip_cover.png';
}

/// User Roles
enum UserRole {
  host,
  coHost,
  participant,
}

extension UserRoleExtension on UserRole {
  String get name {
    switch (this) {
      case UserRole.host:
        return 'host';
      case UserRole.coHost:
        return 'co_host';
      case UserRole.participant:
        return 'participant';
    }
  }

  bool get canEdit {
    return this == UserRole.host || this == UserRole.coHost;
  }

  bool get canManageParticipants {
    return this == UserRole.host || this == UserRole.coHost;
  }

  bool get canSendAnnouncements {
    return this == UserRole.host || this == UserRole.coHost;
  }
}

/// Trip Status
enum TripStatus {
  draft,
  upcoming,
  inProgress,
  completed,
  cancelled,
}

extension TripStatusExtension on TripStatus {
  String get name {
    switch (this) {
      case TripStatus.draft:
        return 'draft';
      case TripStatus.upcoming:
        return 'upcoming';
      case TripStatus.inProgress:
        return 'in_progress';
      case TripStatus.completed:
        return 'completed';
      case TripStatus.cancelled:
        return 'cancelled';
    }
  }
}

/// Itinerary Item Types
enum ItineraryItemType {
  flight,
  accommodation,
  rentalCar,
  restaurant,
  attraction,
  activity,
  transportation,
  other,
}

extension ItineraryItemTypeExtension on ItineraryItemType {
  String get name {
    switch (this) {
      case ItineraryItemType.flight:
        return 'flight';
      case ItineraryItemType.accommodation:
        return 'accommodation';
      case ItineraryItemType.rentalCar:
        return 'rental_car';
      case ItineraryItemType.restaurant:
        return 'restaurant';
      case ItineraryItemType.attraction:
        return 'attraction';
      case ItineraryItemType.activity:
        return 'activity';
      case ItineraryItemType.transportation:
        return 'transportation';
      case ItineraryItemType.other:
        return 'other';
    }
  }

  String get icon {
    switch (this) {
      case ItineraryItemType.flight:
        return 'flight';
      case ItineraryItemType.accommodation:
        return 'hotel';
      case ItineraryItemType.rentalCar:
        return 'directions_car';
      case ItineraryItemType.restaurant:
        return 'restaurant';
      case ItineraryItemType.attraction:
        return 'attractions';
      case ItineraryItemType.activity:
        return 'local_activity';
      case ItineraryItemType.transportation:
        return 'directions_bus';
      case ItineraryItemType.other:
        return 'more_horiz';
    }
  }
}

/// Notification Types
enum NotificationType {
  announcement,
  scheduleUpdate,
  newMessage,
  inviteReceived,
  inviteAccepted,
  tripReminder,
  locationUpdate,
}

extension NotificationTypeExtension on NotificationType {
  String get name {
    switch (this) {
      case NotificationType.announcement:
        return 'announcement';
      case NotificationType.scheduleUpdate:
        return 'schedule_update';
      case NotificationType.newMessage:
        return 'new_message';
      case NotificationType.inviteReceived:
        return 'invite_received';
      case NotificationType.inviteAccepted:
        return 'invite_accepted';
      case NotificationType.tripReminder:
        return 'trip_reminder';
      case NotificationType.locationUpdate:
        return 'location_update';
    }
  }
}

/// Invite Status
enum InviteStatus {
  pending,
  accepted,
  declined,
  expired,
}

/// Message Types
enum MessageType {
  text,
  image,
  location,
  announcement,
  systemMessage,
}
