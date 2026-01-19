// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'เริ่มต้นการเดินทางของคุณ';

  @override
  String get welcomeSubtitle => 'ค้นพบประสบการณ์ใหม่และสร้างความทรงจำพิเศษ';

  @override
  String get skip => 'ข้าม';

  @override
  String get participant => 'ผู้เข้าร่วม';

  @override
  String get host => 'ผู้จัด';

  @override
  String get coHost => 'ผู้ช่วยจัด';

  @override
  String get signInWithKakao => 'ดำเนินการต่อด้วย Kakao';

  @override
  String get signInWithNaver => 'ดำเนินการต่อด้วย Naver';

  @override
  String get signInWithGoogle => 'ดำเนินการต่อด้วย Google';

  @override
  String get signInWithApple => 'ดำเนินการต่อด้วย Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'การเข้าสู่ระบบหมายความว่าคุณยอมรับ $terms และ $privacy ของเรา';
  }

  @override
  String get termsOfService => 'ข้อกำหนดการใช้งาน';

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get welcomeBack => 'ยินดีต้อนรับกลับ';

  @override
  String get readyForNextJourney => 'พร้อมสำหรับการเดินทางครั้งต่อไปหรือยัง?';

  @override
  String get allTrips => 'ทริปทั้งหมด';

  @override
  String get hosting => 'ที่จัด';

  @override
  String get participating => 'ที่เข้าร่วม';

  @override
  String get happeningNow => 'กำลังเกิดขึ้น';

  @override
  String get upcomingAdventures => 'การผจญภัยที่กำลังจะมาถึง';

  @override
  String get viewAll => 'ดูทั้งหมด';

  @override
  String dayOf(int current, int total) {
    return 'วันที่ $current จาก $total';
  }

  @override
  String get inProgress => 'กำลังดำเนินการ';

  @override
  String get manage => 'จัดการ';

  @override
  String get guest => 'แขก';

  @override
  String get tbd => 'ยังไม่กำหนด';

  @override
  String get home => 'หน้าหลัก';

  @override
  String get explore => 'สำรวจ';

  @override
  String get chat => 'แชท';

  @override
  String get profile => 'โปรไฟล์';

  @override
  String get createTrip => 'สร้างทริป';

  @override
  String get letsplanYourJourney => 'มาวางแผนการเดินทางของคุณกันเถอะ';

  @override
  String get hostCanEditLater =>
      'ในฐานะผู้จัด คุณสามารถแก้ไขรายละเอียดเหล่านี้ได้ทุกเมื่อ';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get save => 'บันทึก';

  @override
  String get basicInfo => 'ข้อมูลพื้นฐาน';

  @override
  String get required => 'จำเป็น';

  @override
  String get tripName => 'ชื่อทริป';

  @override
  String get tripNameHint => 'เช่น ฤดูร้อนที่เกียวโต';

  @override
  String get destination => 'จุดหมายปลายทาง';

  @override
  String get destinationHint => 'คุณจะไปที่ไหน?';

  @override
  String get dates => 'วันที่';

  @override
  String get startDate => 'วันเริ่มต้น';

  @override
  String get endDate => 'วันสิ้นสุด';

  @override
  String get optionalDetails => 'รายละเอียดเพิ่มเติม';

  @override
  String get coverPhoto => 'รูปปก';

  @override
  String get tapToUploadCover => 'แตะเพื่ออัปโหลดรูปปก';

  @override
  String get tripGoalMemo => 'เป้าหมายทริป / บันทึก';

  @override
  String get tripGoalHint => 'เป้าหมายหลักของทริปนี้คืออะไร?';

  @override
  String get nextStep => 'ขั้นตอนถัดไป';

  @override
  String get participantManagement => 'จัดการผู้เข้าร่วม';

  @override
  String get participating_count => 'ที่เข้าร่วม';

  @override
  String get pendingInvites => 'คำเชิญที่รอดำเนินการ';

  @override
  String get inviteNewMember => 'เชิญสมาชิกใหม่';

  @override
  String get searchByNameOrEmail => 'ค้นหาด้วยชื่อหรืออีเมล';

  @override
  String get hosts => 'ผู้จัด';

  @override
  String get admin => 'ผู้ดูแล';

  @override
  String get travelers => 'นักเดินทาง';

  @override
  String get allPermissions => 'สิทธิ์ทั้งหมด';

  @override
  String get canEditSchedule => 'แก้ไขกำหนดการได้';

  @override
  String get readOnly => 'ดูได้อย่างเดียว';

  @override
  String get pendingAcceptance => 'รอการตอบรับ';

  @override
  String get resend => 'ส่งอีกครั้ง';

  @override
  String get inviteLinkActivated => 'ลิงก์เชิญเปิดใช้งานแล้ว';

  @override
  String get copy => 'คัดลอก';

  @override
  String get allowScheduleEdit => 'อนุญาตให้แก้ไขกำหนดการ';

  @override
  String get allowPhotoUpload => 'อนุญาตให้อัปโหลดรูปภาพ';

  @override
  String get removeFromTrip => 'ลบออกจากทริป';

  @override
  String joinedDaysAgo(int days) {
    return 'เข้าร่วมเมื่อ $days วันที่แล้ว';
  }

  @override
  String get itinerary => 'กำหนดการเดินทาง';

  @override
  String get organizerView => 'มุมมองผู้จัด';

  @override
  String get draft => 'ร่าง';

  @override
  String days(int count) {
    return '$count วัน';
  }

  @override
  String day(int number) {
    return 'วันที่ $number';
  }

  @override
  String get addActivity => 'เพิ่มกิจกรรม';

  @override
  String get schedule => 'กำหนดการ';

  @override
  String get map => 'แผนที่';

  @override
  String get people => 'ผู้คน';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get flight => 'เที่ยวบิน';

  @override
  String get accommodation => 'ที่พัก';

  @override
  String get rentalCar => 'รถเช่า';

  @override
  String get restaurant => 'ร้านอาหาร';

  @override
  String get attraction => 'สถานที่ท่องเที่ยว';

  @override
  String get activity => 'กิจกรรม';

  @override
  String get transportation => 'การเดินทาง';

  @override
  String get enterDetails => 'กรอกรายละเอียด';

  @override
  String get airline => 'สายการบิน';

  @override
  String get flightNumber => 'หมายเลขเที่ยวบิน';

  @override
  String get departure => 'ออกเดินทาง';

  @override
  String get arrival => 'ถึงที่หมาย';

  @override
  String get notes => 'บันทึก';

  @override
  String get notesHint => 'เขียนบันทึกสำคัญที่นี่...';

  @override
  String get addAttachment => 'เพิ่มไฟล์แนบ';

  @override
  String get eTicketOrVoucher => 'ตั๋วอิเล็กทรอนิกส์หรือบัตรกำนัล (PDF, JPG)';

  @override
  String get reminderSettings => 'การตั้งค่าการแจ้งเตือน';

  @override
  String get reservationConfirmed => 'ยืนยันการจองแล้ว';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides ไกด์ - $members สมาชิก';
  }

  @override
  String get guide => 'ไกด์';

  @override
  String get organizer => 'ผู้จัด';

  @override
  String get messagePlaceholder => 'ข้อความ...';

  @override
  String get openMap => 'เปิดแผนที่';

  @override
  String get newAnnouncement => 'ประกาศใหม่';

  @override
  String get toWhom => 'ถึงใคร?';

  @override
  String get allParticipants => 'ผู้เข้าร่วมทั้งหมด';

  @override
  String get selectSpecific => 'เลือกเฉพาะ';

  @override
  String othersSelected(int count) {
    return '+ เลือกอีก $count คน';
  }

  @override
  String get messageDetails => 'รายละเอียดข้อความ';

  @override
  String get nextSchedule => 'กำหนดการถัดไป';

  @override
  String get urgent => 'ด่วน';

  @override
  String get generalInfo => 'ข้อมูลทั่วไป';

  @override
  String get poll => 'โพล';

  @override
  String get quickTemplates => 'เทมเพลตด่วน';

  @override
  String get templateBusLeaving => 'รถบัสออกใน 10 นาที';

  @override
  String get templateMeetingPoint => 'เปลี่ยนจุดนัดพบ';

  @override
  String get templateWeather => 'แจ้งเตือนสภาพอากาศ';

  @override
  String get templateDinner => 'การจองอาหารเย็น';

  @override
  String get subject => 'หัวข้อ';

  @override
  String get subjectHint => 'เช่น พบกันที่ล็อบบี้';

  @override
  String get message => 'ข้อความ';

  @override
  String get messageHint => 'เขียนประกาศของคุณที่นี่...';

  @override
  String get addPhoto => 'เพิ่มรูปภาพ';

  @override
  String get addLocation => 'เพิ่มตำแหน่ง';

  @override
  String get pinToTopOfChat => 'ปักหมุดไว้ด้านบนแชท';

  @override
  String get keepVisibleForAll => 'แสดงให้ผู้เข้าร่วมทุกคนเห็น';

  @override
  String get sendAsUrgentAlert => 'ส่งเป็นการแจ้งเตือนด่วน';

  @override
  String get notifiesEvenIfMuted => 'แจ้งเตือนแม้ปิดเสียงอยู่';

  @override
  String get sendNotification => 'ส่งการแจ้งเตือน';

  @override
  String get notifications => 'การแจ้งเตือน';

  @override
  String get markAllAsRead => 'ทำเครื่องหมายว่าอ่านแล้วทั้งหมด';

  @override
  String get all => 'ทั้งหมด';

  @override
  String get announcements => 'ประกาศ';

  @override
  String get today => 'วันนี้';

  @override
  String get yesterday => 'เมื่อวาน';

  @override
  String get announcement => 'ประกาศ';

  @override
  String get pastAnnouncement => 'ประกาศที่ผ่านมา';

  @override
  String minutesAgo(int minutes) {
    return '$minutes นาทีที่แล้ว';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours ชั่วโมงที่แล้ว';
  }

  @override
  String get tripDetails => 'รายละเอียดทริป';

  @override
  String nights(int count) {
    return '$count คืน';
  }

  @override
  String get hostedBy => 'จัดโดย';

  @override
  String get mapView => 'ดูแผนที่';

  @override
  String get groupChat => 'แชทกลุ่ม';

  @override
  String get savedDocs => 'เอกสารที่บันทึก';

  @override
  String get dontForget => 'อย่าลืม!';

  @override
  String get overview => 'ภาพรวม';

  @override
  String get expandAll => 'ขยายทั้งหมด';

  @override
  String get checkIn => 'เช็คอิน';

  @override
  String get checkOut => 'เช็คเอาท์';

  @override
  String get directions => 'เส้นทาง';

  @override
  String get reservation => 'การจอง';

  @override
  String get currentStatus => 'สถานะปัจจุบัน';

  @override
  String tripStartsIn(int days) {
    return 'ทริปเริ่มใน $days วัน';
  }

  @override
  String get accountAndPermissions => 'บัญชีและสิทธิ์';

  @override
  String get profileVisibility => 'การมองเห็นโปรไฟล์';

  @override
  String get displaySettings => 'การตั้งค่าการแสดงผล';

  @override
  String get darkMode => 'โหมดมืด';

  @override
  String get fontSize => 'ขนาดตัวอักษร';

  @override
  String get standard => 'มาตรฐาน';

  @override
  String get notificationSettings => 'การแจ้งเตือน';

  @override
  String get tripScheduleNotifications => 'การแจ้งเตือนกำหนดการทริป';

  @override
  String get importantChangesPush =>
      'การแจ้งเตือนแบบพุชสำหรับการเปลี่ยนแปลงสำคัญ';

  @override
  String get newMessageNotifications => 'การแจ้งเตือนข้อความใหม่';

  @override
  String get helpAndSupport => 'ช่วยเหลือและสนับสนุน';

  @override
  String get appVersion => 'เวอร์ชันแอป';

  @override
  String get logout => 'ออกจากระบบ';

  @override
  String get permissionRequired => 'ต้องการสิทธิ์';

  @override
  String get notificationPermissionMessage =>
      'TripSync ต้องการสิทธิ์การแจ้งเตือนเพื่อส่งข้อมูลทริปสำคัญและประกาศจากผู้จัดถึงคุณ';

  @override
  String get allowNotifications => 'อนุญาตการแจ้งเตือน';

  @override
  String get later => 'ภายหลัง';

  @override
  String get error => 'ข้อผิดพลาด';

  @override
  String get tryAgain => 'ลองอีกครั้ง';

  @override
  String get noTripsYet => 'ยังไม่มีทริป';

  @override
  String get createYourFirstTrip => 'สร้างทริปแรกของคุณหรือเข้าร่วมทริป!';

  @override
  String get noNotifications => 'ไม่มีการแจ้งเตือน';

  @override
  String get youreAllCaughtUp => 'คุณดูครบหมดแล้ว!';

  @override
  String get loading => 'กำลังโหลด...';

  @override
  String get connectionError => 'ข้อผิดพลาดการเชื่อมต่อ';

  @override
  String get checkYourInternet => 'กรุณาตรวจสอบการเชื่อมต่ออินเทอร์เน็ตของคุณ';

  @override
  String get confirmDelete => 'ยืนยันการลบ';

  @override
  String get deleteConfirmMessage => 'คุณแน่ใจหรือไม่ว่าต้องการลบสิ่งนี้?';

  @override
  String get delete => 'ลบ';

  @override
  String get confirm => 'ยืนยัน';

  @override
  String get done => 'เสร็จสิ้น';

  @override
  String get edit => 'แก้ไข';

  @override
  String get close => 'ปิด';

  @override
  String get back => 'ย้อนกลับ';

  @override
  String get next => 'ถัดไป';

  @override
  String get search => 'ค้นหา';

  @override
  String get noResults => 'ไม่พบผลลัพธ์';

  @override
  String get selectDate => 'เลือกวันที่';

  @override
  String get selectTime => 'เลือกเวลา';

  @override
  String get from => 'จาก';

  @override
  String get to => 'ถึง';

  @override
  String get duration => 'ระยะเวลา';

  @override
  String get location => 'ตำแหน่ง';

  @override
  String get address => 'ที่อยู่';

  @override
  String get phone => 'โทรศัพท์';

  @override
  String get email => 'อีเมล';

  @override
  String get website => 'เว็บไซต์';

  @override
  String get price => 'ราคา';

  @override
  String get viewMenu => 'ดูเมนู';

  @override
  String get recommended => 'แนะนำ';

  @override
  String get hiking => 'เดินป่า';

  @override
  String get warning => 'คำเตือน';

  @override
  String get viewDetails => 'ดูรายละเอียด';

  @override
  String get readyForYour => 'พร้อมสำหรับ';

  @override
  String get nextJourney => 'การเดินทางครั้งต่อไป?';

  @override
  String get createFirstTrip => 'สร้างทริปแรกของคุณหรือเข้าร่วมทริป!';

  @override
  String get language => 'ภาษา';

  @override
  String get changePhoto => 'เปลี่ยนรูปภาพ';

  @override
  String get takePhoto => 'ถ่ายรูป';

  @override
  String get chooseFromGallery => 'เลือกจากแกลเลอรี่';

  @override
  String get removePhoto => 'ลบรูปภาพ';

  @override
  String get displayName => 'ชื่อที่แสดง';

  @override
  String get enterDisplayName => 'กรอกชื่อที่แสดงของคุณ';

  @override
  String get enterPhoneNumber => 'กรอกหมายเลขโทรศัพท์ของคุณ';

  @override
  String get displayNameRequired => 'ต้องระบุชื่อที่แสดง';

  @override
  String get displayNameMinLength => 'ชื่อที่แสดงต้องมีอย่างน้อย 2 ตัวอักษร';

  @override
  String get profileUpdated => 'อัปเดตโปรไฟล์สำเร็จแล้ว';

  @override
  String get failedToUpdateProfile => 'ไม่สามารถอัปเดตโปรไฟล์ได้';

  @override
  String get failedToPickImage => 'ไม่สามารถเลือกรูปภาพได้';

  @override
  String get logoutConfirmation => 'คุณแน่ใจหรือไม่ว่าต้องการออกจากระบบ?';

  @override
  String get earlier => 'ก่อนหน้านี้';

  @override
  String get discardTrip => 'ยกเลิกทริป?';

  @override
  String get discardTripMessage =>
      'คุณแน่ใจหรือไม่ว่าต้องการยกเลิกทริปนี้? การเปลี่ยนแปลงทั้งหมดจะหายไป';

  @override
  String get discardChanges => 'ยกเลิกการเปลี่ยนแปลง?';

  @override
  String get discardChangesMessage =>
      'คุณแน่ใจหรือไม่ว่าต้องการยกเลิกการเปลี่ยนแปลงของคุณ?';

  @override
  String get keepEditing => 'แก้ไขต่อ';

  @override
  String get discard => 'ยกเลิก';

  @override
  String get tripCreatedSuccess => 'สร้างทริปสำเร็จ!';

  @override
  String get tripUpdatedSuccess => 'อัปเดตทริปสำเร็จ!';

  @override
  String get tripNotFound => 'ไม่พบทริป';

  @override
  String get itinerarySaved => 'บันทึกแผนการเดินทางแล้ว';

  @override
  String get comingSoon => 'เร็วๆ นี้';

  @override
  String get signOut => 'ออกจากระบบ';

  @override
  String get retry => 'ลองใหม่';

  @override
  String get viewParticipants => 'ดูผู้เข้าร่วม';

  @override
  String get pinnedMessages => 'ข้อความที่ปักหมุด';

  @override
  String get searchMessages => 'ค้นหาข้อความ';

  @override
  String get sendAnnouncement => 'ส่งประกาศ';

  @override
  String get photo => 'รูปภาพ';

  @override
  String get camera => 'กล้อง';

  @override
  String get sharePhotosFromGallery => 'แชร์รูปภาพจากแกลเลอรี';

  @override
  String get takeNewPhoto => 'ถ่ายรูปใหม่';

  @override
  String get shareCurrentLocation => 'แชร์ตำแหน่งปัจจุบัน';

  @override
  String get featureComingSoon => 'ฟีเจอร์เร็วๆ นี้!';

  @override
  String get activityAddedSuccess => 'เพิ่มกิจกรรมสำเร็จ';

  @override
  String get filePickerComingSoon => 'ตัวเลือกไฟล์เร็วๆ นี้';

  @override
  String get pleaseEnterMessage => 'กรุณาใส่ข้อความ';

  @override
  String get announcementSentSuccess => 'ส่งประกาศสำเร็จ!';

  @override
  String get failedToLoadParticipants => 'โหลดผู้เข้าร่วมไม่สำเร็จ';

  @override
  String get loginRequired => 'ต้องเข้าสู่ระบบ';

  @override
  String get inviteSendFailed => 'ส่งคำเชิญไม่สำเร็จ กรุณาลองใหม่';

  @override
  String get newInviteLinkGenerated => 'สร้างลิงก์เชิญใหม่แล้ว';

  @override
  String get inviteLinkCopied => 'คัดลอกลิงก์เชิญแล้ว';

  @override
  String get userNotFound => 'ไม่พบผู้ใช้';

  @override
  String get noDestination => 'ไม่มีจุดหมายปลายทาง';

  @override
  String get loginTitle => 'ยินดีต้อนรับ';

  @override
  String get loginSubtitle => 'เข้าสู่ระบบเพื่อเริ่มการเดินทาง';

  @override
  String get continueWithKakao => 'ดำเนินการต่อด้วย Kakao';

  @override
  String get continueWithNaver => 'ดำเนินการต่อด้วย Naver';

  @override
  String get continueWithGoogle => 'ดำเนินการต่อด้วย Google';

  @override
  String get account => 'บัญชี';

  @override
  String get deleteAccount => 'ลบบัญชี';

  @override
  String get deleteAccountTitle => 'ลบบัญชี';

  @override
  String get deleteAccountMessage =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบบัญชีของคุณ? การดำเนินการนี้ไม่สามารถย้อนกลับได้และข้อมูลทั้งหมดของคุณจะถูกลบอย่างถาวร';

  @override
  String get deleteAccountConfirmation => 'พิมพ์ \'ลบ\' เพื่อยืนยัน';

  @override
  String get deletingAccount => 'กำลังลบบัญชี...';

  @override
  String get accountDeleted => 'ลบบัญชีสำเร็จแล้ว';

  @override
  String get deleteAccountFailed => 'ไม่สามารถลบบัญชีได้';

  @override
  String get deleteAccountWarning =>
      'คำเตือน: การดำเนินการนี้ไม่สามารถยกเลิกได้ ข้อมูลทั้งหมดของคุณรวมถึงทริปและข้อความจะถูกลบอย่างถาวร';

  @override
  String get reportMessage => 'รายงานข้อความ';

  @override
  String get reportMessageDescription =>
      'รายงานเนื้อหาที่ไม่เหมาะสมต่อผู้จัดทริป';

  @override
  String get blockUser => 'บล็อกผู้ใช้';

  @override
  String get blockUserDescription =>
      'คุณจะไม่เห็นข้อความจากผู้ใช้รายนี้อีกต่อไป';

  @override
  String get selectReportReason => 'เลือกเหตุผลในการรายงาน:';

  @override
  String get additionalDetails => 'รายละเอียดเพิ่มเติม';

  @override
  String get optionalDescription => 'อธิบายปัญหา (ไม่บังคับ)';

  @override
  String get report => 'รายงาน';

  @override
  String get block => 'บล็อก';

  @override
  String get reportTypeSpam => 'สแปม';

  @override
  String get reportTypeHarassment => 'การล่วงละเมิด';

  @override
  String get reportTypeInappropriate => 'เนื้อหาไม่เหมาะสม';

  @override
  String get reportTypeHateSpeech => 'ถ้อยคำแห่งความเกลียดชัง';

  @override
  String get reportTypeViolence => 'ความรุนแรง';

  @override
  String get reportTypeOther => 'อื่นๆ';

  @override
  String get reportSubmitted => 'ส่งรายงานแล้ว ผู้จัดทริปจะได้รับแจ้ง';

  @override
  String get reportFailed => 'ไม่สามารถส่งรายงานได้ กรุณาลองใหม่อีกครั้ง';

  @override
  String blockUserConfirmation(String userName) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการบล็อก $userName? คุณจะไม่เห็นข้อความของพวกเขาอีกต่อไป';
  }

  @override
  String userBlocked(String userName) {
    return 'บล็อก $userName แล้ว';
  }

  @override
  String get blockFailed => 'ไม่สามารถบล็อกผู้ใช้ได้ กรุณาลองใหม่อีกครั้ง';

  @override
  String get blockedUsers => 'ผู้ใช้ที่ถูกบล็อก';

  @override
  String get noBlockedUsers => 'ไม่มีผู้ใช้ที่ถูกบล็อก';

  @override
  String get unblock => 'เลิกบล็อก';

  @override
  String userUnblocked(String userName) {
    return 'เลิกบล็อก $userName แล้ว';
  }

  @override
  String get reportUser => 'รายงานผู้ใช้';

  @override
  String get reportUserDescription => 'รายงานผู้ใช้รายนี้ต่อผู้จัดทริป';

  @override
  String get locationPermissionDenied => 'การอนุญาตตำแหน่งถูกปฏิเสธ';

  @override
  String get locationPermissionDeniedForever =>
      'การอนุญาตตำแหน่งถูกปฏิเสธถาวร กรุณาเปิดใช้งานในการตั้งค่า';

  @override
  String get locationServicesDisabled => 'บริการตำแหน่งถูกปิดใช้งาน';

  @override
  String get gettingLocation => 'กำลังรับตำแหน่ง...';

  @override
  String get currentLocation => 'ตำแหน่งปัจจุบัน';

  @override
  String get shareLocation => 'แชร์ตำแหน่ง';

  @override
  String get shareLocationConfirmation =>
      'คุณต้องการแชร์ตำแหน่งนี้ในแชทหรือไม่?';

  @override
  String get share => 'แชร์';

  @override
  String get uploadFailed => 'อัปโหลดล้มเหลว';

  @override
  String get openInGoogleMaps => 'เปิดใน Google Maps';

  @override
  String get getDirections => 'รับเส้นทาง';

  @override
  String get drivingDirections => 'เส้นทางขับรถ';

  @override
  String get walkingDirections => 'เส้นทางเดิน';

  @override
  String get transitDirections => 'เส้นทางขนส่งสาธารณะ';

  @override
  String get noPinnedMessages => 'ไม่มีข้อความที่ปักหมุด';

  @override
  String get noItineraryYet => 'ยังไม่มีแผนการเดินทาง';

  @override
  String get viewFullItinerary => 'ดูแผนการเดินทางเต็ม';

  @override
  String get inviteParticipant => 'เชิญผู้เข้าร่วม';

  @override
  String get emailAddress => 'ที่อยู่อีเมล';

  @override
  String get enterEmailAddress => 'กรอกที่อยู่อีเมล';

  @override
  String get invalidEmail => 'อีเมลไม่ถูกต้อง';

  @override
  String get role => 'บทบาท';

  @override
  String get permissions => 'สิทธิ์';

  @override
  String get sendInvite => 'ส่งคำเชิญ';

  @override
  String get inviteSent => 'ส่งคำเชิญแล้ว';

  @override
  String get editItinerary => 'แก้ไขแผนการเดินทาง';

  @override
  String get deleteItinerary => 'ลบแผนการเดินทาง';

  @override
  String get deleteItineraryConfirm =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบแผนการเดินทางนี้?';

  @override
  String get itineraryDeleted => 'ลบแผนการเดินทางแล้ว';

  @override
  String get searchPlaces => 'ค้นหาสถานที่';

  @override
  String get selectLocation => 'เลือกตำแหน่ง';

  @override
  String get confirmLocation => 'ยืนยันตำแหน่ง';

  @override
  String get hotelName => 'ชื่อโรงแรม';

  @override
  String get roomType => 'ประเภทห้อง';

  @override
  String get checkInTime => 'เวลาเช็คอิน';

  @override
  String get checkOutTime => 'เวลาเช็คเอาท์';

  @override
  String get carCompany => 'บริษัทเช่ารถ';

  @override
  String get carModel => 'รุ่นรถ';

  @override
  String get pickupLocation => 'สถานที่รับรถ';

  @override
  String get dropoffLocation => 'สถานที่คืนรถ';

  @override
  String get pickupTime => 'เวลารับรถ';

  @override
  String get dropoffTime => 'เวลาคืนรถ';

  @override
  String get restaurantName => 'ชื่อร้านอาหาร';

  @override
  String get cuisine => 'ประเภทอาหาร';

  @override
  String get priceRange => 'ช่วงราคา';

  @override
  String get reservationTime => 'เวลาจอง';

  @override
  String get departureAirport => 'สนามบินต้นทาง';

  @override
  String get arrivalAirport => 'สนามบินปลายทาง';

  @override
  String get departureTime => 'เวลาออกเดินทาง';

  @override
  String get arrivalTime => 'เวลาถึง';

  @override
  String get terminal => 'เทอร์มินัล';

  @override
  String get gate => 'ประตู';

  @override
  String get confirmationNumber => 'หมายเลขยืนยัน';

  @override
  String get other => 'อื่นๆ';

  @override
  String get title => 'หัวข้อ';

  @override
  String get description => 'คำอธิบาย';

  @override
  String get itemNotFound => 'ไม่พบรายการ';

  @override
  String get selectDay => 'เลือกวัน';

  @override
  String get selectAirline => 'เลือกสายการบิน';

  @override
  String get enterNotesHint => 'กรอกบันทึก...';

  @override
  String get enterHotelName => 'กรอกชื่อโรงแรม';

  @override
  String get enterRoomType => 'กรอกประเภทห้อง';

  @override
  String get enterAddress => 'กรอกที่อยู่';

  @override
  String get enterConfirmationNumber => 'กรอกหมายเลขยืนยัน';

  @override
  String get selectCarCompany => 'เลือกบริษัทเช่ารถ';

  @override
  String get enterCarModel => 'กรอกรุ่นรถ';

  @override
  String get enterPickupLocation => 'กรอกสถานที่รับรถ';

  @override
  String get enterDropoffLocation => 'กรอกสถานที่คืนรถ';

  @override
  String get pickupInfo => 'ข้อมูลการรับรถ';

  @override
  String get dropoffInfo => 'ข้อมูลการคืนรถ';

  @override
  String get enterRestaurantName => 'กรอกชื่อร้านอาหาร';

  @override
  String get cuisineType => 'ประเภทอาหาร';

  @override
  String get selectCuisineType => 'เลือกประเภทอาหาร';

  @override
  String get reservationInfo => 'ข้อมูลการจอง';

  @override
  String get enterTitle => 'กรอกหัวข้อ';

  @override
  String get enterDescription => 'กรอกคำอธิบาย';

  @override
  String get enterLocation => 'กรอกตำแหน่ง';

  @override
  String get startTime => 'เวลาเริ่มต้น';

  @override
  String get endTime => 'เวลาสิ้นสุด';

  @override
  String get addAttachments => 'เพิ่มไฟล์แนบ';

  @override
  String get attachmentHint => 'เพิ่มเอกสารหรือรูปภาพ';

  @override
  String get itemUpdatedSuccess => 'อัปเดตรายการสำเร็จแล้ว';

  @override
  String get itemDeletedSuccess => 'ลบรายการสำเร็จแล้ว';
}
