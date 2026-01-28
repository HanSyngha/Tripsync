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
  String get noMapLocations => 'No locations to display on map';

  @override
  String get noMapLocationsHint => 'Add locations to your itinerary to see them on the map';

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
  String get discardTrip => 'Buang Perjalanan?';

  @override
  String get discardTripMessage =>
      'Adakah anda pasti mahu membuang perjalanan ini? Semua perubahan akan hilang.';

  @override
  String get discardChanges => 'Buang Perubahan?';

  @override
  String get discardChangesMessage =>
      'Adakah anda pasti mahu membuang perubahan anda?';

  @override
  String get keepEditing => 'Teruskan Mengedit';

  @override
  String get discard => 'Buang';

  @override
  String get tripCreatedSuccess => 'Perjalanan berjaya dicipta!';

  @override
  String get tripUpdatedSuccess => 'Perjalanan berjaya dikemas kini!';

  @override
  String get tripNotFound => 'Perjalanan tidak dijumpai';

  @override
  String get itinerarySaved => 'Jadual perjalanan disimpan';

  @override
  String get comingSoon => 'Akan Datang';

  @override
  String get signOut => 'Log Keluar';

  @override
  String get retry => 'Cuba Lagi';

  @override
  String get viewParticipants => 'Lihat Peserta';

  @override
  String get pinnedMessages => 'Mesej Disematkan';

  @override
  String get searchMessages => 'Cari Mesej';

  @override
  String get sendAnnouncement => 'Hantar Pengumuman';

  @override
  String get photo => 'Foto';

  @override
  String get camera => 'Kamera';

  @override
  String get sharePhotosFromGallery => 'Kongsi foto dari galeri';

  @override
  String get takeNewPhoto => 'Ambil foto baharu';

  @override
  String get shareCurrentLocation => 'Kongsi lokasi semasa anda';

  @override
  String get featureComingSoon => 'Ciri akan datang!';

  @override
  String get activityAddedSuccess => 'Aktiviti berjaya ditambah';

  @override
  String get filePickerComingSoon => 'Pemilih fail akan datang';

  @override
  String get pleaseEnterMessage => 'Sila masukkan mesej';

  @override
  String get announcementSentSuccess => 'Pengumuman berjaya dihantar!';

  @override
  String get failedToLoadParticipants => 'Gagal memuatkan peserta';

  @override
  String get loginRequired => 'Log masuk diperlukan';

  @override
  String get inviteSendFailed => 'Gagal menghantar jemputan. Sila cuba lagi.';

  @override
  String get newInviteLinkGenerated => 'Pautan jemputan baharu dijana';

  @override
  String get inviteLinkCopied => 'Pautan jemputan disalin';

  @override
  String get userNotFound => 'Pengguna tidak dijumpai';

  @override
  String get noDestination => 'Tiada destinasi';

  @override
  String get loginTitle => 'Selamat Datang';

  @override
  String get loginSubtitle => 'Log masuk untuk memulakan perjalanan anda';

  @override
  String get continueWithKakao => 'Teruskan dengan Kakao';

  @override
  String get continueWithNaver => 'Teruskan dengan Naver';

  @override
  String get continueWithGoogle => 'Teruskan dengan Google';

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

  @override
  String get reportMessage => 'Laporkan Mesej';

  @override
  String get reportMessageDescription =>
      'Laporkan kandungan tidak sesuai kepada penganjur perjalanan';

  @override
  String get blockUser => 'Sekat Pengguna';

  @override
  String get blockUserDescription =>
      'Anda tidak akan melihat mesej daripada pengguna ini lagi';

  @override
  String get selectReportReason => 'Pilih sebab laporan:';

  @override
  String get additionalDetails => 'Butiran Tambahan';

  @override
  String get optionalDescription => 'Terangkan masalah (pilihan)';

  @override
  String get report => 'Laporkan';

  @override
  String get block => 'Sekat';

  @override
  String get reportTypeSpam => 'Spam';

  @override
  String get reportTypeHarassment => 'Gangguan';

  @override
  String get reportTypeInappropriate => 'Kandungan Tidak Sesuai';

  @override
  String get reportTypeHateSpeech => 'Ucapan Kebencian';

  @override
  String get reportTypeViolence => 'Keganasan';

  @override
  String get reportTypeOther => 'Lain-lain';

  @override
  String get reportSubmitted =>
      'Laporan dihantar. Penganjur perjalanan akan dimaklumkan.';

  @override
  String get reportFailed => 'Gagal menghantar laporan. Sila cuba lagi.';

  @override
  String blockUserConfirmation(String userName) {
    return 'Adakah anda pasti mahu menyekat $userName? Anda tidak akan melihat mesej mereka lagi.';
  }

  @override
  String userBlocked(String userName) {
    return '$userName telah disekat';
  }

  @override
  String get blockFailed => 'Gagal menyekat pengguna. Sila cuba lagi.';

  @override
  String get blockedUsers => 'Pengguna Disekat';

  @override
  String get noBlockedUsers => 'Tiada pengguna disekat';

  @override
  String get unblock => 'Nyahsekat';

  @override
  String userUnblocked(String userName) {
    return '$userName telah dinyahsekat';
  }

  @override
  String get reportUser => 'Laporkan Pengguna';

  @override
  String get reportUserDescription =>
      'Laporkan pengguna ini kepada penganjur perjalanan';

  @override
  String get locationPermissionDenied => 'Kebenaran lokasi ditolak';

  @override
  String get locationPermissionDeniedForever =>
      'Kebenaran lokasi ditolak secara kekal. Sila aktifkan dalam tetapan.';

  @override
  String get locationServicesDisabled => 'Perkhidmatan lokasi dinyahaktifkan';

  @override
  String get gettingLocation => 'Mendapatkan lokasi...';

  @override
  String get currentLocation => 'Lokasi semasa';

  @override
  String get shareLocation => 'Kongsi lokasi';

  @override
  String get shareLocationConfirmation =>
      'Adakah anda mahu berkongsi lokasi ini dalam sembang?';

  @override
  String get share => 'Kongsi';

  @override
  String get uploadFailed => 'Muat naik gagal';

  @override
  String get openInGoogleMaps => 'Buka di Google Maps';

  @override
  String get getDirections => 'Dapatkan arah';

  @override
  String get drivingDirections => 'Arah memandu';

  @override
  String get walkingDirections => 'Arah berjalan';

  @override
  String get transitDirections => 'Arah pengangkutan awam';

  @override
  String get noPinnedMessages => 'Tiada mesej disematkan';

  @override
  String get noItineraryYet => 'Belum ada jadual perjalanan';

  @override
  String get viewFullItinerary => 'Lihat jadual perjalanan penuh';

  @override
  String get inviteParticipant => 'Jemput peserta';

  @override
  String get emailAddress => 'Alamat e-mel';

  @override
  String get enterEmailAddress => 'Masukkan alamat e-mel';

  @override
  String get invalidEmail => 'E-mel tidak sah';

  @override
  String get role => 'Peranan';

  @override
  String get permissions => 'Kebenaran';

  @override
  String get sendInvite => 'Hantar jemputan';

  @override
  String get inviteSent => 'Jemputan dihantar';

  @override
  String get editItinerary => 'Edit jadual perjalanan';

  @override
  String get deleteItinerary => 'Padam jadual perjalanan';

  @override
  String get deleteItineraryConfirm =>
      'Adakah anda pasti mahu memadam jadual perjalanan ini?';

  @override
  String get itineraryDeleted => 'Jadual perjalanan dipadam';

  @override
  String get searchPlaces => 'Cari tempat';

  @override
  String get selectLocation => 'Pilih lokasi';

  @override
  String get confirmLocation => 'Sahkan lokasi';

  @override
  String get hotelName => 'Nama hotel';

  @override
  String get roomType => 'Jenis bilik';

  @override
  String get checkInTime => 'Masa daftar masuk';

  @override
  String get checkOutTime => 'Masa daftar keluar';

  @override
  String get carCompany => 'Syarikat sewa kereta';

  @override
  String get carModel => 'Model kereta';

  @override
  String get pickupLocation => 'Lokasi pengambilan';

  @override
  String get dropoffLocation => 'Lokasi pemulangan';

  @override
  String get pickupTime => 'Masa pengambilan';

  @override
  String get dropoffTime => 'Masa pemulangan';

  @override
  String get restaurantName => 'Nama restoran';

  @override
  String get cuisine => 'Masakan';

  @override
  String get priceRange => 'Julat harga';

  @override
  String get reservationTime => 'Masa tempahan';

  @override
  String get departureAirport => 'Lapangan terbang berlepas';

  @override
  String get arrivalAirport => 'Lapangan terbang ketibaan';

  @override
  String get departureTime => 'Masa berlepas';

  @override
  String get arrivalTime => 'Masa ketibaan';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Pintu';

  @override
  String get confirmationNumber => 'Nombor pengesahan';

  @override
  String get other => 'Lain-lain';

  @override
  String get title => 'Tajuk';

  @override
  String get description => 'Penerangan';

  @override
  String get itemNotFound => 'Item tidak dijumpai';

  @override
  String get selectDay => 'Pilih hari';

  @override
  String get selectAirline => 'Pilih syarikat penerbangan';

  @override
  String get enterNotesHint => 'Masukkan nota...';

  @override
  String get enterHotelName => 'Masukkan nama hotel';

  @override
  String get enterRoomType => 'Masukkan jenis bilik';

  @override
  String get enterAddress => 'Masukkan alamat';

  @override
  String get enterConfirmationNumber => 'Masukkan nombor pengesahan';

  @override
  String get selectCarCompany => 'Pilih syarikat sewa kereta';

  @override
  String get enterCarModel => 'Masukkan model kereta';

  @override
  String get enterPickupLocation => 'Masukkan lokasi pengambilan';

  @override
  String get enterDropoffLocation => 'Masukkan lokasi pemulangan';

  @override
  String get pickupInfo => 'Info pengambilan';

  @override
  String get dropoffInfo => 'Info pemulangan';

  @override
  String get enterRestaurantName => 'Masukkan nama restoran';

  @override
  String get cuisineType => 'Jenis masakan';

  @override
  String get selectCuisineType => 'Pilih jenis masakan';

  @override
  String get reservationInfo => 'Info tempahan';

  @override
  String get enterTitle => 'Masukkan tajuk';

  @override
  String get enterDescription => 'Masukkan penerangan';

  @override
  String get enterLocation => 'Masukkan lokasi';

  @override
  String get startTime => 'Masa mula';

  @override
  String get endTime => 'Masa tamat';

  @override
  String get addAttachments => 'Tambah lampiran';

  @override
  String get attachmentHint => 'Tambah dokumen atau gambar';

  @override
  String get itemUpdatedSuccess => 'Item berjaya dikemas kini';

  @override
  String get itemDeletedSuccess => 'Item berjaya dipadam';
}
