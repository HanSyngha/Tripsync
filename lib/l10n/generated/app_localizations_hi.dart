// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'अपनी यात्रा शुरू करें';

  @override
  String get welcomeSubtitle => 'नए अनुभव खोजें और खास यादें बनाएं';

  @override
  String get skip => 'छोड़ें';

  @override
  String get participant => 'प्रतिभागी';

  @override
  String get host => 'होस्ट';

  @override
  String get coHost => 'सह-होस्ट';

  @override
  String get signInWithKakao => 'Kakao से जारी रखें';

  @override
  String get signInWithNaver => 'Naver से जारी रखें';

  @override
  String get signInWithGoogle => 'Google से जारी रखें';

  @override
  String get signInWithApple => 'Apple से जारी रखें';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'लॉग इन करके, आप हमारी $terms और $privacy से सहमत होते हैं।';
  }

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get welcomeBack => 'वापसी पर स्वागत है';

  @override
  String get readyForNextJourney => 'अपनी अगली यात्रा के लिए तैयार हैं?';

  @override
  String get allTrips => 'सभी यात्राएं';

  @override
  String get hosting => 'होस्टिंग';

  @override
  String get participating => 'भाग ले रहे हैं';

  @override
  String get happeningNow => 'अभी चल रहा है';

  @override
  String get upcomingAdventures => 'आगामी रोमांच';

  @override
  String get viewAll => 'सभी देखें';

  @override
  String dayOf(int current, int total) {
    return 'दिन $current / $total';
  }

  @override
  String get inProgress => 'जारी है';

  @override
  String get manage => 'प्रबंधित करें';

  @override
  String get guest => 'अतिथि';

  @override
  String get tbd => 'तय होना बाकी';

  @override
  String get home => 'होम';

  @override
  String get explore => 'एक्सप्लोर';

  @override
  String get chat => 'चैट';

  @override
  String get profile => 'प्रोफ़ाइल';

  @override
  String get createTrip => 'यात्रा बनाएं';

  @override
  String get letsplanYourJourney => 'आइए आपकी यात्रा की योजना बनाएं';

  @override
  String get hostCanEditLater =>
      'होस्ट के रूप में, आप इन विवरणों को बाद में कभी भी संपादित कर सकते हैं।';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get save => 'सहेजें';

  @override
  String get basicInfo => 'मूल जानकारी';

  @override
  String get required => 'आवश्यक';

  @override
  String get tripName => 'यात्रा का नाम';

  @override
  String get tripNameHint => 'जैसे क्योटो में गर्मी';

  @override
  String get destination => 'गंतव्य';

  @override
  String get destinationHint => 'आप कहां जा रहे हैं?';

  @override
  String get dates => 'तिथियां';

  @override
  String get startDate => 'आरंभ तिथि';

  @override
  String get endDate => 'समाप्ति तिथि';

  @override
  String get optionalDetails => 'वैकल्पिक विवरण';

  @override
  String get coverPhoto => 'कवर फ़ोटो';

  @override
  String get tapToUploadCover => 'कवर अपलोड करने के लिए टैप करें';

  @override
  String get tripGoalMemo => 'यात्रा का लक्ष्य / मेमो';

  @override
  String get tripGoalHint => 'इस यात्रा का मुख्य उद्देश्य क्या है?';

  @override
  String get nextStep => 'अगला कदम';

  @override
  String get participantManagement => 'प्रतिभागी प्रबंधन';

  @override
  String get participating_count => 'भाग ले रहे हैं';

  @override
  String get pendingInvites => 'लंबित आमंत्रण';

  @override
  String get inviteNewMember => 'नए सदस्य को आमंत्रित करें';

  @override
  String get searchByNameOrEmail => 'नाम या ईमेल से खोजें';

  @override
  String get hosts => 'होस्ट';

  @override
  String get admin => 'एडमिन';

  @override
  String get travelers => 'यात्री';

  @override
  String get allPermissions => 'सभी अनुमतियां';

  @override
  String get canEditSchedule => 'शेड्यूल संपादित कर सकते हैं';

  @override
  String get readOnly => 'केवल पढ़ने के लिए';

  @override
  String get pendingAcceptance => 'स्वीकृति लंबित';

  @override
  String get resend => 'पुनः भेजें';

  @override
  String get inviteLinkActivated => 'आमंत्रण लिंक सक्रिय';

  @override
  String get copy => 'कॉपी करें';

  @override
  String get allowScheduleEdit => 'शेड्यूल संपादन की अनुमति दें';

  @override
  String get allowPhotoUpload => 'फ़ोटो अपलोड की अनुमति दें';

  @override
  String get removeFromTrip => 'यात्रा से हटाएं';

  @override
  String joinedDaysAgo(int days) {
    return '$days दिन पहले शामिल हुए';
  }

  @override
  String get itinerary => 'यात्रा कार्यक्रम';

  @override
  String get organizerView => 'आयोजक दृश्य';

  @override
  String get draft => 'ड्राफ्ट';

  @override
  String days(int count) {
    return '$count दिन';
  }

  @override
  String day(int number) {
    return 'दिन $number';
  }

  @override
  String get addActivity => 'गतिविधि जोड़ें';

  @override
  String get schedule => 'शेड्यूल';

  @override
  String get map => 'नक्शा';

  @override
  String get people => 'लोग';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get flight => 'उड़ान';

  @override
  String get accommodation => 'आवास';

  @override
  String get rentalCar => 'किराये की कार';

  @override
  String get restaurant => 'रेस्तरां';

  @override
  String get attraction => 'आकर्षण';

  @override
  String get activity => 'गतिविधि';

  @override
  String get transportation => 'परिवहन';

  @override
  String get enterDetails => 'विवरण दर्ज करें';

  @override
  String get airline => 'एयरलाइन';

  @override
  String get flightNumber => 'उड़ान संख्या';

  @override
  String get departure => 'प्रस्थान';

  @override
  String get arrival => 'आगमन';

  @override
  String get notes => 'नोट्स';

  @override
  String get notesHint => 'यहां कोई भी महत्वपूर्ण नोट्स लिखें...';

  @override
  String get addAttachment => 'अटैचमेंट जोड़ें';

  @override
  String get eTicketOrVoucher => 'ई-टिकट या वाउचर (PDF, JPG)';

  @override
  String get reminderSettings => 'रिमाइंडर सेटिंग्स';

  @override
  String get reservationConfirmed => 'आरक्षण पुष्ट';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides गाइड - $members सदस्य';
  }

  @override
  String get guide => 'गाइड';

  @override
  String get organizer => 'आयोजक';

  @override
  String get messagePlaceholder => 'संदेश...';

  @override
  String get openMap => 'नक्शा खोलें';

  @override
  String get newAnnouncement => 'नई घोषणा';

  @override
  String get toWhom => 'किसको?';

  @override
  String get allParticipants => 'सभी प्रतिभागी';

  @override
  String get selectSpecific => 'विशिष्ट चुनें';

  @override
  String othersSelected(int count) {
    return '+ $count अन्य चयनित';
  }

  @override
  String get messageDetails => 'संदेश विवरण';

  @override
  String get nextSchedule => 'अगला शेड्यूल';

  @override
  String get urgent => 'अत्यावश्यक';

  @override
  String get generalInfo => 'सामान्य जानकारी';

  @override
  String get poll => 'मतदान';

  @override
  String get quickTemplates => 'त्वरित टेम्पलेट';

  @override
  String get templateBusLeaving => 'बस 10 मिनट में निकल रही है';

  @override
  String get templateMeetingPoint => 'मिलने का स्थान बदल गया';

  @override
  String get templateWeather => 'मौसम चेतावनी';

  @override
  String get templateDinner => 'रात्रि भोजन आरक्षण';

  @override
  String get subject => 'विषय';

  @override
  String get subjectHint => 'जैसे लॉबी में मिलें';

  @override
  String get message => 'संदेश';

  @override
  String get messageHint => 'अपनी घोषणा यहां लिखें...';

  @override
  String get addPhoto => 'फ़ोटो जोड़ें';

  @override
  String get addLocation => 'स्थान जोड़ें';

  @override
  String get pinToTopOfChat => 'चैट के शीर्ष पर पिन करें';

  @override
  String get keepVisibleForAll => 'सभी प्रतिभागियों के लिए दृश्यमान रखें';

  @override
  String get sendAsUrgentAlert => 'अत्यावश्यक अलर्ट के रूप में भेजें';

  @override
  String get notifiesEvenIfMuted => 'म्यूट होने पर भी सूचित करता है';

  @override
  String get sendNotification => 'सूचना भेजें';

  @override
  String get notifications => 'सूचनाएं';

  @override
  String get markAllAsRead => 'सभी को पढ़ा हुआ चिह्नित करें';

  @override
  String get all => 'सभी';

  @override
  String get announcements => 'घोषणाएं';

  @override
  String get today => 'आज';

  @override
  String get yesterday => 'कल';

  @override
  String get announcement => 'घोषणा';

  @override
  String get pastAnnouncement => 'पिछली घोषणा';

  @override
  String minutesAgo(int minutes) {
    return '$minutes मिनट पहले';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours घंटे पहले';
  }

  @override
  String get tripDetails => 'यात्रा विवरण';

  @override
  String nights(int count) {
    return '$count रातें';
  }

  @override
  String get hostedBy => 'द्वारा होस्ट किया गया';

  @override
  String get mapView => 'नक्शा दृश्य';

  @override
  String get groupChat => 'ग्रुप चैट';

  @override
  String get savedDocs => 'सहेजे गए दस्तावेज़';

  @override
  String get dontForget => 'मत भूलें!';

  @override
  String get overview => 'अवलोकन';

  @override
  String get expandAll => 'सभी विस्तृत करें';

  @override
  String get checkIn => 'चेक-इन';

  @override
  String get checkOut => 'चेक-आउट';

  @override
  String get directions => 'दिशाएं';

  @override
  String get reservation => 'आरक्षण';

  @override
  String get currentStatus => 'वर्तमान स्थिति';

  @override
  String tripStartsIn(int days) {
    return 'यात्रा $days दिनों में शुरू होगी';
  }

  @override
  String get accountAndPermissions => 'खाता और अनुमतियां';

  @override
  String get profileVisibility => 'प्रोफ़ाइल दृश्यता';

  @override
  String get displaySettings => 'प्रदर्शन सेटिंग्स';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get fontSize => 'फ़ॉन्ट आकार';

  @override
  String get standard => 'मानक';

  @override
  String get notificationSettings => 'सूचनाएं';

  @override
  String get tripScheduleNotifications => 'यात्रा शेड्यूल सूचनाएं';

  @override
  String get importantChangesPush => 'महत्वपूर्ण परिवर्तन पुश सूचनाएं';

  @override
  String get newMessageNotifications => 'नए संदेश की सूचनाएं';

  @override
  String get helpAndSupport => 'सहायता और समर्थन';

  @override
  String get appVersion => 'ऐप संस्करण';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get permissionRequired => 'अनुमति आवश्यक';

  @override
  String get notificationPermissionMessage =>
      'TripSync को आपको महत्वपूर्ण यात्रा अपडेट और आयोजकों की घोषणाएं भेजने के लिए सूचना अनुमति की आवश्यकता है।';

  @override
  String get allowNotifications => 'सूचनाओं की अनुमति दें';

  @override
  String get later => 'बाद में';

  @override
  String get error => 'त्रुटि';

  @override
  String get tryAgain => 'पुनः प्रयास करें';

  @override
  String get noTripsYet => 'अभी कोई यात्रा नहीं';

  @override
  String get createYourFirstTrip =>
      'अपनी पहली यात्रा बनाएं या किसी में शामिल हों!';

  @override
  String get noNotifications => 'कोई सूचना नहीं';

  @override
  String get youreAllCaughtUp => 'आप सब कुछ देख चुके हैं!';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get connectionError => 'कनेक्शन त्रुटि';

  @override
  String get checkYourInternet => 'कृपया अपना इंटरनेट कनेक्शन जांचें';

  @override
  String get confirmDelete => 'हटाने की पुष्टि करें';

  @override
  String get deleteConfirmMessage => 'क्या आप वाकई इसे हटाना चाहते हैं?';

  @override
  String get delete => 'हटाएं';

  @override
  String get confirm => 'पुष्टि करें';

  @override
  String get done => 'हो गया';

  @override
  String get edit => 'संपादित करें';

  @override
  String get close => 'बंद करें';

  @override
  String get back => 'वापस';

  @override
  String get next => 'अगला';

  @override
  String get search => 'खोजें';

  @override
  String get noResults => 'कोई परिणाम नहीं मिला';

  @override
  String get selectDate => 'तिथि चुनें';

  @override
  String get selectTime => 'समय चुनें';

  @override
  String get from => 'से';

  @override
  String get to => 'तक';

  @override
  String get duration => 'अवधि';

  @override
  String get location => 'स्थान';

  @override
  String get address => 'पता';

  @override
  String get phone => 'फ़ोन';

  @override
  String get email => 'ईमेल';

  @override
  String get website => 'वेबसाइट';

  @override
  String get price => 'मूल्य';

  @override
  String get viewMenu => 'मेन्यू देखें';

  @override
  String get recommended => 'अनुशंसित';

  @override
  String get hiking => 'पैदल यात्रा';

  @override
  String get warning => 'चेतावनी';

  @override
  String get viewDetails => 'विवरण देखें';

  @override
  String get readyForYour => 'क्या आप तैयार हैं';

  @override
  String get nextJourney => 'अपनी अगली यात्रा के लिए?';

  @override
  String get createFirstTrip => 'अपनी पहली यात्रा बनाएं या किसी में शामिल हों!';

  @override
  String get language => 'भाषा';

  @override
  String get changePhoto => 'फ़ोटो बदलें';

  @override
  String get takePhoto => 'फ़ोटो लें';

  @override
  String get chooseFromGallery => 'गैलरी से चुनें';

  @override
  String get removePhoto => 'फ़ोटो हटाएं';

  @override
  String get displayName => 'प्रदर्शन नाम';

  @override
  String get enterDisplayName => 'अपना प्रदर्शन नाम दर्ज करें';

  @override
  String get enterPhoneNumber => 'अपना फ़ोन नंबर दर्ज करें';

  @override
  String get displayNameRequired => 'प्रदर्शन नाम आवश्यक है';

  @override
  String get displayNameMinLength =>
      'प्रदर्शन नाम कम से कम 2 अक्षर का होना चाहिए';

  @override
  String get profileUpdated => 'प्रोफ़ाइल सफलतापूर्वक अपडेट की गई';

  @override
  String get failedToUpdateProfile => 'प्रोफ़ाइल अपडेट करने में विफल';

  @override
  String get failedToPickImage => 'छवि चुनने में विफल';

  @override
  String get logoutConfirmation => 'क्या आप वाकई लॉग आउट करना चाहते हैं?';

  @override
  String get earlier => 'पहले';

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
  String get account => 'खाता';

  @override
  String get deleteAccount => 'खाता हटाएं';

  @override
  String get deleteAccountTitle => 'खाता हटाएं';

  @override
  String get deleteAccountMessage =>
      'क्या आप वाकई अपना खाता हटाना चाहते हैं? यह क्रिया अपरिवर्तनीय है और आपका सारा डेटा स्थायी रूप से हटा दिया जाएगा।';

  @override
  String get deleteAccountConfirmation => 'पुष्टि के लिए \'हटाएं\' टाइप करें';

  @override
  String get deletingAccount => 'खाता हटाया जा रहा है...';

  @override
  String get accountDeleted => 'खाता सफलतापूर्वक हटा दिया गया';

  @override
  String get deleteAccountFailed => 'खाता हटाने में विफल';

  @override
  String get deleteAccountWarning =>
      'चेतावनी: इस क्रिया को पूर्ववत नहीं किया जा सकता। यात्राओं और संदेशों सहित आपका सारा डेटा स्थायी रूप से हटा दिया जाएगा।';
}
