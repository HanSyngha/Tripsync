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
  String get discardTrip => 'यात्रा त्यागें?';

  @override
  String get discardTripMessage =>
      'क्या आप वाकई इस यात्रा को त्यागना चाहते हैं? सभी परिवर्तन खो जाएंगे।';

  @override
  String get discardChanges => 'परिवर्तन त्यागें?';

  @override
  String get discardChangesMessage =>
      'क्या आप वाकई अपने परिवर्तन त्यागना चाहते हैं?';

  @override
  String get keepEditing => 'संपादन जारी रखें';

  @override
  String get discard => 'त्यागें';

  @override
  String get tripCreatedSuccess => 'यात्रा सफलतापूर्वक बनाई गई!';

  @override
  String get tripUpdatedSuccess => 'यात्रा सफलतापूर्वक अपडेट की गई!';

  @override
  String get tripNotFound => 'यात्रा नहीं मिली';

  @override
  String get itinerarySaved => 'यात्रा कार्यक्रम सहेजा गया';

  @override
  String get comingSoon => 'जल्द आ रहा है';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get viewParticipants => 'प्रतिभागियों को देखें';

  @override
  String get pinnedMessages => 'पिन किए गए संदेश';

  @override
  String get searchMessages => 'संदेश खोजें';

  @override
  String get sendAnnouncement => 'घोषणा भेजें';

  @override
  String get photo => 'फ़ोटो';

  @override
  String get camera => 'कैमरा';

  @override
  String get sharePhotosFromGallery => 'गैलरी से फ़ोटो साझा करें';

  @override
  String get takeNewPhoto => 'नई फ़ोटो लें';

  @override
  String get shareCurrentLocation => 'अपना वर्तमान स्थान साझा करें';

  @override
  String get featureComingSoon => 'सुविधा जल्द आ रही है!';

  @override
  String get activityAddedSuccess => 'गतिविधि सफलतापूर्वक जोड़ी गई';

  @override
  String get filePickerComingSoon => 'फ़ाइल चयनकर्ता जल्द आ रहा है';

  @override
  String get pleaseEnterMessage => 'कृपया एक संदेश दर्ज करें';

  @override
  String get announcementSentSuccess => 'घोषणा सफलतापूर्वक भेजी गई!';

  @override
  String get failedToLoadParticipants => 'प्रतिभागियों को लोड करने में विफल';

  @override
  String get loginRequired => 'लॉगिन आवश्यक';

  @override
  String get inviteSendFailed =>
      'आमंत्रण भेजने में विफल। कृपया पुनः प्रयास करें।';

  @override
  String get newInviteLinkGenerated => 'नया आमंत्रण लिंक उत्पन्न हुआ';

  @override
  String get inviteLinkCopied => 'आमंत्रण लिंक कॉपी किया गया';

  @override
  String get userNotFound => 'उपयोगकर्ता नहीं मिला';

  @override
  String get noDestination => 'कोई गंतव्य नहीं';

  @override
  String get loginTitle => 'स्वागत है';

  @override
  String get loginSubtitle => 'अपनी यात्रा शुरू करने के लिए साइन इन करें';

  @override
  String get continueWithKakao => 'Kakao के साथ जारी रखें';

  @override
  String get continueWithNaver => 'Naver के साथ जारी रखें';

  @override
  String get continueWithGoogle => 'Google के साथ जारी रखें';

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

  @override
  String get reportMessage => 'संदेश की रिपोर्ट करें';

  @override
  String get reportMessageDescription =>
      'यात्रा आयोजक को अनुचित सामग्री की रिपोर्ट करें';

  @override
  String get blockUser => 'उपयोगकर्ता को ब्लॉक करें';

  @override
  String get blockUserDescription => 'आप इस उपयोगकर्ता के संदेश नहीं देखेंगे';

  @override
  String get selectReportReason => 'रिपोर्ट का कारण चुनें:';

  @override
  String get additionalDetails => 'अतिरिक्त विवरण';

  @override
  String get optionalDescription => 'समस्या का वर्णन करें (वैकल्पिक)';

  @override
  String get report => 'रिपोर्ट करें';

  @override
  String get block => 'ब्लॉक करें';

  @override
  String get reportTypeSpam => 'स्पैम';

  @override
  String get reportTypeHarassment => 'उत्पीड़न';

  @override
  String get reportTypeInappropriate => 'अनुचित सामग्री';

  @override
  String get reportTypeHateSpeech => 'घृणा भाषण';

  @override
  String get reportTypeViolence => 'हिंसा';

  @override
  String get reportTypeOther => 'अन्य';

  @override
  String get reportSubmitted =>
      'रिपोर्ट भेजी गई। यात्रा आयोजक को सूचित किया जाएगा।';

  @override
  String get reportFailed => 'रिपोर्ट भेजने में विफल। कृपया पुनः प्रयास करें।';

  @override
  String blockUserConfirmation(String userName) {
    return 'क्या आप वाकई $userName को ब्लॉक करना चाहते हैं? आप उनके संदेश नहीं देख पाएंगे।';
  }

  @override
  String userBlocked(String userName) {
    return '$userName को ब्लॉक कर दिया गया';
  }

  @override
  String get blockFailed =>
      'उपयोगकर्ता को ब्लॉक करने में विफल। कृपया पुनः प्रयास करें।';

  @override
  String get blockedUsers => 'ब्लॉक किए गए उपयोगकर्ता';

  @override
  String get noBlockedUsers => 'कोई ब्लॉक किए गए उपयोगकर्ता नहीं';

  @override
  String get unblock => 'अनब्लॉक करें';

  @override
  String userUnblocked(String userName) {
    return '$userName को अनब्लॉक कर दिया गया';
  }

  @override
  String get reportUser => 'उपयोगकर्ता की रिपोर्ट करें';

  @override
  String get reportUserDescription =>
      'इस उपयोगकर्ता की यात्रा आयोजक को रिपोर्ट करें';

  @override
  String get locationPermissionDenied => 'स्थान अनुमति अस्वीकार';

  @override
  String get locationPermissionDeniedForever =>
      'स्थान अनुमति स्थायी रूप से अस्वीकार। कृपया सेटिंग्स में सक्षम करें।';

  @override
  String get locationServicesDisabled => 'स्थान सेवाएं अक्षम';

  @override
  String get gettingLocation => 'स्थान प्राप्त कर रहे हैं...';

  @override
  String get currentLocation => 'वर्तमान स्थान';

  @override
  String get shareLocation => 'स्थान साझा करें';

  @override
  String get shareLocationConfirmation =>
      'क्या आप इस स्थान को चैट में साझा करना चाहते हैं?';

  @override
  String get share => 'साझा करें';

  @override
  String get uploadFailed => 'अपलोड विफल';

  @override
  String get openInGoogleMaps => 'Google Maps में खोलें';

  @override
  String get getDirections => 'दिशा-निर्देश प्राप्त करें';

  @override
  String get drivingDirections => 'ड्राइविंग दिशा-निर्देश';

  @override
  String get walkingDirections => 'पैदल दिशा-निर्देश';

  @override
  String get transitDirections => 'सार्वजनिक परिवहन दिशा-निर्देश';

  @override
  String get noPinnedMessages => 'कोई पिन किए गए संदेश नहीं';

  @override
  String get noItineraryYet => 'अभी तक कोई यात्रा कार्यक्रम नहीं';

  @override
  String get viewFullItinerary => 'पूरा यात्रा कार्यक्रम देखें';

  @override
  String get inviteParticipant => 'प्रतिभागी को आमंत्रित करें';

  @override
  String get emailAddress => 'ईमेल पता';

  @override
  String get enterEmailAddress => 'ईमेल पता दर्ज करें';

  @override
  String get invalidEmail => 'अमान्य ईमेल';

  @override
  String get role => 'भूमिका';

  @override
  String get permissions => 'अनुमतियाँ';

  @override
  String get sendInvite => 'आमंत्रण भेजें';

  @override
  String get inviteSent => 'आमंत्रण भेजा गया';

  @override
  String get editItinerary => 'यात्रा कार्यक्रम संपादित करें';

  @override
  String get deleteItinerary => 'यात्रा कार्यक्रम हटाएं';

  @override
  String get deleteItineraryConfirm =>
      'क्या आप वाकई इस यात्रा कार्यक्रम को हटाना चाहते हैं?';

  @override
  String get itineraryDeleted => 'यात्रा कार्यक्रम हटाया गया';

  @override
  String get searchPlaces => 'स्थान खोजें';

  @override
  String get selectLocation => 'स्थान चुनें';

  @override
  String get confirmLocation => 'स्थान की पुष्टि करें';

  @override
  String get hotelName => 'होटल का नाम';

  @override
  String get roomType => 'कमरे का प्रकार';

  @override
  String get checkInTime => 'चेक-इन समय';

  @override
  String get checkOutTime => 'चेक-आउट समय';

  @override
  String get carCompany => 'कार किराये की कंपनी';

  @override
  String get carModel => 'कार मॉडल';

  @override
  String get pickupLocation => 'पिकअप स्थान';

  @override
  String get dropoffLocation => 'ड्रॉप-ऑफ स्थान';

  @override
  String get pickupTime => 'पिकअप समय';

  @override
  String get dropoffTime => 'ड्रॉप-ऑफ समय';

  @override
  String get restaurantName => 'रेस्तरां का नाम';

  @override
  String get cuisine => 'व्यंजन';

  @override
  String get priceRange => 'मूल्य सीमा';

  @override
  String get reservationTime => 'आरक्षण समय';

  @override
  String get departureAirport => 'प्रस्थान हवाई अड्डा';

  @override
  String get arrivalAirport => 'आगमन हवाई अड्डा';

  @override
  String get departureTime => 'प्रस्थान समय';

  @override
  String get arrivalTime => 'आगमन समय';

  @override
  String get terminal => 'टर्मिनल';

  @override
  String get gate => 'गेट';

  @override
  String get confirmationNumber => 'पुष्टिकरण संख्या';

  @override
  String get other => 'अन्य';

  @override
  String get title => 'शीर्षक';

  @override
  String get description => 'विवरण';

  @override
  String get itemNotFound => 'आइटम नहीं मिला';

  @override
  String get selectDay => 'दिन चुनें';

  @override
  String get selectAirline => 'एयरलाइन चुनें';

  @override
  String get enterNotesHint => 'अतिरिक्त नोट्स दर्ज करें';

  @override
  String get enterHotelName => 'होटल का नाम दर्ज करें';

  @override
  String get enterRoomType => 'उदा: डीलक्स सुइट';

  @override
  String get enterAddress => 'पता दर्ज करें';

  @override
  String get enterConfirmationNumber => 'पुष्टिकरण संख्या दर्ज करें';

  @override
  String get selectCarCompany => 'कार किराया कंपनी चुनें';

  @override
  String get enterCarModel => 'उदा: टोयोटा कैमरी';

  @override
  String get enterPickupLocation => 'पिकअप स्थान दर्ज करें';

  @override
  String get enterDropoffLocation => 'ड्रॉप-ऑफ स्थान दर्ज करें';

  @override
  String get pickupInfo => 'पिकअप जानकारी';

  @override
  String get dropoffInfo => 'ड्रॉप-ऑफ जानकारी';

  @override
  String get enterRestaurantName => 'रेस्तरां का नाम दर्ज करें';

  @override
  String get cuisineType => 'व्यंजन प्रकार';

  @override
  String get selectCuisineType => 'व्यंजन प्रकार चुनें';

  @override
  String get reservationInfo => 'आरक्षण जानकारी';

  @override
  String get enterTitle => 'शीर्षक दर्ज करें';

  @override
  String get enterDescription => 'विवरण दर्ज करें';

  @override
  String get enterLocation => 'स्थान दर्ज करें';

  @override
  String get startTime => 'प्रारंभ समय';

  @override
  String get endTime => 'समाप्ति समय';

  @override
  String get addAttachments => 'अनुलग्नक जोड़ें';

  @override
  String get attachmentHint => 'ई-टिकट, आरक्षण पुष्टि, आदि।';

  @override
  String get itemUpdatedSuccess => 'आइटम सफलतापूर्वक अपडेट किया गया';

  @override
  String get itemDeletedSuccess => 'आइटम सफलतापूर्वक हटाया गया';
}
