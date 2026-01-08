// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Yolculugunuza Baslayin';

  @override
  String get welcomeSubtitle =>
      'Yeni deneyimler kesfedin ve ozel anilar biriktirin';

  @override
  String get skip => 'Atla';

  @override
  String get participant => 'Katilimci';

  @override
  String get host => 'Organizator';

  @override
  String get coHost => 'Yardimci Organizator';

  @override
  String get signInWithKakao => 'Kakao ile Devam Et';

  @override
  String get signInWithNaver => 'Naver ile Devam Et';

  @override
  String get signInWithGoogle => 'Google ile Devam Et';

  @override
  String get signInWithApple => 'Apple ile Devam Et';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Giris yaparak $terms ve $privacy kabul etmis olursunuz.';
  }

  @override
  String get termsOfService => 'Kullanim Kosullari';

  @override
  String get privacyPolicy => 'Gizlilik Politikasi';

  @override
  String get welcomeBack => 'Tekrar hos geldiniz';

  @override
  String get readyForNextJourney => 'Bir sonraki yolculugunuza hazir misiniz?';

  @override
  String get allTrips => 'Tum Geziler';

  @override
  String get hosting => 'Duzenlediklerim';

  @override
  String get participating => 'Katildiklarim';

  @override
  String get happeningNow => 'Su An Devam Eden';

  @override
  String get upcomingAdventures => 'Yaklasan Maceralar';

  @override
  String get viewAll => 'Tumunu Gor';

  @override
  String dayOf(int current, int total) {
    return 'Gun $current / $total';
  }

  @override
  String get inProgress => 'Devam Ediyor';

  @override
  String get manage => 'Yonet';

  @override
  String get guest => 'Misafir';

  @override
  String get tbd => 'Belirsiz';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get explore => 'Kesfet';

  @override
  String get chat => 'Sohbet';

  @override
  String get profile => 'Profil';

  @override
  String get createTrip => 'Gezi Olustur';

  @override
  String get letsplanYourJourney => 'Yolculugunuzu planlayalim';

  @override
  String get hostCanEditLater =>
      'Organizator olarak bu detaylari daha sonra istediginiz zaman duzenleyebilirsiniz.';

  @override
  String get cancel => 'Iptal';

  @override
  String get save => 'Kaydet';

  @override
  String get basicInfo => 'Temel Bilgiler';

  @override
  String get required => 'Zorunlu';

  @override
  String get tripName => 'Gezi Adi';

  @override
  String get tripNameHint => 'orn. Kyoto\'da Yaz';

  @override
  String get destination => 'Varis Noktasi';

  @override
  String get destinationHint => 'Nereye gidiyorsunuz?';

  @override
  String get dates => 'Tarihler';

  @override
  String get startDate => 'Baslangic Tarihi';

  @override
  String get endDate => 'Bitis Tarihi';

  @override
  String get optionalDetails => 'Istege Bagli Detaylar';

  @override
  String get coverPhoto => 'Kapak Fotografi';

  @override
  String get tapToUploadCover => 'Kapak yuklemek icin dokunun';

  @override
  String get tripGoalMemo => 'Gezi Amaci / Not';

  @override
  String get tripGoalHint => 'Bu gezinin ana amaci nedir?';

  @override
  String get nextStep => 'Sonraki Adim';

  @override
  String get participantManagement => 'Katilimci Yonetimi';

  @override
  String get participating_count => 'Katilimci';

  @override
  String get pendingInvites => 'Bekleyen Davetler';

  @override
  String get inviteNewMember => 'Yeni Uye Davet Et';

  @override
  String get searchByNameOrEmail => 'Ad veya e-posta ile ara';

  @override
  String get hosts => 'Organizatorler';

  @override
  String get admin => 'YONETICI';

  @override
  String get travelers => 'Gezginler';

  @override
  String get allPermissions => 'Tum izinler';

  @override
  String get canEditSchedule => 'Programi duzenleyebilir';

  @override
  String get readOnly => 'Sadece okuma';

  @override
  String get pendingAcceptance => 'Kabul bekleniyor';

  @override
  String get resend => 'Tekrar Gonder';

  @override
  String get inviteLinkActivated => 'Davet baglantisi etkinlestirildi';

  @override
  String get copy => 'Kopyala';

  @override
  String get allowScheduleEdit => 'Program duzenlemeye izin ver';

  @override
  String get allowPhotoUpload => 'Fotograf yuklemeye izin ver';

  @override
  String get removeFromTrip => 'Geziden cikar';

  @override
  String joinedDaysAgo(int days) {
    return '$days gun once katildi';
  }

  @override
  String get itinerary => 'Seyahat Programi';

  @override
  String get organizerView => 'Organizator Gorunumu';

  @override
  String get draft => 'Taslak';

  @override
  String days(int count) {
    return '$count Gun';
  }

  @override
  String day(int number) {
    return 'Gun $number';
  }

  @override
  String get addActivity => 'Etkinlik Ekle';

  @override
  String get schedule => 'Program';

  @override
  String get map => 'Harita';

  @override
  String get people => 'Kisiler';

  @override
  String get settings => 'Ayarlar';

  @override
  String get flight => 'Ucus';

  @override
  String get accommodation => 'Konaklama';

  @override
  String get rentalCar => 'Kiralik Arac';

  @override
  String get restaurant => 'Restoran';

  @override
  String get attraction => 'Turistik Yer';

  @override
  String get activity => 'Etkinlik';

  @override
  String get transportation => 'Ulasim';

  @override
  String get enterDetails => 'Detaylari Girin';

  @override
  String get airline => 'Havayolu';

  @override
  String get flightNumber => 'Ucus Numarasi';

  @override
  String get departure => 'Kalkis';

  @override
  String get arrival => 'Varis';

  @override
  String get notes => 'Notlar';

  @override
  String get notesHint => 'Onemli notlarinizi buraya yazin...';

  @override
  String get addAttachment => 'Ek Ekle';

  @override
  String get eTicketOrVoucher => 'E-bilet veya fiş (PDF, JPG)';

  @override
  String get reminderSettings => 'Hatirlatici Ayarlari';

  @override
  String get reservationConfirmed => 'Rezervasyon Onaylandi';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Rehber - $members Uye';
  }

  @override
  String get guide => 'REHBER';

  @override
  String get organizer => 'ORGANIZATOR';

  @override
  String get messagePlaceholder => 'Mesaj...';

  @override
  String get openMap => 'Haritayi Ac';

  @override
  String get newAnnouncement => 'Yeni Duyuru';

  @override
  String get toWhom => 'Kime?';

  @override
  String get allParticipants => 'Tum Katilimcilar';

  @override
  String get selectSpecific => 'Belirli Kisileri Sec';

  @override
  String othersSelected(int count) {
    return '+ $count diger secildi';
  }

  @override
  String get messageDetails => 'Mesaj Detaylari';

  @override
  String get nextSchedule => 'Sonraki Program';

  @override
  String get urgent => 'Acil';

  @override
  String get generalInfo => 'Genel Bilgi';

  @override
  String get poll => 'Anket';

  @override
  String get quickTemplates => 'Hizli Sablonlar';

  @override
  String get templateBusLeaving => 'Otobus 10 dakika icinde kalkiyor';

  @override
  String get templateMeetingPoint => 'Bulusma noktasi degisti';

  @override
  String get templateWeather => 'Hava durumu uyarisi';

  @override
  String get templateDinner => 'Aksam yemegi rezervasyonlari';

  @override
  String get subject => 'Konu';

  @override
  String get subjectHint => 'orn. Lobide bulusma';

  @override
  String get message => 'Mesaj';

  @override
  String get messageHint => 'Duyurunuzu buraya yazin...';

  @override
  String get addPhoto => 'Fotograf Ekle';

  @override
  String get addLocation => 'Konum Ekle';

  @override
  String get pinToTopOfChat => 'Sohbetin ustune sabitle';

  @override
  String get keepVisibleForAll => 'Tum katilimcilar icin gorunur tut';

  @override
  String get sendAsUrgentAlert => 'Acil Uyari Olarak Gonder';

  @override
  String get notifiesEvenIfMuted => 'Sessizde bile bildirim gonderir';

  @override
  String get sendNotification => 'Bildirim Gonder';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get markAllAsRead => 'Tumunu okundu olarak isaretle';

  @override
  String get all => 'Tumu';

  @override
  String get announcements => 'Duyurular';

  @override
  String get today => 'Bugun';

  @override
  String get yesterday => 'Dun';

  @override
  String get announcement => 'Duyuru';

  @override
  String get pastAnnouncement => 'Gecmis Duyuru';

  @override
  String minutesAgo(int minutes) {
    return '$minutes dakika once';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours saat once';
  }

  @override
  String get tripDetails => 'Gezi Detaylari';

  @override
  String nights(int count) {
    return '$count Gece';
  }

  @override
  String get hostedBy => 'Duzenleyen';

  @override
  String get mapView => 'Harita Gorunumu';

  @override
  String get groupChat => 'Grup Sohbeti';

  @override
  String get savedDocs => 'Kaydedilen Belgeler';

  @override
  String get dontForget => 'Unutmayin!';

  @override
  String get overview => 'Genel Bakis';

  @override
  String get expandAll => 'Tumunu Genislet';

  @override
  String get checkIn => 'Giris';

  @override
  String get checkOut => 'Cikis';

  @override
  String get directions => 'Yol Tarifi';

  @override
  String get reservation => 'Rezervasyon';

  @override
  String get currentStatus => 'Mevcut Durum';

  @override
  String tripStartsIn(int days) {
    return 'Gezi $days gun icinde basliyor';
  }

  @override
  String get accountAndPermissions => 'Hesap ve Izinler';

  @override
  String get profileVisibility => 'Profil Gorunurlugu';

  @override
  String get displaySettings => 'Gorunum Ayarlari';

  @override
  String get darkMode => 'Karanlik Mod';

  @override
  String get fontSize => 'Yazi Boyutu';

  @override
  String get standard => 'Standart';

  @override
  String get notificationSettings => 'Bildirimler';

  @override
  String get tripScheduleNotifications => 'Gezi programi bildirimleri';

  @override
  String get importantChangesPush =>
      'Onemli degisiklikler icin anlik bildirimler';

  @override
  String get newMessageNotifications => 'Yeni mesaj bildirimleri';

  @override
  String get helpAndSupport => 'Yardim ve Destek';

  @override
  String get appVersion => 'Uygulama Surumu';

  @override
  String get logout => 'Cikis Yap';

  @override
  String get permissionRequired => 'Izin Gerekli';

  @override
  String get notificationPermissionMessage =>
      'TripSync, onemli gezi guncellemelerini ve organizator duyurularini gonderebilmek icin bildirim iznine ihtiyac duyar.';

  @override
  String get allowNotifications => 'Bildirimlere Izin Ver';

  @override
  String get later => 'Daha Sonra';

  @override
  String get error => 'Hata';

  @override
  String get tryAgain => 'Tekrar Dene';

  @override
  String get noTripsYet => 'Henuz gezi yok';

  @override
  String get createYourFirstTrip =>
      'Ilk gezinizi olusturun veya bir geziye katilin!';

  @override
  String get noNotifications => 'Bildirim yok';

  @override
  String get youreAllCaughtUp => 'Hepsini goruntulediniz!';

  @override
  String get loading => 'Yukleniyor...';

  @override
  String get connectionError => 'Baglanti hatasi';

  @override
  String get checkYourInternet => 'Lutfen internet baglantinizi kontrol edin';

  @override
  String get confirmDelete => 'Silmeyi Onayla';

  @override
  String get deleteConfirmMessage => 'Bunu silmek istediginizden emin misiniz?';

  @override
  String get delete => 'Sil';

  @override
  String get confirm => 'Onayla';

  @override
  String get done => 'Tamam';

  @override
  String get edit => 'Duzenle';

  @override
  String get close => 'Kapat';

  @override
  String get back => 'Geri';

  @override
  String get next => 'Ileri';

  @override
  String get search => 'Ara';

  @override
  String get noResults => 'Sonuc bulunamadi';

  @override
  String get selectDate => 'Tarih Sec';

  @override
  String get selectTime => 'Saat Sec';

  @override
  String get from => 'Baslangic';

  @override
  String get to => 'Bitis';

  @override
  String get duration => 'Sure';

  @override
  String get location => 'Konum';

  @override
  String get address => 'Adres';

  @override
  String get phone => 'Telefon';

  @override
  String get email => 'E-posta';

  @override
  String get website => 'Web Sitesi';

  @override
  String get price => 'Fiyat';

  @override
  String get viewMenu => 'Menuyu Gor';

  @override
  String get recommended => 'Onerilen';

  @override
  String get hiking => 'Dogа Yuruyusu';

  @override
  String get warning => 'Uyari';

  @override
  String get viewDetails => 'Detaylari Gor';

  @override
  String get readyForYour => 'Hazir misiniz';

  @override
  String get nextJourney => 'sonraki yolculugunuz icin?';

  @override
  String get createFirstTrip =>
      'Ilk gezinizi olusturun veya bir geziye katilin!';

  @override
  String get language => 'Dil';

  @override
  String get changePhoto => 'Fotografi Degistir';

  @override
  String get takePhoto => 'Fotograf Cek';

  @override
  String get chooseFromGallery => 'Galeriden Sec';

  @override
  String get removePhoto => 'Fotografi Kaldir';

  @override
  String get displayName => 'Gorunen Ad';

  @override
  String get enterDisplayName => 'Gorunen adinizi girin';

  @override
  String get enterPhoneNumber => 'Telefon numaranizi girin';

  @override
  String get displayNameRequired => 'Gorunen ad gerekli';

  @override
  String get displayNameMinLength => 'Gorunen ad en az 2 karakter olmali';

  @override
  String get profileUpdated => 'Profil basariyla guncellendi';

  @override
  String get failedToUpdateProfile => 'Profil guncellenemedi';

  @override
  String get failedToPickImage => 'Gorsel secilemedi';

  @override
  String get logoutConfirmation => 'Cikis yapmak istediginizden emin misiniz?';

  @override
  String get earlier => 'Daha Once';

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
  String get account => 'Hesap';

  @override
  String get deleteAccount => 'Hesabi Sil';

  @override
  String get deleteAccountTitle => 'Hesabi Sil';

  @override
  String get deleteAccountMessage =>
      'Hesabinizi silmek istediginizden emin misiniz? Bu islem geri alinamaz ve tum verileriniz kalici olarak silinecektir.';

  @override
  String get deleteAccountConfirmation => 'Onaylamak icin \'SIL\' yazin';

  @override
  String get deletingAccount => 'Hesap siliniyor...';

  @override
  String get accountDeleted => 'Hesap basariyla silindi';

  @override
  String get deleteAccountFailed => 'Hesap silinemedi';

  @override
  String get deleteAccountWarning =>
      'Uyari: Bu islem geri alinamaz. Geziler ve mesajlar dahil tum verileriniz kalici olarak silinecektir.';
}
