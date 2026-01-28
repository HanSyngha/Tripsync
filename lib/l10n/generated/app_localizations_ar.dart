// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'تريب سينك';

  @override
  String get welcomeTitle => 'ابدأ رحلتك';

  @override
  String get welcomeSubtitle => 'اكتشف تجارب جديدة واصنع ذكريات مميزة';

  @override
  String get skip => 'تخطي';

  @override
  String get participant => 'مشارك';

  @override
  String get host => 'المضيف';

  @override
  String get coHost => 'المضيف المشارك';

  @override
  String get signInWithKakao => 'المتابعة مع كاكاو';

  @override
  String get signInWithNaver => 'المتابعة مع نيفر';

  @override
  String get signInWithGoogle => 'المتابعة مع جوجل';

  @override
  String get signInWithApple => 'المتابعة مع أبل';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'بتسجيل الدخول، فإنك توافق على $terms و$privacy.';
  }

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get welcomeBack => 'مرحباً بعودتك';

  @override
  String get readyForNextJourney => 'هل أنت مستعد لرحلتك القادمة؟';

  @override
  String get allTrips => 'جميع الرحلات';

  @override
  String get hosting => 'استضافة';

  @override
  String get participating => 'مشاركة';

  @override
  String get happeningNow => 'يحدث الآن';

  @override
  String get upcomingAdventures => 'المغامرات القادمة';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String dayOf(int current, int total) {
    return 'اليوم $current من $total';
  }

  @override
  String get inProgress => 'قيد التنفيذ';

  @override
  String get manage => 'إدارة';

  @override
  String get guest => 'ضيف';

  @override
  String get tbd => 'سيُحدد لاحقاً';

  @override
  String get home => 'الرئيسية';

  @override
  String get explore => 'استكشاف';

  @override
  String get chat => 'المحادثات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get createTrip => 'إنشاء رحلة';

  @override
  String get letsplanYourJourney => 'لنخطط لرحلتك';

  @override
  String get hostCanEditLater =>
      'بصفتك المضيف، يمكنك تعديل هذه التفاصيل لاحقاً في أي وقت.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get basicInfo => 'المعلومات الأساسية';

  @override
  String get required => 'مطلوب';

  @override
  String get tripName => 'اسم الرحلة';

  @override
  String get tripNameHint => 'مثال: صيف في كيوتو';

  @override
  String get destination => 'الوجهة';

  @override
  String get destinationHint => 'إلى أين تذهب؟';

  @override
  String get dates => 'التواريخ';

  @override
  String get startDate => 'تاريخ البداية';

  @override
  String get endDate => 'تاريخ النهاية';

  @override
  String get optionalDetails => 'تفاصيل اختيارية';

  @override
  String get coverPhoto => 'صورة الغلاف';

  @override
  String get tapToUploadCover => 'اضغط لرفع الغلاف';

  @override
  String get tripGoalMemo => 'هدف الرحلة / ملاحظات';

  @override
  String get tripGoalHint => 'ما هو الهدف الرئيسي من هذه الرحلة؟';

  @override
  String get nextStep => 'الخطوة التالية';

  @override
  String get participantManagement => 'إدارة المشاركين';

  @override
  String get participating_count => 'مشارك';

  @override
  String get pendingInvites => 'دعوات معلقة';

  @override
  String get inviteNewMember => 'دعوة عضو جديد';

  @override
  String get searchByNameOrEmail => 'البحث بالاسم أو البريد الإلكتروني';

  @override
  String get hosts => 'المضيفون';

  @override
  String get admin => 'مسؤول';

  @override
  String get travelers => 'المسافرون';

  @override
  String get allPermissions => 'جميع الصلاحيات';

  @override
  String get canEditSchedule => 'يمكنه تعديل الجدول';

  @override
  String get readOnly => 'قراءة فقط';

  @override
  String get pendingAcceptance => 'في انتظار القبول';

  @override
  String get resend => 'إعادة إرسال';

  @override
  String get inviteLinkActivated => 'تم تفعيل رابط الدعوة';

  @override
  String get copy => 'نسخ';

  @override
  String get allowScheduleEdit => 'السماح بتعديل الجدول';

  @override
  String get allowPhotoUpload => 'السماح برفع الصور';

  @override
  String get removeFromTrip => 'إزالة من الرحلة';

  @override
  String joinedDaysAgo(int days) {
    return 'انضم منذ $days أيام';
  }

  @override
  String get itinerary => 'خط السير';

  @override
  String get organizerView => 'عرض المنظم';

  @override
  String get draft => 'مسودة';

  @override
  String days(int count) {
    return '$count أيام';
  }

  @override
  String day(int number) {
    return 'اليوم $number';
  }

  @override
  String get addActivity => 'إضافة نشاط';

  @override
  String get schedule => 'الجدول';

  @override
  String get map => 'الخريطة';

  @override
  String get people => 'الأشخاص';

  @override
  String get settings => 'الإعدادات';

  @override
  String get flight => 'الطيران';

  @override
  String get accommodation => 'الإقامة';

  @override
  String get rentalCar => 'سيارة مستأجرة';

  @override
  String get restaurant => 'مطعم';

  @override
  String get attraction => 'معلم سياحي';

  @override
  String get activity => 'نشاط';

  @override
  String get transportation => 'المواصلات';

  @override
  String get enterDetails => 'أدخل التفاصيل';

  @override
  String get airline => 'شركة الطيران';

  @override
  String get flightNumber => 'رقم الرحلة';

  @override
  String get departure => 'المغادرة';

  @override
  String get arrival => 'الوصول';

  @override
  String get notes => 'ملاحظات';

  @override
  String get notesHint => 'اكتب أي ملاحظات مهمة هنا...';

  @override
  String get addAttachment => 'إضافة مرفق';

  @override
  String get eTicketOrVoucher => 'تذكرة إلكترونية أو قسيمة (PDF، JPG)';

  @override
  String get reminderSettings => 'إعدادات التذكير';

  @override
  String get reservationConfirmed => 'تم تأكيد الحجز';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides مرشد - $members أعضاء';
  }

  @override
  String get guide => 'مرشد';

  @override
  String get organizer => 'المنظم';

  @override
  String get messagePlaceholder => 'رسالة...';

  @override
  String get openMap => 'فتح الخريطة';

  @override
  String get newAnnouncement => 'إعلان جديد';

  @override
  String get toWhom => 'إلى من؟';

  @override
  String get allParticipants => 'جميع المشاركين';

  @override
  String get selectSpecific => 'اختيار محدد';

  @override
  String othersSelected(int count) {
    return '+ $count آخرون محددون';
  }

  @override
  String get messageDetails => 'تفاصيل الرسالة';

  @override
  String get nextSchedule => 'الجدول التالي';

  @override
  String get urgent => 'عاجل';

  @override
  String get generalInfo => 'معلومات عامة';

  @override
  String get poll => 'استطلاع';

  @override
  String get quickTemplates => 'قوالب سريعة';

  @override
  String get templateBusLeaving => 'الحافلة تغادر خلال 10 دقائق';

  @override
  String get templateMeetingPoint => 'تم تغيير نقطة الالتقاء';

  @override
  String get templateWeather => 'تنبيه الطقس';

  @override
  String get templateDinner => 'حجوزات العشاء';

  @override
  String get subject => 'الموضوع';

  @override
  String get subjectHint => 'مثال: الاجتماع في الردهة';

  @override
  String get message => 'الرسالة';

  @override
  String get messageHint => 'اكتب إعلانك هنا...';

  @override
  String get addPhoto => 'إضافة صورة';

  @override
  String get addLocation => 'إضافة موقع';

  @override
  String get pinToTopOfChat => 'تثبيت أعلى المحادثة';

  @override
  String get keepVisibleForAll => 'إبقاءه مرئياً لجميع المشاركين';

  @override
  String get sendAsUrgentAlert => 'إرسال كتنبيه عاجل';

  @override
  String get notifiesEvenIfMuted => 'يُرسل إشعاراً حتى لو كان مكتوماً';

  @override
  String get sendNotification => 'إرسال الإشعار';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get markAllAsRead => 'تحديد الكل كمقروء';

  @override
  String get all => 'الكل';

  @override
  String get announcements => 'الإعلانات';

  @override
  String get today => 'اليوم';

  @override
  String get yesterday => 'أمس';

  @override
  String get announcement => 'إعلان';

  @override
  String get pastAnnouncement => 'إعلان سابق';

  @override
  String minutesAgo(int minutes) {
    return 'منذ $minutes دقيقة';
  }

  @override
  String hoursAgo(int hours) {
    return 'منذ $hours ساعات';
  }

  @override
  String get tripDetails => 'تفاصيل الرحلة';

  @override
  String nights(int count) {
    return '$count ليالي';
  }

  @override
  String get hostedBy => 'بواسطة';

  @override
  String get mapView => 'عرض الخريطة';

  @override
  String get groupChat => 'المحادثة الجماعية';

  @override
  String get savedDocs => 'المستندات المحفوظة';

  @override
  String get dontForget => 'لا تنسَ!';

  @override
  String get overview => 'نظرة عامة';

  @override
  String get expandAll => 'توسيع الكل';

  @override
  String get checkIn => 'تسجيل الوصول';

  @override
  String get checkOut => 'تسجيل المغادرة';

  @override
  String get directions => 'الاتجاهات';

  @override
  String get reservation => 'الحجز';

  @override
  String get currentStatus => 'الحالة الحالية';

  @override
  String tripStartsIn(int days) {
    return 'تبدأ الرحلة خلال $days أيام';
  }

  @override
  String get accountAndPermissions => 'الحساب والصلاحيات';

  @override
  String get profileVisibility => 'ظهور الملف الشخصي';

  @override
  String get displaySettings => 'إعدادات العرض';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get fontSize => 'حجم الخط';

  @override
  String get standard => 'قياسي';

  @override
  String get notificationSettings => 'الإشعارات';

  @override
  String get tripScheduleNotifications => 'إشعارات جدول الرحلة';

  @override
  String get importantChangesPush => 'إشعارات فورية للتغييرات المهمة';

  @override
  String get newMessageNotifications => 'إشعارات الرسائل الجديدة';

  @override
  String get helpAndSupport => 'المساعدة والدعم';

  @override
  String get appVersion => 'إصدار التطبيق';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get permissionRequired => 'مطلوب إذن';

  @override
  String get notificationPermissionMessage =>
      'يحتاج تريب سينك إلى إذن الإشعارات لإرسال تحديثات الرحلة المهمة والإعلانات من المنظمين.';

  @override
  String get allowNotifications => 'السماح بالإشعارات';

  @override
  String get later => 'لاحقاً';

  @override
  String get error => 'خطأ';

  @override
  String get tryAgain => 'حاول مرة أخرى';

  @override
  String get noTripsYet => 'لا توجد رحلات بعد';

  @override
  String get createYourFirstTrip => 'أنشئ رحلتك الأولى أو انضم إلى واحدة!';

  @override
  String get noNotifications => 'لا توجد إشعارات';

  @override
  String get youreAllCaughtUp => 'أنت على اطلاع بكل شيء!';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get connectionError => 'خطأ في الاتصال';

  @override
  String get checkYourInternet => 'يرجى التحقق من اتصالك بالإنترنت';

  @override
  String get confirmDelete => 'تأكيد الحذف';

  @override
  String get deleteConfirmMessage => 'هل أنت متأكد من رغبتك في حذف هذا؟';

  @override
  String get delete => 'حذف';

  @override
  String get confirm => 'تأكيد';

  @override
  String get done => 'تم';

  @override
  String get edit => 'تعديل';

  @override
  String get close => 'إغلاق';

  @override
  String get back => 'رجوع';

  @override
  String get next => 'التالي';

  @override
  String get search => 'بحث';

  @override
  String get noResults => 'لم يتم العثور على نتائج';

  @override
  String get noMapLocations => 'No locations to display on map';

  @override
  String get noMapLocationsHint => 'Add locations to your itinerary to see them on the map';

  @override
  String get selectDate => 'اختر التاريخ';

  @override
  String get selectTime => 'اختر الوقت';

  @override
  String get from => 'من';

  @override
  String get to => 'إلى';

  @override
  String get duration => 'المدة';

  @override
  String get location => 'الموقع';

  @override
  String get address => 'العنوان';

  @override
  String get phone => 'الهاتف';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get website => 'الموقع الإلكتروني';

  @override
  String get price => 'السعر';

  @override
  String get viewMenu => 'عرض القائمة';

  @override
  String get recommended => 'موصى به';

  @override
  String get hiking => 'المشي لمسافات طويلة';

  @override
  String get warning => 'تحذير';

  @override
  String get viewDetails => 'عرض التفاصيل';

  @override
  String get readyForYour => 'هل أنت مستعد';

  @override
  String get nextJourney => 'لرحلتك القادمة؟';

  @override
  String get createFirstTrip => 'أنشئ رحلتك الأولى أو انضم إلى واحدة!';

  @override
  String get language => 'اللغة';

  @override
  String get changePhoto => 'تغيير الصورة';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get chooseFromGallery => 'اختيار من المعرض';

  @override
  String get removePhoto => 'إزالة الصورة';

  @override
  String get displayName => 'اسم العرض';

  @override
  String get enterDisplayName => 'أدخل اسم العرض';

  @override
  String get enterPhoneNumber => 'أدخل رقم الهاتف';

  @override
  String get displayNameRequired => 'اسم العرض مطلوب';

  @override
  String get displayNameMinLength => 'يجب أن يكون الاسم حرفين على الأقل';

  @override
  String get profileUpdated => 'تم تحديث الملف الشخصي بنجاح';

  @override
  String get failedToUpdateProfile => 'فشل تحديث الملف الشخصي';

  @override
  String get failedToPickImage => 'فشل اختيار الصورة';

  @override
  String get logoutConfirmation => 'هل أنت متأكد من تسجيل الخروج؟';

  @override
  String get earlier => 'سابقاً';

  @override
  String get discardTrip => 'تجاهل الرحلة؟';

  @override
  String get discardTripMessage =>
      'هل أنت متأكد أنك تريد تجاهل هذه الرحلة؟ سيتم فقدان جميع التغييرات.';

  @override
  String get discardChanges => 'تجاهل التغييرات؟';

  @override
  String get discardChangesMessage => 'هل أنت متأكد أنك تريد تجاهل تغييراتك؟';

  @override
  String get keepEditing => 'متابعة التعديل';

  @override
  String get discard => 'تجاهل';

  @override
  String get tripCreatedSuccess => 'تم إنشاء الرحلة بنجاح!';

  @override
  String get tripUpdatedSuccess => 'تم تحديث الرحلة بنجاح!';

  @override
  String get tripNotFound => 'الرحلة غير موجودة';

  @override
  String get itinerarySaved => 'تم حفظ خط الرحلة';

  @override
  String get comingSoon => 'قريباً';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get viewParticipants => 'عرض المشاركين';

  @override
  String get pinnedMessages => 'الرسائل المثبتة';

  @override
  String get searchMessages => 'البحث في الرسائل';

  @override
  String get sendAnnouncement => 'إرسال إعلان';

  @override
  String get photo => 'صورة';

  @override
  String get camera => 'الكاميرا';

  @override
  String get sharePhotosFromGallery => 'مشاركة الصور من المعرض';

  @override
  String get takeNewPhoto => 'التقاط صورة جديدة';

  @override
  String get shareCurrentLocation => 'مشاركة موقعك الحالي';

  @override
  String get featureComingSoon => 'الميزة قريباً!';

  @override
  String get activityAddedSuccess => 'تمت إضافة النشاط بنجاح';

  @override
  String get filePickerComingSoon => 'منتقي الملفات قريباً';

  @override
  String get pleaseEnterMessage => 'يرجى إدخال رسالة';

  @override
  String get announcementSentSuccess => 'تم إرسال الإعلان بنجاح!';

  @override
  String get failedToLoadParticipants => 'فشل تحميل المشاركين';

  @override
  String get loginRequired => 'تسجيل الدخول مطلوب';

  @override
  String get inviteSendFailed => 'فشل إرسال الدعوة. يرجى المحاولة مرة أخرى.';

  @override
  String get newInviteLinkGenerated => 'تم إنشاء رابط دعوة جديد';

  @override
  String get inviteLinkCopied => 'تم نسخ رابط الدعوة';

  @override
  String get userNotFound => 'المستخدم غير موجود';

  @override
  String get noDestination => 'لا يوجد وجهة';

  @override
  String get loginTitle => 'مرحباً';

  @override
  String get loginSubtitle => 'سجل دخولك لبدء رحلتك';

  @override
  String get continueWithKakao => 'المتابعة مع كاكاو';

  @override
  String get continueWithNaver => 'المتابعة مع نيفر';

  @override
  String get continueWithGoogle => 'المتابعة مع جوجل';

  @override
  String get account => 'الحساب';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get deleteAccountTitle => 'حذف الحساب';

  @override
  String get deleteAccountMessage =>
      'هل أنت متأكد من رغبتك في حذف حسابك؟ هذا الإجراء لا رجعة فيه وسيتم حذف جميع بياناتك نهائياً.';

  @override
  String get deleteAccountConfirmation => 'اكتب \'حذف\' للتأكيد';

  @override
  String get deletingAccount => 'جاري حذف الحساب...';

  @override
  String get accountDeleted => 'تم حذف الحساب بنجاح';

  @override
  String get deleteAccountFailed => 'فشل حذف الحساب';

  @override
  String get deleteAccountWarning =>
      'تحذير: لا يمكن التراجع عن هذا الإجراء. سيتم حذف جميع بياناتك بما في ذلك الرحلات والرسائل نهائياً.';

  @override
  String get reportMessage => 'الإبلاغ عن الرسالة';

  @override
  String get reportMessageDescription =>
      'الإبلاغ عن محتوى غير لائق لمنظم الرحلة';

  @override
  String get blockUser => 'حظر المستخدم';

  @override
  String get blockUserDescription => 'لن تشاهد رسائل من هذا المستخدم بعد الآن';

  @override
  String get selectReportReason => 'اختر سبب الإبلاغ:';

  @override
  String get additionalDetails => 'تفاصيل إضافية';

  @override
  String get optionalDescription => 'صف المشكلة (اختياري)';

  @override
  String get report => 'إبلاغ';

  @override
  String get block => 'حظر';

  @override
  String get reportTypeSpam => 'رسائل مزعجة';

  @override
  String get reportTypeHarassment => 'مضايقة';

  @override
  String get reportTypeInappropriate => 'محتوى غير لائق';

  @override
  String get reportTypeHateSpeech => 'خطاب كراهية';

  @override
  String get reportTypeViolence => 'عنف';

  @override
  String get reportTypeOther => 'أخرى';

  @override
  String get reportSubmitted => 'تم إرسال البلاغ. سيتم إخطار منظم الرحلة.';

  @override
  String get reportFailed => 'فشل في إرسال البلاغ. يرجى المحاولة مرة أخرى.';

  @override
  String blockUserConfirmation(String userName) {
    return 'هل أنت متأكد من أنك تريد حظر $userName؟ لن تشاهد رسائلهم بعد الآن.';
  }

  @override
  String userBlocked(String userName) {
    return 'تم حظر $userName';
  }

  @override
  String get blockFailed => 'فشل في حظر المستخدم. يرجى المحاولة مرة أخرى.';

  @override
  String get blockedUsers => 'المستخدمون المحظورون';

  @override
  String get noBlockedUsers => 'لا يوجد مستخدمون محظورون';

  @override
  String get unblock => 'إلغاء الحظر';

  @override
  String userUnblocked(String userName) {
    return 'تم إلغاء حظر $userName';
  }

  @override
  String get reportUser => 'الإبلاغ عن المستخدم';

  @override
  String get reportUserDescription => 'الإبلاغ عن هذا المستخدم لمنظم الرحلة';

  @override
  String get locationPermissionDenied => 'تم رفض إذن الموقع';

  @override
  String get locationPermissionDeniedForever =>
      'تم رفض إذن الموقع نهائياً. يرجى تفعيله من الإعدادات.';

  @override
  String get locationServicesDisabled => 'خدمات الموقع معطلة';

  @override
  String get gettingLocation => 'جاري الحصول على الموقع...';

  @override
  String get currentLocation => 'الموقع الحالي';

  @override
  String get shareLocation => 'مشاركة الموقع';

  @override
  String get shareLocationConfirmation =>
      'هل تريد مشاركة هذا الموقع في الدردشة؟';

  @override
  String get share => 'مشاركة';

  @override
  String get uploadFailed => 'فشل الرفع';

  @override
  String get openInGoogleMaps => 'فتح في خرائط جوجل';

  @override
  String get getDirections => 'الحصول على الاتجاهات';

  @override
  String get drivingDirections => 'اتجاهات القيادة';

  @override
  String get walkingDirections => 'اتجاهات المشي';

  @override
  String get transitDirections => 'اتجاهات وسائل النقل العام';

  @override
  String get noPinnedMessages => 'لا توجد رسائل مثبتة';

  @override
  String get noItineraryYet => 'لا يوجد جدول رحلة حتى الآن';

  @override
  String get viewFullItinerary => 'عرض جدول الرحلة الكامل';

  @override
  String get inviteParticipant => 'دعوة مشارك';

  @override
  String get emailAddress => 'عنوان البريد الإلكتروني';

  @override
  String get enterEmailAddress => 'أدخل عنوان البريد الإلكتروني';

  @override
  String get invalidEmail => 'بريد إلكتروني غير صالح';

  @override
  String get role => 'الدور';

  @override
  String get permissions => 'الصلاحيات';

  @override
  String get sendInvite => 'إرسال الدعوة';

  @override
  String get inviteSent => 'تم إرسال الدعوة';

  @override
  String get editItinerary => 'تعديل جدول الرحلة';

  @override
  String get deleteItinerary => 'حذف جدول الرحلة';

  @override
  String get deleteItineraryConfirm => 'هل أنت متأكد من حذف جدول الرحلة هذا؟';

  @override
  String get itineraryDeleted => 'تم حذف جدول الرحلة';

  @override
  String get searchPlaces => 'البحث عن أماكن';

  @override
  String get selectLocation => 'اختيار الموقع';

  @override
  String get confirmLocation => 'تأكيد الموقع';

  @override
  String get hotelName => 'اسم الفندق';

  @override
  String get roomType => 'نوع الغرفة';

  @override
  String get checkInTime => 'وقت تسجيل الوصول';

  @override
  String get checkOutTime => 'وقت تسجيل المغادرة';

  @override
  String get carCompany => 'شركة التأجير';

  @override
  String get carModel => 'موديل السيارة';

  @override
  String get pickupLocation => 'موقع الاستلام';

  @override
  String get dropoffLocation => 'موقع التسليم';

  @override
  String get pickupTime => 'وقت الاستلام';

  @override
  String get dropoffTime => 'وقت التسليم';

  @override
  String get restaurantName => 'اسم المطعم';

  @override
  String get cuisine => 'نوع المطبخ';

  @override
  String get priceRange => 'نطاق الأسعار';

  @override
  String get reservationTime => 'وقت الحجز';

  @override
  String get departureAirport => 'مطار المغادرة';

  @override
  String get arrivalAirport => 'مطار الوصول';

  @override
  String get departureTime => 'وقت المغادرة';

  @override
  String get arrivalTime => 'وقت الوصول';

  @override
  String get terminal => 'الصالة';

  @override
  String get gate => 'البوابة';

  @override
  String get confirmationNumber => 'رقم التأكيد';

  @override
  String get other => 'أخرى';

  @override
  String get title => 'العنوان';

  @override
  String get description => 'الوصف';

  @override
  String get itemNotFound => 'العنصر غير موجود';

  @override
  String get selectDay => 'اختر اليوم';

  @override
  String get selectAirline => 'اختر شركة الطيران';

  @override
  String get enterNotesHint => 'أدخل ملاحظات إضافية';

  @override
  String get enterHotelName => 'أدخل اسم الفندق';

  @override
  String get enterRoomType => 'مثال: جناح فاخر';

  @override
  String get enterAddress => 'أدخل العنوان';

  @override
  String get enterConfirmationNumber => 'أدخل رقم التأكيد';

  @override
  String get selectCarCompany => 'اختر شركة تأجير السيارات';

  @override
  String get enterCarModel => 'مثال: تويوتا كامري';

  @override
  String get enterPickupLocation => 'أدخل موقع الاستلام';

  @override
  String get enterDropoffLocation => 'أدخل موقع التسليم';

  @override
  String get pickupInfo => 'معلومات الاستلام';

  @override
  String get dropoffInfo => 'معلومات التسليم';

  @override
  String get enterRestaurantName => 'أدخل اسم المطعم';

  @override
  String get cuisineType => 'نوع المطبخ';

  @override
  String get selectCuisineType => 'اختر نوع المطبخ';

  @override
  String get reservationInfo => 'معلومات الحجز';

  @override
  String get enterTitle => 'أدخل العنوان';

  @override
  String get enterDescription => 'أدخل الوصف';

  @override
  String get enterLocation => 'أدخل الموقع';

  @override
  String get startTime => 'وقت البدء';

  @override
  String get endTime => 'وقت الانتهاء';

  @override
  String get addAttachments => 'إضافة مرفقات';

  @override
  String get attachmentHint => 'التذكرة الإلكترونية، تأكيد الحجز، إلخ.';

  @override
  String get itemUpdatedSuccess => 'تم تحديث العنصر بنجاح';

  @override
  String get itemDeletedSuccess => 'تم حذف العنصر بنجاح';
}
