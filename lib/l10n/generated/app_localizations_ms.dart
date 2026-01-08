// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Mulakan Perjalanan Anda';

  @override
  String get welcomeSubtitle =>
      'Temui pengalaman baharu dan cipta kenangan istimewa';

  @override
  String get skip => 'Langkau';

  @override
  String get participant => 'Peserta';

  @override
  String get host => 'Hos';

  @override
  String get coHost => 'Hos Bersama';

  @override
  String get signInWithKakao => 'Teruskan dengan Kakao';

  @override
  String get signInWithNaver => 'Teruskan dengan Naver';

  @override
  String get signInWithGoogle => 'Teruskan dengan Google';

  @override
  String get signInWithApple => 'Teruskan dengan Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Dengan log masuk, anda bersetuju dengan $terms dan $privacy kami.';
  }

  @override
  String get termsOfService => 'Syarat Perkhidmatan';

  @override
  String get privacyPolicy => 'Dasar Privasi';

  @override
  String get welcomeBack => 'Selamat kembali';

  @override
  String get readyForNextJourney => 'Bersedia untuk perjalanan seterusnya?';

  @override
  String get allTrips => 'Semua Perjalanan';

  @override
  String get hosting => 'Menghos';

  @override
  String get participating => 'Menyertai';

  @override
  String get happeningNow => 'Sedang Berlangsung';

  @override
  String get upcomingAdventures => 'Pengembaraan Akan Datang';

  @override
  String get viewAll => 'Lihat semua';

  @override
  String dayOf(int current, int total) {
    return 'Hari $current daripada $total';
  }

  @override
  String get inProgress => 'Sedang Berjalan';

  @override
  String get manage => 'Urus';

  @override
  String get guest => 'Tetamu';

  @override
  String get tbd => 'Akan Ditentukan';

  @override
  String get home => 'Laman Utama';

  @override
  String get explore => 'Terokai';

  @override
  String get chat => 'Sembang';

  @override
  String get profile => 'Profil';

  @override
  String get createTrip => 'Cipta Perjalanan';

  @override
  String get letsplanYourJourney => 'Mari rancang perjalanan anda';

  @override
  String get hostCanEditLater =>
      'Sebagai hos, anda boleh mengedit butiran ini kemudian bila-bila masa.';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get basicInfo => 'Maklumat Asas';

  @override
  String get required => 'Diperlukan';

  @override
  String get tripName => 'Nama Perjalanan';

  @override
  String get tripNameHint => 'cth. Musim Panas di Kyoto';

  @override
  String get destination => 'Destinasi';

  @override
  String get destinationHint => 'Ke mana anda pergi?';

  @override
  String get dates => 'Tarikh';

  @override
  String get startDate => 'Tarikh Mula';

  @override
  String get endDate => 'Tarikh Tamat';

  @override
  String get optionalDetails => 'Butiran Pilihan';

  @override
  String get coverPhoto => 'Foto Muka Depan';

  @override
  String get tapToUploadCover => 'Ketik untuk muat naik muka depan';

  @override
  String get tripGoalMemo => 'Matlamat / Memo Perjalanan';

  @override
  String get tripGoalHint => 'Apakah matlamat utama perjalanan ini?';

  @override
  String get nextStep => 'Langkah Seterusnya';

  @override
  String get participantManagement => 'Pengurusan Peserta';

  @override
  String get participating_count => 'Menyertai';

  @override
  String get pendingInvites => 'Jemputan Tertunda';

  @override
  String get inviteNewMember => 'Jemput Ahli Baharu';

  @override
  String get searchByNameOrEmail => 'Cari mengikut nama atau e-mel';

  @override
  String get hosts => 'Hos';

  @override
  String get admin => 'PENTADBIR';

  @override
  String get travelers => 'Pengembara';

  @override
  String get allPermissions => 'Semua kebenaran';

  @override
  String get canEditSchedule => 'Boleh edit jadual';

  @override
  String get readOnly => 'Baca sahaja';

  @override
  String get pendingAcceptance => 'Menunggu penerimaan';

  @override
  String get resend => 'Hantar Semula';

  @override
  String get inviteLinkActivated => 'Pautan jemputan diaktifkan';

  @override
  String get copy => 'Salin';

  @override
  String get allowScheduleEdit => 'Benarkan edit jadual';

  @override
  String get allowPhotoUpload => 'Benarkan muat naik foto';

  @override
  String get removeFromTrip => 'Keluarkan dari perjalanan';

  @override
  String joinedDaysAgo(int days) {
    return 'Menyertai $days hari lalu';
  }

  @override
  String get itinerary => 'Jadual Perjalanan';

  @override
  String get organizerView => 'Paparan Penganjur';

  @override
  String get draft => 'Draf';

  @override
  String days(int count) {
    return '$count Hari';
  }

  @override
  String day(int number) {
    return 'Hari $number';
  }

  @override
  String get addActivity => 'Tambah Aktiviti';

  @override
  String get schedule => 'Jadual';

  @override
  String get map => 'Peta';

  @override
  String get people => 'Orang';

  @override
  String get settings => 'Tetapan';

  @override
  String get flight => 'Penerbangan';

  @override
  String get accommodation => 'Penginapan';

  @override
  String get rentalCar => 'Kereta Sewa';

  @override
  String get restaurant => 'Restoran';

  @override
  String get attraction => 'Tarikan';

  @override
  String get activity => 'Aktiviti';

  @override
  String get transportation => 'Pengangkutan';

  @override
  String get enterDetails => 'Masukkan Butiran';

  @override
  String get airline => 'Syarikat Penerbangan';

  @override
  String get flightNumber => 'Nombor Penerbangan';

  @override
  String get departure => 'Berlepas';

  @override
  String get arrival => 'Tiba';

  @override
  String get notes => 'Nota';

  @override
  String get notesHint => 'Tulis sebarang nota penting di sini...';

  @override
  String get addAttachment => 'Tambah Lampiran';

  @override
  String get eTicketOrVoucher => 'E-tiket atau baucar (PDF, JPG)';

  @override
  String get reminderSettings => 'Tetapan Peringatan';

  @override
  String get reservationConfirmed => 'Tempahan Disahkan';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Pemandu - $members Ahli';
  }

  @override
  String get guide => 'PEMANDU';

  @override
  String get organizer => 'PENGANJUR';

  @override
  String get messagePlaceholder => 'Mesej...';

  @override
  String get openMap => 'Buka Peta';

  @override
  String get newAnnouncement => 'Pengumuman Baharu';

  @override
  String get toWhom => 'Kepada siapa?';

  @override
  String get allParticipants => 'Semua Peserta';

  @override
  String get selectSpecific => 'Pilih Tertentu';

  @override
  String othersSelected(int count) {
    return '+ $count lagi dipilih';
  }

  @override
  String get messageDetails => 'Butiran Mesej';

  @override
  String get nextSchedule => 'Jadual Seterusnya';

  @override
  String get urgent => 'Segera';

  @override
  String get generalInfo => 'Maklumat Am';

  @override
  String get poll => 'Undian';

  @override
  String get quickTemplates => 'Templat Pantas';

  @override
  String get templateBusLeaving => 'Bas bertolak dalam 10 minit';

  @override
  String get templateMeetingPoint => 'Titik pertemuan berubah';

  @override
  String get templateWeather => 'Amaran cuaca';

  @override
  String get templateDinner => 'Tempahan makan malam';

  @override
  String get subject => 'Subjek';

  @override
  String get subjectHint => 'cth. Berkumpul di lobi';

  @override
  String get message => 'Mesej';

  @override
  String get messageHint => 'Tulis pengumuman anda di sini...';

  @override
  String get addPhoto => 'Tambah Foto';

  @override
  String get addLocation => 'Tambah Lokasi';

  @override
  String get pinToTopOfChat => 'Semat di bahagian atas sembang';

  @override
  String get keepVisibleForAll => 'Pastikan kelihatan untuk semua peserta';

  @override
  String get sendAsUrgentAlert => 'Hantar sebagai Amaran Segera';

  @override
  String get notifiesEvenIfMuted => 'Memberitahu walaupun disenyapkan';

  @override
  String get sendNotification => 'Hantar Pemberitahuan';

  @override
  String get notifications => 'Pemberitahuan';

  @override
  String get markAllAsRead => 'Tanda semua sebagai dibaca';

  @override
  String get all => 'Semua';

  @override
  String get announcements => 'Pengumuman';

  @override
  String get today => 'Hari Ini';

  @override
  String get yesterday => 'Semalam';

  @override
  String get announcement => 'Pengumuman';

  @override
  String get pastAnnouncement => 'Pengumuman Lepas';

  @override
  String minutesAgo(int minutes) {
    return '$minutes minit lalu';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours jam lalu';
  }

  @override
  String get tripDetails => 'Butiran Perjalanan';

  @override
  String nights(int count) {
    return '$count Malam';
  }

  @override
  String get hostedBy => 'Dihos oleh';

  @override
  String get mapView => 'Paparan Peta';

  @override
  String get groupChat => 'Sembang Kumpulan';

  @override
  String get savedDocs => 'Dokumen Disimpan';

  @override
  String get dontForget => 'Jangan lupa!';

  @override
  String get overview => 'Gambaran Keseluruhan';

  @override
  String get expandAll => 'Kembangkan Semua';

  @override
  String get checkIn => 'Daftar Masuk';

  @override
  String get checkOut => 'Daftar Keluar';

  @override
  String get directions => 'Arah';

  @override
  String get reservation => 'Tempahan';

  @override
  String get currentStatus => 'Status Semasa';

  @override
  String tripStartsIn(int days) {
    return 'Perjalanan bermula dalam $days hari';
  }

  @override
  String get accountAndPermissions => 'Akaun & Kebenaran';

  @override
  String get profileVisibility => 'Keterlihatan Profil';

  @override
  String get displaySettings => 'Tetapan Paparan';

  @override
  String get darkMode => 'Mod Gelap';

  @override
  String get fontSize => 'Saiz Fon';

  @override
  String get standard => 'Standard';

  @override
  String get notificationSettings => 'Pemberitahuan';

  @override
  String get tripScheduleNotifications => 'Pemberitahuan jadual perjalanan';

  @override
  String get importantChangesPush => 'Pemberitahuan tolak perubahan penting';

  @override
  String get newMessageNotifications => 'Pemberitahuan mesej baharu';

  @override
  String get helpAndSupport => 'Bantuan & Sokongan';

  @override
  String get appVersion => 'Versi Aplikasi';

  @override
  String get logout => 'Log Keluar';

  @override
  String get permissionRequired => 'Kebenaran Diperlukan';

  @override
  String get notificationPermissionMessage =>
      'TripSync memerlukan kebenaran pemberitahuan untuk menghantar kemas kini perjalanan penting dan pengumuman daripada penganjur kepada anda.';

  @override
  String get allowNotifications => 'Benarkan Pemberitahuan';

  @override
  String get later => 'Kemudian';

  @override
  String get error => 'Ralat';

  @override
  String get tryAgain => 'Cuba Lagi';

  @override
  String get noTripsYet => 'Tiada perjalanan lagi';

  @override
  String get createYourFirstTrip =>
      'Cipta perjalanan pertama anda atau sertai satu!';

  @override
  String get noNotifications => 'Tiada pemberitahuan';

  @override
  String get youreAllCaughtUp => 'Anda sudah dikemas kini!';

  @override
  String get loading => 'Memuatkan...';

  @override
  String get connectionError => 'Ralat sambungan';

  @override
  String get checkYourInternet => 'Sila semak sambungan internet anda';

  @override
  String get confirmDelete => 'Sahkan Padam';

  @override
  String get deleteConfirmMessage => 'Adakah anda pasti mahu memadam ini?';

  @override
  String get delete => 'Padam';

  @override
  String get confirm => 'Sahkan';

  @override
  String get done => 'Selesai';

  @override
  String get edit => 'Edit';

  @override
  String get close => 'Tutup';

  @override
  String get back => 'Kembali';

  @override
  String get next => 'Seterusnya';

  @override
  String get search => 'Cari';

  @override
  String get noResults => 'Tiada hasil dijumpai';

  @override
  String get selectDate => 'Pilih Tarikh';

  @override
  String get selectTime => 'Pilih Masa';

  @override
  String get from => 'Dari';

  @override
  String get to => 'Ke';

  @override
  String get duration => 'Tempoh';

  @override
  String get location => 'Lokasi';

  @override
  String get address => 'Alamat';

  @override
  String get phone => 'Telefon';

  @override
  String get email => 'E-mel';

  @override
  String get website => 'Laman Web';

  @override
  String get price => 'Harga';

  @override
  String get viewMenu => 'Lihat Menu';

  @override
  String get recommended => 'Disyorkan';

  @override
  String get hiking => 'Mendaki';

  @override
  String get warning => 'Amaran';

  @override
  String get viewDetails => 'Lihat Butiran';

  @override
  String get readyForYour => 'Bersedia untuk';

  @override
  String get nextJourney => 'perjalanan seterusnya?';

  @override
  String get createFirstTrip =>
      'Cipta perjalanan pertama anda atau sertai satu!';

  @override
  String get language => 'Bahasa';

  @override
  String get changePhoto => 'Tukar Foto';

  @override
  String get takePhoto => 'Ambil Foto';

  @override
  String get chooseFromGallery => 'Pilih dari Galeri';

  @override
  String get removePhoto => 'Buang Foto';

  @override
  String get displayName => 'Nama Paparan';

  @override
  String get enterDisplayName => 'Masukkan nama paparan anda';

  @override
  String get enterPhoneNumber => 'Masukkan nombor telefon anda';

  @override
  String get displayNameRequired => 'Nama paparan diperlukan';

  @override
  String get displayNameMinLength =>
      'Nama paparan mesti sekurang-kurangnya 2 aksara';

  @override
  String get profileUpdated => 'Profil berjaya dikemas kini';

  @override
  String get failedToUpdateProfile => 'Gagal mengemas kini profil';

  @override
  String get failedToPickImage => 'Gagal memilih imej';

  @override
  String get logoutConfirmation => 'Adakah anda pasti mahu log keluar?';

  @override
  String get earlier => 'Sebelum ini';

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
  String get account => 'Akaun';

  @override
  String get deleteAccount => 'Padam Akaun';

  @override
  String get deleteAccountTitle => 'Padam Akaun';

  @override
  String get deleteAccountMessage =>
      'Adakah anda pasti mahu memadam akaun anda? Tindakan ini tidak boleh dibatalkan dan semua data anda akan dipadam secara kekal.';

  @override
  String get deleteAccountConfirmation => 'Taip \'PADAM\' untuk mengesahkan';

  @override
  String get deletingAccount => 'Memadam akaun...';

  @override
  String get accountDeleted => 'Akaun berjaya dipadam';

  @override
  String get deleteAccountFailed => 'Gagal memadam akaun';

  @override
  String get deleteAccountWarning =>
      'Amaran: Tindakan ini tidak boleh dibatalkan. Semua data anda termasuk perjalanan dan mesej akan dipadam secara kekal.';
}
