// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Start Your Journey';

  @override
  String get welcomeSubtitle =>
      'Discover new experiences and create special memories';

  @override
  String get skip => 'Skip';

  @override
  String get participant => 'Participant';

  @override
  String get host => 'Host';

  @override
  String get coHost => 'Co-Host';

  @override
  String get signInWithKakao => 'Continue with Kakao';

  @override
  String get signInWithNaver => 'Continue with Naver';

  @override
  String get signInWithGoogle => 'Continue with Google';

  @override
  String get signInWithApple => 'Continue with Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'By logging in, you agree to our $terms and $privacy.';
  }

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get readyForNextJourney => 'Ready for your next journey?';

  @override
  String get allTrips => 'All Trips';

  @override
  String get hosting => 'Hosting';

  @override
  String get participating => 'Participating';

  @override
  String get happeningNow => 'Happening Now';

  @override
  String get upcomingAdventures => 'Upcoming Adventures';

  @override
  String get viewAll => 'View all';

  @override
  String dayOf(int current, int total) {
    return 'Day $current of $total';
  }

  @override
  String get inProgress => 'In Progress';

  @override
  String get manage => 'Manage';

  @override
  String get guest => 'Guest';

  @override
  String get tbd => 'TBD';

  @override
  String get home => 'Home';

  @override
  String get explore => 'Explore';

  @override
  String get chat => 'Chat';

  @override
  String get profile => 'Profile';

  @override
  String get createTrip => 'Create Trip';

  @override
  String get letsplanYourJourney => 'Let\'s plan your journey';

  @override
  String get hostCanEditLater =>
      'As the host, you can edit these details later anytime.';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get basicInfo => 'Basic Info';

  @override
  String get required => 'Required';

  @override
  String get tripName => 'Trip Name';

  @override
  String get tripNameHint => 'e.g. Summer in Kyoto';

  @override
  String get destination => 'Destination';

  @override
  String get destinationHint => 'Where are you going?';

  @override
  String get dates => 'Dates';

  @override
  String get startDate => 'Start Date';

  @override
  String get endDate => 'End Date';

  @override
  String get optionalDetails => 'Optional Details';

  @override
  String get coverPhoto => 'Cover Photo';

  @override
  String get tapToUploadCover => 'Tap to upload cover';

  @override
  String get tripGoalMemo => 'Trip Goal / Memo';

  @override
  String get tripGoalHint => 'What is the main goal of this trip?';

  @override
  String get nextStep => 'Next Step';

  @override
  String get participantManagement => 'Participant Management';

  @override
  String get participating_count => 'Participating';

  @override
  String get pendingInvites => 'Pending Invites';

  @override
  String get inviteNewMember => 'Invite New Member';

  @override
  String get searchByNameOrEmail => 'Search by name or email';

  @override
  String get hosts => 'Hosts';

  @override
  String get admin => 'ADMIN';

  @override
  String get travelers => 'Travelers';

  @override
  String get allPermissions => 'All permissions';

  @override
  String get canEditSchedule => 'Can edit schedule';

  @override
  String get readOnly => 'Read only';

  @override
  String get pendingAcceptance => 'Pending acceptance';

  @override
  String get resend => 'Resend';

  @override
  String get inviteLinkActivated => 'Invite link activated';

  @override
  String get copy => 'Copy';

  @override
  String get allowScheduleEdit => 'Allow schedule edit';

  @override
  String get allowPhotoUpload => 'Allow photo upload';

  @override
  String get removeFromTrip => 'Remove from trip';

  @override
  String joinedDaysAgo(int days) {
    return 'Joined $days days ago';
  }

  @override
  String get itinerary => 'Itinerary';

  @override
  String get organizerView => 'Organizer View';

  @override
  String get draft => 'Draft';

  @override
  String days(int count) {
    return '$count Days';
  }

  @override
  String day(int number) {
    return 'Day $number';
  }

  @override
  String get addActivity => 'Add Activity';

  @override
  String get schedule => 'Schedule';

  @override
  String get map => 'Map';

  @override
  String get people => 'People';

  @override
  String get settings => 'Settings';

  @override
  String get flight => 'Flight';

  @override
  String get accommodation => 'Accommodation';

  @override
  String get rentalCar => 'Rental Car';

  @override
  String get restaurant => 'Restaurant';

  @override
  String get attraction => 'Attraction';

  @override
  String get activity => 'Activity';

  @override
  String get transportation => 'Transportation';

  @override
  String get enterDetails => 'Enter Details';

  @override
  String get airline => 'Airline';

  @override
  String get flightNumber => 'Flight Number';

  @override
  String get departure => 'Departure';

  @override
  String get arrival => 'Arrival';

  @override
  String get notes => 'Notes';

  @override
  String get notesHint => 'Write any important notes here...';

  @override
  String get addAttachment => 'Add Attachment';

  @override
  String get eTicketOrVoucher => 'E-ticket or voucher (PDF, JPG)';

  @override
  String get reminderSettings => 'Reminder Settings';

  @override
  String get reservationConfirmed => 'Reservation Confirmed';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Guide - $members Members';
  }

  @override
  String get guide => 'GUIDE';

  @override
  String get organizer => 'ORGANIZER';

  @override
  String get messagePlaceholder => 'Message...';

  @override
  String get openMap => 'Open Map';

  @override
  String get newAnnouncement => 'New Announcement';

  @override
  String get toWhom => 'To whom?';

  @override
  String get allParticipants => 'All Participants';

  @override
  String get selectSpecific => 'Select Specific';

  @override
  String othersSelected(int count) {
    return '+ $count others selected';
  }

  @override
  String get messageDetails => 'Message Details';

  @override
  String get nextSchedule => 'Next Schedule';

  @override
  String get urgent => 'Urgent';

  @override
  String get generalInfo => 'General Info';

  @override
  String get poll => 'Poll';

  @override
  String get quickTemplates => 'Quick Templates';

  @override
  String get templateBusLeaving => 'Bus leaving in 10';

  @override
  String get templateMeetingPoint => 'Meeting point changed';

  @override
  String get templateWeather => 'Weather alert';

  @override
  String get templateDinner => 'Dinner reservations';

  @override
  String get subject => 'Subject';

  @override
  String get subjectHint => 'e.g. Meet at lobby';

  @override
  String get message => 'Message';

  @override
  String get messageHint => 'Write your announcement here...';

  @override
  String get addPhoto => 'Add Photo';

  @override
  String get addLocation => 'Add Location';

  @override
  String get pinToTopOfChat => 'Pin to top of chat';

  @override
  String get keepVisibleForAll => 'Keep visible for all participants';

  @override
  String get sendAsUrgentAlert => 'Send as Urgent Alert';

  @override
  String get notifiesEvenIfMuted => 'Notifies even if muted';

  @override
  String get sendNotification => 'Send Notification';

  @override
  String get notifications => 'Notifications';

  @override
  String get markAllAsRead => 'Mark all as read';

  @override
  String get all => 'All';

  @override
  String get announcements => 'Announcements';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get announcement => 'Announcement';

  @override
  String get pastAnnouncement => 'Past Announcement';

  @override
  String minutesAgo(int minutes) {
    return '$minutes min ago';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours hours ago';
  }

  @override
  String get tripDetails => 'Trip Details';

  @override
  String nights(int count) {
    return '$count Nights';
  }

  @override
  String get hostedBy => 'Hosted by';

  @override
  String get mapView => 'Map View';

  @override
  String get groupChat => 'Group Chat';

  @override
  String get savedDocs => 'Saved Docs';

  @override
  String get dontForget => 'Don\'t forget!';

  @override
  String get overview => 'Overview';

  @override
  String get expandAll => 'Expand All';

  @override
  String get checkIn => 'Check-in';

  @override
  String get checkOut => 'Check-out';

  @override
  String get directions => 'Directions';

  @override
  String get reservation => 'Reservation';

  @override
  String get currentStatus => 'Current Status';

  @override
  String tripStartsIn(int days) {
    return 'Trip starts in $days days';
  }

  @override
  String get accountAndPermissions => 'Account & Permissions';

  @override
  String get profileVisibility => 'Profile Visibility';

  @override
  String get displaySettings => 'Display Settings';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get fontSize => 'Font Size';

  @override
  String get standard => 'Standard';

  @override
  String get notificationSettings => 'Notifications';

  @override
  String get tripScheduleNotifications => 'Trip schedule notifications';

  @override
  String get importantChangesPush => 'Important changes push notifications';

  @override
  String get newMessageNotifications => 'New message notifications';

  @override
  String get helpAndSupport => 'Help & Support';

  @override
  String get appVersion => 'App Version';

  @override
  String get logout => 'Logout';

  @override
  String get permissionRequired => 'Permission Required';

  @override
  String get notificationPermissionMessage =>
      'TripSync needs notification permission to send you important trip updates and announcements from organizers.';

  @override
  String get allowNotifications => 'Allow Notifications';

  @override
  String get later => 'Later';

  @override
  String get error => 'Error';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get noTripsYet => 'No trips yet';

  @override
  String get createYourFirstTrip => 'Create your first trip or join one!';

  @override
  String get noNotifications => 'No notifications';

  @override
  String get youreAllCaughtUp => 'You\'re all caught up!';

  @override
  String get loading => 'Loading...';

  @override
  String get connectionError => 'Connection error';

  @override
  String get checkYourInternet => 'Please check your internet connection';

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String get deleteConfirmMessage => 'Are you sure you want to delete this?';

  @override
  String get delete => 'Delete';

  @override
  String get confirm => 'Confirm';

  @override
  String get done => 'Done';

  @override
  String get edit => 'Edit';

  @override
  String get close => 'Close';

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get search => 'Search';

  @override
  String get noResults => 'No results found';

  @override
  String get noMapLocations => 'No locations to display on map';

  @override
  String get noMapLocationsHint => 'Add locations to your itinerary to see them on the map';

  @override
  String get selectDate => 'Select Date';

  @override
  String get selectTime => 'Select Time';

  @override
  String get from => 'From';

  @override
  String get to => 'To';

  @override
  String get duration => 'Duration';

  @override
  String get location => 'Location';

  @override
  String get address => 'Address';

  @override
  String get phone => 'Phone';

  @override
  String get email => 'Email';

  @override
  String get website => 'Website';

  @override
  String get price => 'Price';

  @override
  String get viewMenu => 'View Menu';

  @override
  String get recommended => 'Recommended';

  @override
  String get hiking => 'Hiking';

  @override
  String get warning => 'Warning';

  @override
  String get viewDetails => 'View Details';

  @override
  String get readyForYour => 'Ready for your';

  @override
  String get nextJourney => 'next journey?';

  @override
  String get createFirstTrip => 'Create your first trip or join one!';

  @override
  String get language => 'Language';

  @override
  String get changePhoto => 'Change Photo';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get chooseFromGallery => 'Choose from Gallery';

  @override
  String get removePhoto => 'Remove Photo';

  @override
  String get displayName => 'Display Name';

  @override
  String get enterDisplayName => 'Enter your display name';

  @override
  String get enterPhoneNumber => 'Enter your phone number';

  @override
  String get displayNameRequired => 'Display name is required';

  @override
  String get displayNameMinLength =>
      'Display name must be at least 2 characters';

  @override
  String get profileUpdated => 'Profile updated successfully';

  @override
  String get failedToUpdateProfile => 'Failed to update profile';

  @override
  String get failedToPickImage => 'Failed to pick image';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get earlier => 'Earlier';

  @override
  String get discardTrip => 'Discard Trip?';

  @override
  String get discardTripMessage =>
      'Are you sure you want to discard this trip? All changes will be lost.';

  @override
  String get discardChanges => 'Discard Changes?';

  @override
  String get discardChangesMessage =>
      'Are you sure you want to discard your changes?';

  @override
  String get keepEditing => 'Keep Editing';

  @override
  String get discard => 'Discard';

  @override
  String get tripCreatedSuccess => 'Trip created successfully!';

  @override
  String get tripUpdatedSuccess => 'Trip updated successfully!';

  @override
  String get tripNotFound => 'Trip not found';

  @override
  String get itinerarySaved => 'Itinerary saved';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String get signOut => 'Sign Out';

  @override
  String get retry => 'Retry';

  @override
  String get viewParticipants => 'View Participants';

  @override
  String get pinnedMessages => 'Pinned Messages';

  @override
  String get searchMessages => 'Search Messages';

  @override
  String get sendAnnouncement => 'Send Announcement';

  @override
  String get photo => 'Photo';

  @override
  String get camera => 'Camera';

  @override
  String get sharePhotosFromGallery => 'Share photos from gallery';

  @override
  String get takeNewPhoto => 'Take a new photo';

  @override
  String get shareCurrentLocation => 'Share your current location';

  @override
  String get featureComingSoon => 'Feature coming soon!';

  @override
  String get activityAddedSuccess => 'Activity added successfully';

  @override
  String get filePickerComingSoon => 'File picker coming soon';

  @override
  String get pleaseEnterMessage => 'Please enter a message';

  @override
  String get announcementSentSuccess => 'Announcement sent successfully!';

  @override
  String get failedToLoadParticipants => 'Failed to load participants';

  @override
  String get loginRequired => 'Login required';

  @override
  String get inviteSendFailed => 'Failed to send invite. Please try again.';

  @override
  String get newInviteLinkGenerated => 'New invite link generated';

  @override
  String get inviteLinkCopied => 'Invite link copied';

  @override
  String get userNotFound => 'User not found';

  @override
  String get noDestination => 'No destination';

  @override
  String get loginTitle => 'Welcome';

  @override
  String get loginSubtitle => 'Sign in to start your journey';

  @override
  String get continueWithKakao => 'Continue with Kakao';

  @override
  String get continueWithNaver => 'Continue with Naver';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get account => 'Account';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get deleteAccountTitle => 'Delete Account?';

  @override
  String get deleteAccountMessage =>
      'This action cannot be undone. All your data including trips, messages, and profile information will be permanently deleted.';

  @override
  String get deleteAccountConfirmation => 'Type DELETE to confirm';

  @override
  String get deletingAccount => 'Deleting account...';

  @override
  String get accountDeleted => 'Account deleted successfully';

  @override
  String get deleteAccountFailed => 'Failed to delete account';

  @override
  String get deleteAccountWarning =>
      'Warning: This will permanently delete your account and all associated data.';

  @override
  String get reportMessage => 'Report Message';

  @override
  String get reportMessageDescription =>
      'Report inappropriate content to trip organizer';

  @override
  String get blockUser => 'Block User';

  @override
  String get blockUserDescription => 'You won\'t see messages from this user';

  @override
  String get selectReportReason => 'Select a reason for reporting:';

  @override
  String get additionalDetails => 'Additional Details';

  @override
  String get optionalDescription => 'Describe the issue (optional)';

  @override
  String get report => 'Report';

  @override
  String get block => 'Block';

  @override
  String get reportTypeSpam => 'Spam';

  @override
  String get reportTypeHarassment => 'Harassment';

  @override
  String get reportTypeInappropriate => 'Inappropriate Content';

  @override
  String get reportTypeHateSpeech => 'Hate Speech';

  @override
  String get reportTypeViolence => 'Violence';

  @override
  String get reportTypeOther => 'Other';

  @override
  String get reportSubmitted =>
      'Report submitted. The trip organizer will be notified.';

  @override
  String get reportFailed => 'Failed to submit report. Please try again.';

  @override
  String blockUserConfirmation(String userName) {
    return 'Are you sure you want to block $userName? You won\'t see their messages anymore.';
  }

  @override
  String userBlocked(String userName) {
    return '$userName has been blocked';
  }

  @override
  String get blockFailed => 'Failed to block user. Please try again.';

  @override
  String get blockedUsers => 'Blocked Users';

  @override
  String get noBlockedUsers => 'No blocked users';

  @override
  String get unblock => 'Unblock';

  @override
  String userUnblocked(String userName) {
    return '$userName has been unblocked';
  }

  @override
  String get reportUser => 'Report User';

  @override
  String get reportUserDescription => 'Report this user to trip organizer';

  @override
  String get locationPermissionDenied => 'Location permission denied';

  @override
  String get locationPermissionDeniedForever =>
      'Location permission permanently denied. Please enable in settings.';

  @override
  String get locationServicesDisabled =>
      'Location services are disabled. Please enable location services.';

  @override
  String get gettingLocation => 'Getting your location...';

  @override
  String get currentLocation => 'Current Location';

  @override
  String get shareLocation => 'Share Location';

  @override
  String get shareLocationConfirmation =>
      'Do you want to share your current location with the group?';

  @override
  String get share => 'Share';

  @override
  String get uploadFailed => 'Upload failed';

  @override
  String get openInGoogleMaps => 'Open in Google Maps';

  @override
  String get getDirections => 'Get Directions';

  @override
  String get drivingDirections => 'Driving Directions';

  @override
  String get walkingDirections => 'Walking Directions';

  @override
  String get transitDirections => 'Transit Directions';

  @override
  String get noPinnedMessages => 'No pinned messages yet';

  @override
  String get noItineraryYet => 'No itinerary items yet';

  @override
  String get viewFullItinerary => 'View Full Itinerary';

  @override
  String get inviteParticipant => 'Invite Participant';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get enterEmailAddress => 'Enter email address';

  @override
  String get invalidEmail => 'Please enter a valid email address';

  @override
  String get role => 'Role';

  @override
  String get permissions => 'Permissions';

  @override
  String get sendInvite => 'Send Invite';

  @override
  String get inviteSent => 'Invite sent successfully';

  @override
  String get editItinerary => 'Edit Itinerary';

  @override
  String get deleteItinerary => 'Delete Itinerary';

  @override
  String get deleteItineraryConfirm =>
      'Are you sure you want to delete this itinerary item?';

  @override
  String get itineraryDeleted => 'Itinerary item deleted';

  @override
  String get searchPlaces => 'Search places';

  @override
  String get selectLocation => 'Select Location';

  @override
  String get confirmLocation => 'Confirm Location';

  @override
  String get hotelName => 'Hotel Name';

  @override
  String get roomType => 'Room Type';

  @override
  String get checkInTime => 'Check-in Time';

  @override
  String get checkOutTime => 'Check-out Time';

  @override
  String get carCompany => 'Car Company';

  @override
  String get carModel => 'Car Model';

  @override
  String get pickupLocation => 'Pickup Location';

  @override
  String get dropoffLocation => 'Drop-off Location';

  @override
  String get pickupTime => 'Pickup Time';

  @override
  String get dropoffTime => 'Drop-off Time';

  @override
  String get restaurantName => 'Restaurant Name';

  @override
  String get cuisine => 'Cuisine';

  @override
  String get priceRange => 'Price Range';

  @override
  String get reservationTime => 'Reservation Time';

  @override
  String get departureAirport => 'Departure Airport';

  @override
  String get arrivalAirport => 'Arrival Airport';

  @override
  String get departureTime => 'Departure Time';

  @override
  String get arrivalTime => 'Arrival Time';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Gate';

  @override
  String get confirmationNumber => 'Confirmation Number';

  @override
  String get other => 'Other';

  @override
  String get title => 'Title';

  @override
  String get description => 'Description';

  @override
  String get itemNotFound => 'Item not found';

  @override
  String get selectDay => 'Select Day';

  @override
  String get selectAirline => 'Select airline';

  @override
  String get enterNotesHint => 'Enter additional notes here';

  @override
  String get enterHotelName => 'Enter hotel name';

  @override
  String get enterRoomType => 'e.g. Deluxe Twin';

  @override
  String get enterAddress => 'Enter address';

  @override
  String get enterConfirmationNumber => 'Enter confirmation number';

  @override
  String get selectCarCompany => 'Select car company';

  @override
  String get enterCarModel => 'e.g. Hyundai Avante';

  @override
  String get enterPickupLocation => 'Enter pickup location';

  @override
  String get enterDropoffLocation => 'Enter drop-off location';

  @override
  String get pickupInfo => 'Pickup Info';

  @override
  String get dropoffInfo => 'Drop-off Info';

  @override
  String get enterRestaurantName => 'Enter restaurant name';

  @override
  String get cuisineType => 'Cuisine Type';

  @override
  String get selectCuisineType => 'Select cuisine type';

  @override
  String get reservationInfo => 'Reservation Info';

  @override
  String get enterTitle => 'Enter title';

  @override
  String get enterDescription => 'Enter description';

  @override
  String get enterLocation => 'Enter location';

  @override
  String get startTime => 'Start Time';

  @override
  String get endTime => 'End Time';

  @override
  String get addAttachments => 'Add Attachments';

  @override
  String get attachmentHint => 'E-ticket, reservation confirmation, etc.';

  @override
  String get itemUpdatedSuccess => 'Item updated successfully';

  @override
  String get itemDeletedSuccess => 'Item deleted successfully';
}
