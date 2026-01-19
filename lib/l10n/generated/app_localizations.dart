import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'TripSync'**
  String get appName;

  /// Welcome screen title
  ///
  /// In en, this message translates to:
  /// **'Start Your Journey'**
  String get welcomeTitle;

  /// Welcome screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Discover new experiences and create special memories'**
  String get welcomeSubtitle;

  /// Skip button
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Participant role
  ///
  /// In en, this message translates to:
  /// **'Participant'**
  String get participant;

  /// Host/Organizer role
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get host;

  /// Co-host role
  ///
  /// In en, this message translates to:
  /// **'Co-Host'**
  String get coHost;

  /// Kakao login button
  ///
  /// In en, this message translates to:
  /// **'Continue with Kakao'**
  String get signInWithKakao;

  /// Naver login button
  ///
  /// In en, this message translates to:
  /// **'Continue with Naver'**
  String get signInWithNaver;

  /// Google login button
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get signInWithGoogle;

  /// Apple login button
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get signInWithApple;

  /// Terms agreement text
  ///
  /// In en, this message translates to:
  /// **'By logging in, you agree to our {terms} and {privacy}.'**
  String termsAgreement(String terms, String privacy);

  /// Terms of service link text
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// Privacy policy link text
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Welcome back greeting
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// Home screen headline
  ///
  /// In en, this message translates to:
  /// **'Ready for your next journey?'**
  String get readyForNextJourney;

  /// All trips filter
  ///
  /// In en, this message translates to:
  /// **'All Trips'**
  String get allTrips;

  /// Hosting filter
  ///
  /// In en, this message translates to:
  /// **'Hosting'**
  String get hosting;

  /// Participating filter
  ///
  /// In en, this message translates to:
  /// **'Participating'**
  String get participating;

  /// Current trips section
  ///
  /// In en, this message translates to:
  /// **'Happening Now'**
  String get happeningNow;

  /// Upcoming trips section
  ///
  /// In en, this message translates to:
  /// **'Upcoming Adventures'**
  String get upcomingAdventures;

  /// View all link
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// Day progress
  ///
  /// In en, this message translates to:
  /// **'Day {current} of {total}'**
  String dayOf(int current, int total);

  /// Trip in progress status
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// Manage button
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manage;

  /// Guest role
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// To be determined
  ///
  /// In en, this message translates to:
  /// **'TBD'**
  String get tbd;

  /// Home navigation
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Explore navigation
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// Chat navigation
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// Profile navigation
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Create trip button
  ///
  /// In en, this message translates to:
  /// **'Create Trip'**
  String get createTrip;

  /// Create trip header
  ///
  /// In en, this message translates to:
  /// **'Let\'s plan your journey'**
  String get letsplanYourJourney;

  /// Create trip note
  ///
  /// In en, this message translates to:
  /// **'As the host, you can edit these details later anytime.'**
  String get hostCanEditLater;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Basic info section
  ///
  /// In en, this message translates to:
  /// **'Basic Info'**
  String get basicInfo;

  /// Required field indicator
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// Trip name field
  ///
  /// In en, this message translates to:
  /// **'Trip Name'**
  String get tripName;

  /// Trip name hint
  ///
  /// In en, this message translates to:
  /// **'e.g. Summer in Kyoto'**
  String get tripNameHint;

  /// Destination field
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get destination;

  /// Destination hint
  ///
  /// In en, this message translates to:
  /// **'Where are you going?'**
  String get destinationHint;

  /// Dates field
  ///
  /// In en, this message translates to:
  /// **'Dates'**
  String get dates;

  /// Start date
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// End date
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// Optional section
  ///
  /// In en, this message translates to:
  /// **'Optional Details'**
  String get optionalDetails;

  /// Cover photo field
  ///
  /// In en, this message translates to:
  /// **'Cover Photo'**
  String get coverPhoto;

  /// Upload cover hint
  ///
  /// In en, this message translates to:
  /// **'Tap to upload cover'**
  String get tapToUploadCover;

  /// Trip goal field
  ///
  /// In en, this message translates to:
  /// **'Trip Goal / Memo'**
  String get tripGoalMemo;

  /// Trip goal hint
  ///
  /// In en, this message translates to:
  /// **'What is the main goal of this trip?'**
  String get tripGoalHint;

  /// Next step button
  ///
  /// In en, this message translates to:
  /// **'Next Step'**
  String get nextStep;

  /// Participant management title
  ///
  /// In en, this message translates to:
  /// **'Participant Management'**
  String get participantManagement;

  /// Participating count label
  ///
  /// In en, this message translates to:
  /// **'Participating'**
  String get participating_count;

  /// Pending invites label
  ///
  /// In en, this message translates to:
  /// **'Pending Invites'**
  String get pendingInvites;

  /// Invite member button
  ///
  /// In en, this message translates to:
  /// **'Invite New Member'**
  String get inviteNewMember;

  /// Search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search by name or email'**
  String get searchByNameOrEmail;

  /// Hosts section
  ///
  /// In en, this message translates to:
  /// **'Hosts'**
  String get hosts;

  /// Admin badge
  ///
  /// In en, this message translates to:
  /// **'ADMIN'**
  String get admin;

  /// Travelers section
  ///
  /// In en, this message translates to:
  /// **'Travelers'**
  String get travelers;

  /// All permissions label
  ///
  /// In en, this message translates to:
  /// **'All permissions'**
  String get allPermissions;

  /// Edit permission
  ///
  /// In en, this message translates to:
  /// **'Can edit schedule'**
  String get canEditSchedule;

  /// Read only permission
  ///
  /// In en, this message translates to:
  /// **'Read only'**
  String get readOnly;

  /// Pending status
  ///
  /// In en, this message translates to:
  /// **'Pending acceptance'**
  String get pendingAcceptance;

  /// Resend button
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// Invite link status
  ///
  /// In en, this message translates to:
  /// **'Invite link activated'**
  String get inviteLinkActivated;

  /// Copy button
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// Schedule edit toggle
  ///
  /// In en, this message translates to:
  /// **'Allow schedule edit'**
  String get allowScheduleEdit;

  /// Photo upload toggle
  ///
  /// In en, this message translates to:
  /// **'Allow photo upload'**
  String get allowPhotoUpload;

  /// Remove member button
  ///
  /// In en, this message translates to:
  /// **'Remove from trip'**
  String get removeFromTrip;

  /// Join date
  ///
  /// In en, this message translates to:
  /// **'Joined {days} days ago'**
  String joinedDaysAgo(int days);

  /// Itinerary title
  ///
  /// In en, this message translates to:
  /// **'Itinerary'**
  String get itinerary;

  /// Organizer view label
  ///
  /// In en, this message translates to:
  /// **'Organizer View'**
  String get organizerView;

  /// Draft status
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get draft;

  /// Days count
  ///
  /// In en, this message translates to:
  /// **'{count} Days'**
  String days(int count);

  /// Day number
  ///
  /// In en, this message translates to:
  /// **'Day {number}'**
  String day(int number);

  /// Add activity button
  ///
  /// In en, this message translates to:
  /// **'Add Activity'**
  String get addActivity;

  /// Schedule nav
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// Map nav
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// People nav
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get people;

  /// Settings nav
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Flight category
  ///
  /// In en, this message translates to:
  /// **'Flight'**
  String get flight;

  /// Accommodation category
  ///
  /// In en, this message translates to:
  /// **'Accommodation'**
  String get accommodation;

  /// Rental car category
  ///
  /// In en, this message translates to:
  /// **'Rental Car'**
  String get rentalCar;

  /// Restaurant category
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get restaurant;

  /// Attraction category
  ///
  /// In en, this message translates to:
  /// **'Attraction'**
  String get attraction;

  /// Activity category
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// Transportation category
  ///
  /// In en, this message translates to:
  /// **'Transportation'**
  String get transportation;

  /// Enter details title
  ///
  /// In en, this message translates to:
  /// **'Enter Details'**
  String get enterDetails;

  /// Airline field
  ///
  /// In en, this message translates to:
  /// **'Airline'**
  String get airline;

  /// Flight number field
  ///
  /// In en, this message translates to:
  /// **'Flight Number'**
  String get flightNumber;

  /// Departure label
  ///
  /// In en, this message translates to:
  /// **'Departure'**
  String get departure;

  /// Arrival label
  ///
  /// In en, this message translates to:
  /// **'Arrival'**
  String get arrival;

  /// Notes field
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// Notes hint
  ///
  /// In en, this message translates to:
  /// **'Write any important notes here...'**
  String get notesHint;

  /// Add attachment button
  ///
  /// In en, this message translates to:
  /// **'Add Attachment'**
  String get addAttachment;

  /// Attachment hint
  ///
  /// In en, this message translates to:
  /// **'E-ticket or voucher (PDF, JPG)'**
  String get eTicketOrVoucher;

  /// Reminder toggle
  ///
  /// In en, this message translates to:
  /// **'Reminder Settings'**
  String get reminderSettings;

  /// Confirmed status
  ///
  /// In en, this message translates to:
  /// **'Reservation Confirmed'**
  String get reservationConfirmed;

  /// Chat title
  ///
  /// In en, this message translates to:
  /// **'{tripName}'**
  String chatTitle(String tripName);

  /// Chat subtitle
  ///
  /// In en, this message translates to:
  /// **'{guides} Guide - {members} Members'**
  String guideAndMembers(int guides, int members);

  /// Guide badge
  ///
  /// In en, this message translates to:
  /// **'GUIDE'**
  String get guide;

  /// Organizer badge
  ///
  /// In en, this message translates to:
  /// **'ORGANIZER'**
  String get organizer;

  /// Message input placeholder
  ///
  /// In en, this message translates to:
  /// **'Message...'**
  String get messagePlaceholder;

  /// Open map link
  ///
  /// In en, this message translates to:
  /// **'Open Map'**
  String get openMap;

  /// Announcement title
  ///
  /// In en, this message translates to:
  /// **'New Announcement'**
  String get newAnnouncement;

  /// Recipients section
  ///
  /// In en, this message translates to:
  /// **'To whom?'**
  String get toWhom;

  /// All participants option
  ///
  /// In en, this message translates to:
  /// **'All Participants'**
  String get allParticipants;

  /// Select specific option
  ///
  /// In en, this message translates to:
  /// **'Select Specific'**
  String get selectSpecific;

  /// Others selected count
  ///
  /// In en, this message translates to:
  /// **'+ {count} others selected'**
  String othersSelected(int count);

  /// Message details section
  ///
  /// In en, this message translates to:
  /// **'Message Details'**
  String get messageDetails;

  /// Schedule type
  ///
  /// In en, this message translates to:
  /// **'Next Schedule'**
  String get nextSchedule;

  /// Urgent type
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get urgent;

  /// General info type
  ///
  /// In en, this message translates to:
  /// **'General Info'**
  String get generalInfo;

  /// Poll type
  ///
  /// In en, this message translates to:
  /// **'Poll'**
  String get poll;

  /// Templates section
  ///
  /// In en, this message translates to:
  /// **'Quick Templates'**
  String get quickTemplates;

  /// Bus template
  ///
  /// In en, this message translates to:
  /// **'Bus leaving in 10'**
  String get templateBusLeaving;

  /// Meeting point template
  ///
  /// In en, this message translates to:
  /// **'Meeting point changed'**
  String get templateMeetingPoint;

  /// Weather template
  ///
  /// In en, this message translates to:
  /// **'Weather alert'**
  String get templateWeather;

  /// Dinner template
  ///
  /// In en, this message translates to:
  /// **'Dinner reservations'**
  String get templateDinner;

  /// Subject field
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// Subject hint
  ///
  /// In en, this message translates to:
  /// **'e.g. Meet at lobby'**
  String get subjectHint;

  /// Message field
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// Message hint
  ///
  /// In en, this message translates to:
  /// **'Write your announcement here...'**
  String get messageHint;

  /// Add photo button
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhoto;

  /// Add location button
  ///
  /// In en, this message translates to:
  /// **'Add Location'**
  String get addLocation;

  /// Pin toggle
  ///
  /// In en, this message translates to:
  /// **'Pin to top of chat'**
  String get pinToTopOfChat;

  /// Pin description
  ///
  /// In en, this message translates to:
  /// **'Keep visible for all participants'**
  String get keepVisibleForAll;

  /// Urgent toggle
  ///
  /// In en, this message translates to:
  /// **'Send as Urgent Alert'**
  String get sendAsUrgentAlert;

  /// Urgent description
  ///
  /// In en, this message translates to:
  /// **'Notifies even if muted'**
  String get notifiesEvenIfMuted;

  /// Send button
  ///
  /// In en, this message translates to:
  /// **'Send Notification'**
  String get sendNotification;

  /// Notifications title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Mark all read button
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get markAllAsRead;

  /// All filter
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Announcements filter
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announcements;

  /// Today label
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Yesterday label
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// Announcement badge
  ///
  /// In en, this message translates to:
  /// **'Announcement'**
  String get announcement;

  /// Past announcement badge
  ///
  /// In en, this message translates to:
  /// **'Past Announcement'**
  String get pastAnnouncement;

  /// Minutes ago
  ///
  /// In en, this message translates to:
  /// **'{minutes} min ago'**
  String minutesAgo(int minutes);

  /// Hours ago
  ///
  /// In en, this message translates to:
  /// **'{hours} hours ago'**
  String hoursAgo(int hours);

  /// Trip details title
  ///
  /// In en, this message translates to:
  /// **'Trip Details'**
  String get tripDetails;

  /// Nights count
  ///
  /// In en, this message translates to:
  /// **'{count} Nights'**
  String nights(int count);

  /// Hosted by label
  ///
  /// In en, this message translates to:
  /// **'Hosted by'**
  String get hostedBy;

  /// Map view button
  ///
  /// In en, this message translates to:
  /// **'Map View'**
  String get mapView;

  /// Group chat button
  ///
  /// In en, this message translates to:
  /// **'Group Chat'**
  String get groupChat;

  /// Saved docs button
  ///
  /// In en, this message translates to:
  /// **'Saved Docs'**
  String get savedDocs;

  /// Reminder title
  ///
  /// In en, this message translates to:
  /// **'Don\'t forget!'**
  String get dontForget;

  /// Overview section
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// Expand all button
  ///
  /// In en, this message translates to:
  /// **'Expand All'**
  String get expandAll;

  /// Check-in label
  ///
  /// In en, this message translates to:
  /// **'Check-in'**
  String get checkIn;

  /// Check-out label
  ///
  /// In en, this message translates to:
  /// **'Check-out'**
  String get checkOut;

  /// Directions button
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get directions;

  /// Reservation button
  ///
  /// In en, this message translates to:
  /// **'Reservation'**
  String get reservation;

  /// Status label
  ///
  /// In en, this message translates to:
  /// **'Current Status'**
  String get currentStatus;

  /// Trip starts countdown
  ///
  /// In en, this message translates to:
  /// **'Trip starts in {days} days'**
  String tripStartsIn(int days);

  /// Settings section
  ///
  /// In en, this message translates to:
  /// **'Account & Permissions'**
  String get accountAndPermissions;

  /// Visibility setting
  ///
  /// In en, this message translates to:
  /// **'Profile Visibility'**
  String get profileVisibility;

  /// Display section
  ///
  /// In en, this message translates to:
  /// **'Display Settings'**
  String get displaySettings;

  /// Dark mode toggle
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Font size setting
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSize;

  /// Standard size
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get standard;

  /// Notification section
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationSettings;

  /// Schedule notification toggle
  ///
  /// In en, this message translates to:
  /// **'Trip schedule notifications'**
  String get tripScheduleNotifications;

  /// Push description
  ///
  /// In en, this message translates to:
  /// **'Important changes push notifications'**
  String get importantChangesPush;

  /// Message notification toggle
  ///
  /// In en, this message translates to:
  /// **'New message notifications'**
  String get newMessageNotifications;

  /// Help link
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpAndSupport;

  /// Version label
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get appVersion;

  /// Logout button
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Permission dialog title
  ///
  /// In en, this message translates to:
  /// **'Permission Required'**
  String get permissionRequired;

  /// Notification permission message
  ///
  /// In en, this message translates to:
  /// **'TripSync needs notification permission to send you important trip updates and announcements from organizers.'**
  String get notificationPermissionMessage;

  /// Allow notifications button
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get allowNotifications;

  /// Later button
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// Error title
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Retry button
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Empty trips message
  ///
  /// In en, this message translates to:
  /// **'No trips yet'**
  String get noTripsYet;

  /// Empty trips description
  ///
  /// In en, this message translates to:
  /// **'Create your first trip or join one!'**
  String get createYourFirstTrip;

  /// Empty notifications message
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get noNotifications;

  /// Empty notifications description
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up!'**
  String get youreAllCaughtUp;

  /// Loading indicator
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Connection error message
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get connectionError;

  /// Connection error description
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get checkYourInternet;

  /// Delete confirmation title
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDelete;

  /// Delete confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this?'**
  String get deleteConfirmMessage;

  /// Delete button
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Confirm button
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Done button
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Edit button
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Close button
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Back button
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Next button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No search results
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResults;

  /// Date picker title
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// Time picker title
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTime;

  /// From label
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// To label
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// Duration label
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// Location label
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Address label
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Phone label
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// Email label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Website label
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// Price label
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// View menu button
  ///
  /// In en, this message translates to:
  /// **'View Menu'**
  String get viewMenu;

  /// Recommended label
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// Hiking activity
  ///
  /// In en, this message translates to:
  /// **'Hiking'**
  String get hiking;

  /// Warning label
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// View details button
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// Part 1 of home screen headline
  ///
  /// In en, this message translates to:
  /// **'Ready for your'**
  String get readyForYour;

  /// Part 2 of home screen headline
  ///
  /// In en, this message translates to:
  /// **'next journey?'**
  String get nextJourney;

  /// Empty state description
  ///
  /// In en, this message translates to:
  /// **'Create your first trip or join one!'**
  String get createFirstTrip;

  /// Language settings title
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Change profile photo button
  ///
  /// In en, this message translates to:
  /// **'Change Photo'**
  String get changePhoto;

  /// Take photo option
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// Gallery option
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

  /// Remove photo option
  ///
  /// In en, this message translates to:
  /// **'Remove Photo'**
  String get removePhoto;

  /// Display name field label
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayName;

  /// Display name placeholder
  ///
  /// In en, this message translates to:
  /// **'Enter your display name'**
  String get enterDisplayName;

  /// Phone number placeholder
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhoneNumber;

  /// Display name validation error
  ///
  /// In en, this message translates to:
  /// **'Display name is required'**
  String get displayNameRequired;

  /// Display name length validation
  ///
  /// In en, this message translates to:
  /// **'Display name must be at least 2 characters'**
  String get displayNameMinLength;

  /// Profile update success message
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdated;

  /// Profile update error message
  ///
  /// In en, this message translates to:
  /// **'Failed to update profile'**
  String get failedToUpdateProfile;

  /// Image picker error
  ///
  /// In en, this message translates to:
  /// **'Failed to pick image'**
  String get failedToPickImage;

  /// Logout confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmation;

  /// Earlier date section label
  ///
  /// In en, this message translates to:
  /// **'Earlier'**
  String get earlier;

  /// Discard trip dialog title
  ///
  /// In en, this message translates to:
  /// **'Discard Trip?'**
  String get discardTrip;

  /// Discard trip confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to discard this trip? All changes will be lost.'**
  String get discardTripMessage;

  /// Discard changes dialog title
  ///
  /// In en, this message translates to:
  /// **'Discard Changes?'**
  String get discardChanges;

  /// Discard changes confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to discard your changes?'**
  String get discardChangesMessage;

  /// Keep editing button
  ///
  /// In en, this message translates to:
  /// **'Keep Editing'**
  String get keepEditing;

  /// Discard button
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get discard;

  /// Trip created success message
  ///
  /// In en, this message translates to:
  /// **'Trip created successfully!'**
  String get tripCreatedSuccess;

  /// Trip updated success message
  ///
  /// In en, this message translates to:
  /// **'Trip updated successfully!'**
  String get tripUpdatedSuccess;

  /// Trip not found error
  ///
  /// In en, this message translates to:
  /// **'Trip not found'**
  String get tripNotFound;

  /// Itinerary saved message
  ///
  /// In en, this message translates to:
  /// **'Itinerary saved'**
  String get itinerarySaved;

  /// Coming soon placeholder
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// Sign out button
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// Retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// View participants option
  ///
  /// In en, this message translates to:
  /// **'View Participants'**
  String get viewParticipants;

  /// Pinned messages option
  ///
  /// In en, this message translates to:
  /// **'Pinned Messages'**
  String get pinnedMessages;

  /// Search messages option
  ///
  /// In en, this message translates to:
  /// **'Search Messages'**
  String get searchMessages;

  /// Send announcement option
  ///
  /// In en, this message translates to:
  /// **'Send Announcement'**
  String get sendAnnouncement;

  /// Photo option
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photo;

  /// Camera option
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// Gallery sharing description
  ///
  /// In en, this message translates to:
  /// **'Share photos from gallery'**
  String get sharePhotosFromGallery;

  /// Camera description
  ///
  /// In en, this message translates to:
  /// **'Take a new photo'**
  String get takeNewPhoto;

  /// Location sharing description
  ///
  /// In en, this message translates to:
  /// **'Share your current location'**
  String get shareCurrentLocation;

  /// Feature coming soon message
  ///
  /// In en, this message translates to:
  /// **'Feature coming soon!'**
  String get featureComingSoon;

  /// Activity added success message
  ///
  /// In en, this message translates to:
  /// **'Activity added successfully'**
  String get activityAddedSuccess;

  /// File picker coming soon message
  ///
  /// In en, this message translates to:
  /// **'File picker coming soon'**
  String get filePickerComingSoon;

  /// Empty message validation
  ///
  /// In en, this message translates to:
  /// **'Please enter a message'**
  String get pleaseEnterMessage;

  /// Announcement sent success message
  ///
  /// In en, this message translates to:
  /// **'Announcement sent successfully!'**
  String get announcementSentSuccess;

  /// Participants loading error
  ///
  /// In en, this message translates to:
  /// **'Failed to load participants'**
  String get failedToLoadParticipants;

  /// Login required message
  ///
  /// In en, this message translates to:
  /// **'Login required'**
  String get loginRequired;

  /// Invite send failure message
  ///
  /// In en, this message translates to:
  /// **'Failed to send invite. Please try again.'**
  String get inviteSendFailed;

  /// New invite link generated message
  ///
  /// In en, this message translates to:
  /// **'New invite link generated'**
  String get newInviteLinkGenerated;

  /// Invite link copied message
  ///
  /// In en, this message translates to:
  /// **'Invite link copied'**
  String get inviteLinkCopied;

  /// User not found error
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get userNotFound;

  /// No destination placeholder
  ///
  /// In en, this message translates to:
  /// **'No destination'**
  String get noDestination;

  /// Login screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get loginTitle;

  /// Login screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Sign in to start your journey'**
  String get loginSubtitle;

  /// Kakao login button alternate text
  ///
  /// In en, this message translates to:
  /// **'Continue with Kakao'**
  String get continueWithKakao;

  /// Naver login button alternate text
  ///
  /// In en, this message translates to:
  /// **'Continue with Naver'**
  String get continueWithNaver;

  /// Google login button alternate text
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// Account section title
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Delete account button
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// Delete account dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Account?'**
  String get deleteAccountTitle;

  /// Delete account confirmation message
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. All your data including trips, messages, and profile information will be permanently deleted.'**
  String get deleteAccountMessage;

  /// Delete confirmation input hint
  ///
  /// In en, this message translates to:
  /// **'Type DELETE to confirm'**
  String get deleteAccountConfirmation;

  /// Deleting account loading text
  ///
  /// In en, this message translates to:
  /// **'Deleting account...'**
  String get deletingAccount;

  /// Account deleted success message
  ///
  /// In en, this message translates to:
  /// **'Account deleted successfully'**
  String get accountDeleted;

  /// Account deletion failed message
  ///
  /// In en, this message translates to:
  /// **'Failed to delete account'**
  String get deleteAccountFailed;

  /// Delete account warning text
  ///
  /// In en, this message translates to:
  /// **'Warning: This will permanently delete your account and all associated data.'**
  String get deleteAccountWarning;

  /// Report message option
  ///
  /// In en, this message translates to:
  /// **'Report Message'**
  String get reportMessage;

  /// Report message description
  ///
  /// In en, this message translates to:
  /// **'Report inappropriate content to trip organizer'**
  String get reportMessageDescription;

  /// Block user option
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get blockUser;

  /// Block user description
  ///
  /// In en, this message translates to:
  /// **'You won\'t see messages from this user'**
  String get blockUserDescription;

  /// Report reason selection prompt
  ///
  /// In en, this message translates to:
  /// **'Select a reason for reporting:'**
  String get selectReportReason;

  /// Additional details field label
  ///
  /// In en, this message translates to:
  /// **'Additional Details'**
  String get additionalDetails;

  /// Optional description hint
  ///
  /// In en, this message translates to:
  /// **'Describe the issue (optional)'**
  String get optionalDescription;

  /// Report button
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// Block button
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// Spam report type
  ///
  /// In en, this message translates to:
  /// **'Spam'**
  String get reportTypeSpam;

  /// Harassment report type
  ///
  /// In en, this message translates to:
  /// **'Harassment'**
  String get reportTypeHarassment;

  /// Inappropriate content report type
  ///
  /// In en, this message translates to:
  /// **'Inappropriate Content'**
  String get reportTypeInappropriate;

  /// Hate speech report type
  ///
  /// In en, this message translates to:
  /// **'Hate Speech'**
  String get reportTypeHateSpeech;

  /// Violence report type
  ///
  /// In en, this message translates to:
  /// **'Violence'**
  String get reportTypeViolence;

  /// Other report type
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get reportTypeOther;

  /// Report submitted success message
  ///
  /// In en, this message translates to:
  /// **'Report submitted. The trip organizer will be notified.'**
  String get reportSubmitted;

  /// Report failed message
  ///
  /// In en, this message translates to:
  /// **'Failed to submit report. Please try again.'**
  String get reportFailed;

  /// Block user confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to block {userName}? You won\'t see their messages anymore.'**
  String blockUserConfirmation(String userName);

  /// User blocked success message
  ///
  /// In en, this message translates to:
  /// **'{userName} has been blocked'**
  String userBlocked(String userName);

  /// Block failed message
  ///
  /// In en, this message translates to:
  /// **'Failed to block user. Please try again.'**
  String get blockFailed;

  /// Blocked users settings title
  ///
  /// In en, this message translates to:
  /// **'Blocked Users'**
  String get blockedUsers;

  /// No blocked users message
  ///
  /// In en, this message translates to:
  /// **'No blocked users'**
  String get noBlockedUsers;

  /// Unblock button
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get unblock;

  /// User unblocked success message
  ///
  /// In en, this message translates to:
  /// **'{userName} has been unblocked'**
  String userUnblocked(String userName);

  /// Report user option
  ///
  /// In en, this message translates to:
  /// **'Report User'**
  String get reportUser;

  /// Report user description
  ///
  /// In en, this message translates to:
  /// **'Report this user to trip organizer'**
  String get reportUserDescription;

  /// Location permission denied message
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get locationPermissionDenied;

  /// Location permission permanently denied message
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied. Please enable in settings.'**
  String get locationPermissionDeniedForever;

  /// Location services disabled message
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled. Please enable location services.'**
  String get locationServicesDisabled;

  /// Getting location loading message
  ///
  /// In en, this message translates to:
  /// **'Getting your location...'**
  String get gettingLocation;

  /// Current location label
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get currentLocation;

  /// Share location title
  ///
  /// In en, this message translates to:
  /// **'Share Location'**
  String get shareLocation;

  /// Share location confirmation message
  ///
  /// In en, this message translates to:
  /// **'Do you want to share your current location with the group?'**
  String get shareLocationConfirmation;

  /// Share button
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// Upload failed message
  ///
  /// In en, this message translates to:
  /// **'Upload failed'**
  String get uploadFailed;

  /// Open in Google Maps option
  ///
  /// In en, this message translates to:
  /// **'Open in Google Maps'**
  String get openInGoogleMaps;

  /// Get directions option
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get getDirections;

  /// Driving directions option
  ///
  /// In en, this message translates to:
  /// **'Driving Directions'**
  String get drivingDirections;

  /// Walking directions option
  ///
  /// In en, this message translates to:
  /// **'Walking Directions'**
  String get walkingDirections;

  /// Transit directions option
  ///
  /// In en, this message translates to:
  /// **'Transit Directions'**
  String get transitDirections;

  /// No pinned messages message
  ///
  /// In en, this message translates to:
  /// **'No pinned messages yet'**
  String get noPinnedMessages;

  /// No itinerary message
  ///
  /// In en, this message translates to:
  /// **'No itinerary items yet'**
  String get noItineraryYet;

  /// View full itinerary button
  ///
  /// In en, this message translates to:
  /// **'View Full Itinerary'**
  String get viewFullItinerary;

  /// Invite participant title
  ///
  /// In en, this message translates to:
  /// **'Invite Participant'**
  String get inviteParticipant;

  /// Email address field
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// Email address placeholder
  ///
  /// In en, this message translates to:
  /// **'Enter email address'**
  String get enterEmailAddress;

  /// Invalid email error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// Role label
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// Permissions label
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissions;

  /// Send invite button
  ///
  /// In en, this message translates to:
  /// **'Send Invite'**
  String get sendInvite;

  /// Invite sent success message
  ///
  /// In en, this message translates to:
  /// **'Invite sent successfully'**
  String get inviteSent;

  /// Edit itinerary button
  ///
  /// In en, this message translates to:
  /// **'Edit Itinerary'**
  String get editItinerary;

  /// Delete itinerary button
  ///
  /// In en, this message translates to:
  /// **'Delete Itinerary'**
  String get deleteItinerary;

  /// Delete itinerary confirmation
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this itinerary item?'**
  String get deleteItineraryConfirm;

  /// Itinerary deleted message
  ///
  /// In en, this message translates to:
  /// **'Itinerary item deleted'**
  String get itineraryDeleted;

  /// Search places placeholder
  ///
  /// In en, this message translates to:
  /// **'Search places'**
  String get searchPlaces;

  /// Select location title
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get selectLocation;

  /// Confirm location button
  ///
  /// In en, this message translates to:
  /// **'Confirm Location'**
  String get confirmLocation;

  /// Hotel name field
  ///
  /// In en, this message translates to:
  /// **'Hotel Name'**
  String get hotelName;

  /// Room type field
  ///
  /// In en, this message translates to:
  /// **'Room Type'**
  String get roomType;

  /// Check-in time field
  ///
  /// In en, this message translates to:
  /// **'Check-in Time'**
  String get checkInTime;

  /// Check-out time field
  ///
  /// In en, this message translates to:
  /// **'Check-out Time'**
  String get checkOutTime;

  /// Car company field
  ///
  /// In en, this message translates to:
  /// **'Car Company'**
  String get carCompany;

  /// Car model field
  ///
  /// In en, this message translates to:
  /// **'Car Model'**
  String get carModel;

  /// Pickup location field
  ///
  /// In en, this message translates to:
  /// **'Pickup Location'**
  String get pickupLocation;

  /// Drop-off location field
  ///
  /// In en, this message translates to:
  /// **'Drop-off Location'**
  String get dropoffLocation;

  /// Pickup time field
  ///
  /// In en, this message translates to:
  /// **'Pickup Time'**
  String get pickupTime;

  /// Drop-off time field
  ///
  /// In en, this message translates to:
  /// **'Drop-off Time'**
  String get dropoffTime;

  /// Restaurant name field
  ///
  /// In en, this message translates to:
  /// **'Restaurant Name'**
  String get restaurantName;

  /// Cuisine field
  ///
  /// In en, this message translates to:
  /// **'Cuisine'**
  String get cuisine;

  /// Price range field
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// Reservation time field
  ///
  /// In en, this message translates to:
  /// **'Reservation Time'**
  String get reservationTime;

  /// Departure airport field
  ///
  /// In en, this message translates to:
  /// **'Departure Airport'**
  String get departureAirport;

  /// Arrival airport field
  ///
  /// In en, this message translates to:
  /// **'Arrival Airport'**
  String get arrivalAirport;

  /// Departure time field
  ///
  /// In en, this message translates to:
  /// **'Departure Time'**
  String get departureTime;

  /// Arrival time field
  ///
  /// In en, this message translates to:
  /// **'Arrival Time'**
  String get arrivalTime;

  /// Terminal field
  ///
  /// In en, this message translates to:
  /// **'Terminal'**
  String get terminal;

  /// Gate field
  ///
  /// In en, this message translates to:
  /// **'Gate'**
  String get gate;

  /// Confirmation number field
  ///
  /// In en, this message translates to:
  /// **'Confirmation Number'**
  String get confirmationNumber;

  /// Other category
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// Title field
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// Description field
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Item not found error
  ///
  /// In en, this message translates to:
  /// **'Item not found'**
  String get itemNotFound;

  /// Select day section title
  ///
  /// In en, this message translates to:
  /// **'Select Day'**
  String get selectDay;

  /// Airline selection hint
  ///
  /// In en, this message translates to:
  /// **'Select airline'**
  String get selectAirline;

  /// Notes hint in edit/add screen
  ///
  /// In en, this message translates to:
  /// **'Enter additional notes here'**
  String get enterNotesHint;

  /// Hotel name input hint
  ///
  /// In en, this message translates to:
  /// **'Enter hotel name'**
  String get enterHotelName;

  /// Room type input hint
  ///
  /// In en, this message translates to:
  /// **'e.g. Deluxe Twin'**
  String get enterRoomType;

  /// Address input hint
  ///
  /// In en, this message translates to:
  /// **'Enter address'**
  String get enterAddress;

  /// Confirmation number input hint
  ///
  /// In en, this message translates to:
  /// **'Enter confirmation number'**
  String get enterConfirmationNumber;

  /// Car company selection hint
  ///
  /// In en, this message translates to:
  /// **'Select car company'**
  String get selectCarCompany;

  /// Car model input hint
  ///
  /// In en, this message translates to:
  /// **'e.g. Hyundai Avante'**
  String get enterCarModel;

  /// Pickup location input hint
  ///
  /// In en, this message translates to:
  /// **'Enter pickup location'**
  String get enterPickupLocation;

  /// Dropoff location input hint
  ///
  /// In en, this message translates to:
  /// **'Enter drop-off location'**
  String get enterDropoffLocation;

  /// Pickup info section title
  ///
  /// In en, this message translates to:
  /// **'Pickup Info'**
  String get pickupInfo;

  /// Dropoff info section title
  ///
  /// In en, this message translates to:
  /// **'Drop-off Info'**
  String get dropoffInfo;

  /// Restaurant name input hint
  ///
  /// In en, this message translates to:
  /// **'Enter restaurant name'**
  String get enterRestaurantName;

  /// Cuisine type field label
  ///
  /// In en, this message translates to:
  /// **'Cuisine Type'**
  String get cuisineType;

  /// Cuisine type selection hint
  ///
  /// In en, this message translates to:
  /// **'Select cuisine type'**
  String get selectCuisineType;

  /// Reservation info section title
  ///
  /// In en, this message translates to:
  /// **'Reservation Info'**
  String get reservationInfo;

  /// Title input hint
  ///
  /// In en, this message translates to:
  /// **'Enter title'**
  String get enterTitle;

  /// Description input hint
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get enterDescription;

  /// Location input hint
  ///
  /// In en, this message translates to:
  /// **'Enter location'**
  String get enterLocation;

  /// Start time label
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// End time label
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get endTime;

  /// Add attachments section title
  ///
  /// In en, this message translates to:
  /// **'Add Attachments'**
  String get addAttachments;

  /// Attachment hint text
  ///
  /// In en, this message translates to:
  /// **'E-ticket, reservation confirmation, etc.'**
  String get attachmentHint;

  /// Item update success message
  ///
  /// In en, this message translates to:
  /// **'Item updated successfully'**
  String get itemUpdatedSuccess;

  /// Item delete success message
  ///
  /// In en, this message translates to:
  /// **'Item deleted successfully'**
  String get itemDeletedSuccess;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nl',
    'pl',
    'pt',
    'ru',
    'th',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
