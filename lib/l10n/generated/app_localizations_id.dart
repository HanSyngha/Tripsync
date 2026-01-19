// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Mulai Perjalananmu';

  @override
  String get welcomeSubtitle =>
      'Temukan pengalaman baru dan ciptakan kenangan istimewa';

  @override
  String get skip => 'Lewati';

  @override
  String get participant => 'Peserta';

  @override
  String get host => 'Penyelenggara';

  @override
  String get coHost => 'Co-Penyelenggara';

  @override
  String get signInWithKakao => 'Lanjutkan dengan Kakao';

  @override
  String get signInWithNaver => 'Lanjutkan dengan Naver';

  @override
  String get signInWithGoogle => 'Lanjutkan dengan Google';

  @override
  String get signInWithApple => 'Lanjutkan dengan Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Dengan masuk, Anda menyetujui $terms dan $privacy kami.';
  }

  @override
  String get termsOfService => 'Ketentuan Layanan';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get welcomeBack => 'Selamat datang kembali';

  @override
  String get readyForNextJourney => 'Siap untuk perjalanan berikutnya?';

  @override
  String get allTrips => 'Semua Perjalanan';

  @override
  String get hosting => 'Menyelenggarakan';

  @override
  String get participating => 'Berpartisipasi';

  @override
  String get happeningNow => 'Sedang Berlangsung';

  @override
  String get upcomingAdventures => 'Petualangan Mendatang';

  @override
  String get viewAll => 'Lihat semua';

  @override
  String dayOf(int current, int total) {
    return 'Hari $current dari $total';
  }

  @override
  String get inProgress => 'Sedang Berlangsung';

  @override
  String get manage => 'Kelola';

  @override
  String get guest => 'Tamu';

  @override
  String get tbd => 'Belum Ditentukan';

  @override
  String get home => 'Beranda';

  @override
  String get explore => 'Jelajahi';

  @override
  String get chat => 'Obrolan';

  @override
  String get profile => 'Profil';

  @override
  String get createTrip => 'Buat Perjalanan';

  @override
  String get letsplanYourJourney => 'Mari rencanakan perjalananmu';

  @override
  String get hostCanEditLater =>
      'Sebagai penyelenggara, Anda dapat mengubah detail ini kapan saja.';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get basicInfo => 'Info Dasar';

  @override
  String get required => 'Wajib';

  @override
  String get tripName => 'Nama Perjalanan';

  @override
  String get tripNameHint => 'contoh: Musim Panas di Kyoto';

  @override
  String get destination => 'Tujuan';

  @override
  String get destinationHint => 'Mau ke mana?';

  @override
  String get dates => 'Tanggal';

  @override
  String get startDate => 'Tanggal Mulai';

  @override
  String get endDate => 'Tanggal Selesai';

  @override
  String get optionalDetails => 'Detail Opsional';

  @override
  String get coverPhoto => 'Foto Sampul';

  @override
  String get tapToUploadCover => 'Ketuk untuk unggah sampul';

  @override
  String get tripGoalMemo => 'Tujuan / Catatan Perjalanan';

  @override
  String get tripGoalHint => 'Apa tujuan utama perjalanan ini?';

  @override
  String get nextStep => 'Langkah Berikutnya';

  @override
  String get participantManagement => 'Manajemen Peserta';

  @override
  String get participating_count => 'Berpartisipasi';

  @override
  String get pendingInvites => 'Undangan Tertunda';

  @override
  String get inviteNewMember => 'Undang Anggota Baru';

  @override
  String get searchByNameOrEmail => 'Cari berdasarkan nama atau email';

  @override
  String get hosts => 'Penyelenggara';

  @override
  String get admin => 'ADMIN';

  @override
  String get travelers => 'Wisatawan';

  @override
  String get allPermissions => 'Semua izin';

  @override
  String get canEditSchedule => 'Dapat mengedit jadwal';

  @override
  String get readOnly => 'Hanya baca';

  @override
  String get pendingAcceptance => 'Menunggu konfirmasi';

  @override
  String get resend => 'Kirim Ulang';

  @override
  String get inviteLinkActivated => 'Tautan undangan diaktifkan';

  @override
  String get copy => 'Salin';

  @override
  String get allowScheduleEdit => 'Izinkan edit jadwal';

  @override
  String get allowPhotoUpload => 'Izinkan unggah foto';

  @override
  String get removeFromTrip => 'Hapus dari perjalanan';

  @override
  String joinedDaysAgo(int days) {
    return 'Bergabung $days hari yang lalu';
  }

  @override
  String get itinerary => 'Rencana Perjalanan';

  @override
  String get organizerView => 'Tampilan Penyelenggara';

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
  String get addActivity => 'Tambah Aktivitas';

  @override
  String get schedule => 'Jadwal';

  @override
  String get map => 'Peta';

  @override
  String get people => 'Orang';

  @override
  String get settings => 'Pengaturan';

  @override
  String get flight => 'Penerbangan';

  @override
  String get accommodation => 'Akomodasi';

  @override
  String get rentalCar => 'Mobil Rental';

  @override
  String get restaurant => 'Restoran';

  @override
  String get attraction => 'Tempat Wisata';

  @override
  String get activity => 'Aktivitas';

  @override
  String get transportation => 'Transportasi';

  @override
  String get enterDetails => 'Masukkan Detail';

  @override
  String get airline => 'Maskapai';

  @override
  String get flightNumber => 'Nomor Penerbangan';

  @override
  String get departure => 'Keberangkatan';

  @override
  String get arrival => 'Kedatangan';

  @override
  String get notes => 'Catatan';

  @override
  String get notesHint => 'Tulis catatan penting di sini...';

  @override
  String get addAttachment => 'Tambah Lampiran';

  @override
  String get eTicketOrVoucher => 'E-tiket atau voucher (PDF, JPG)';

  @override
  String get reminderSettings => 'Pengaturan Pengingat';

  @override
  String get reservationConfirmed => 'Reservasi Dikonfirmasi';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Pemandu - $members Anggota';
  }

  @override
  String get guide => 'PEMANDU';

  @override
  String get organizer => 'PENYELENGGARA';

  @override
  String get messagePlaceholder => 'Pesan...';

  @override
  String get openMap => 'Buka Peta';

  @override
  String get newAnnouncement => 'Pengumuman Baru';

  @override
  String get toWhom => 'Kepada siapa?';

  @override
  String get allParticipants => 'Semua Peserta';

  @override
  String get selectSpecific => 'Pilih Tertentu';

  @override
  String othersSelected(int count) {
    return '+ $count lainnya dipilih';
  }

  @override
  String get messageDetails => 'Detail Pesan';

  @override
  String get nextSchedule => 'Jadwal Berikutnya';

  @override
  String get urgent => 'Mendesak';

  @override
  String get generalInfo => 'Info Umum';

  @override
  String get poll => 'Polling';

  @override
  String get quickTemplates => 'Template Cepat';

  @override
  String get templateBusLeaving => 'Bus berangkat 10 menit lagi';

  @override
  String get templateMeetingPoint => 'Titik kumpul berubah';

  @override
  String get templateWeather => 'Peringatan cuaca';

  @override
  String get templateDinner => 'Reservasi makan malam';

  @override
  String get subject => 'Subjek';

  @override
  String get subjectHint => 'contoh: Bertemu di lobi';

  @override
  String get message => 'Pesan';

  @override
  String get messageHint => 'Tulis pengumuman Anda di sini...';

  @override
  String get addPhoto => 'Tambah Foto';

  @override
  String get addLocation => 'Tambah Lokasi';

  @override
  String get pinToTopOfChat => 'Sematkan di atas obrolan';

  @override
  String get keepVisibleForAll => 'Tetap terlihat untuk semua peserta';

  @override
  String get sendAsUrgentAlert => 'Kirim sebagai Peringatan Mendesak';

  @override
  String get notifiesEvenIfMuted => 'Memberitahu meskipun dibisukan';

  @override
  String get sendNotification => 'Kirim Notifikasi';

  @override
  String get notifications => 'Notifikasi';

  @override
  String get markAllAsRead => 'Tandai semua sudah dibaca';

  @override
  String get all => 'Semua';

  @override
  String get announcements => 'Pengumuman';

  @override
  String get today => 'Hari Ini';

  @override
  String get yesterday => 'Kemarin';

  @override
  String get announcement => 'Pengumuman';

  @override
  String get pastAnnouncement => 'Pengumuman Lalu';

  @override
  String minutesAgo(int minutes) {
    return '$minutes menit yang lalu';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours jam yang lalu';
  }

  @override
  String get tripDetails => 'Detail Perjalanan';

  @override
  String nights(int count) {
    return '$count Malam';
  }

  @override
  String get hostedBy => 'Diselenggarakan oleh';

  @override
  String get mapView => 'Tampilan Peta';

  @override
  String get groupChat => 'Obrolan Grup';

  @override
  String get savedDocs => 'Dokumen Tersimpan';

  @override
  String get dontForget => 'Jangan lupa!';

  @override
  String get overview => 'Ringkasan';

  @override
  String get expandAll => 'Perluas Semua';

  @override
  String get checkIn => 'Check-in';

  @override
  String get checkOut => 'Check-out';

  @override
  String get directions => 'Petunjuk Arah';

  @override
  String get reservation => 'Reservasi';

  @override
  String get currentStatus => 'Status Saat Ini';

  @override
  String tripStartsIn(int days) {
    return 'Perjalanan dimulai dalam $days hari';
  }

  @override
  String get accountAndPermissions => 'Akun & Izin';

  @override
  String get profileVisibility => 'Visibilitas Profil';

  @override
  String get displaySettings => 'Pengaturan Tampilan';

  @override
  String get darkMode => 'Mode Gelap';

  @override
  String get fontSize => 'Ukuran Font';

  @override
  String get standard => 'Standar';

  @override
  String get notificationSettings => 'Notifikasi';

  @override
  String get tripScheduleNotifications => 'Notifikasi jadwal perjalanan';

  @override
  String get importantChangesPush => 'Notifikasi push perubahan penting';

  @override
  String get newMessageNotifications => 'Notifikasi pesan baru';

  @override
  String get helpAndSupport => 'Bantuan & Dukungan';

  @override
  String get appVersion => 'Versi Aplikasi';

  @override
  String get logout => 'Keluar';

  @override
  String get permissionRequired => 'Izin Diperlukan';

  @override
  String get notificationPermissionMessage =>
      'TripSync memerlukan izin notifikasi untuk mengirimkan pembaruan perjalanan penting dan pengumuman dari penyelenggara.';

  @override
  String get allowNotifications => 'Izinkan Notifikasi';

  @override
  String get later => 'Nanti';

  @override
  String get error => 'Kesalahan';

  @override
  String get tryAgain => 'Coba Lagi';

  @override
  String get noTripsYet => 'Belum ada perjalanan';

  @override
  String get createYourFirstTrip =>
      'Buat perjalanan pertamamu atau bergabung dengan yang lain!';

  @override
  String get noNotifications => 'Tidak ada notifikasi';

  @override
  String get youreAllCaughtUp => 'Semua sudah terbaca!';

  @override
  String get loading => 'Memuat...';

  @override
  String get connectionError => 'Kesalahan koneksi';

  @override
  String get checkYourInternet => 'Silakan periksa koneksi internet Anda';

  @override
  String get confirmDelete => 'Konfirmasi Hapus';

  @override
  String get deleteConfirmMessage => 'Apakah Anda yakin ingin menghapus ini?';

  @override
  String get delete => 'Hapus';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get done => 'Selesai';

  @override
  String get edit => 'Edit';

  @override
  String get close => 'Tutup';

  @override
  String get back => 'Kembali';

  @override
  String get next => 'Berikutnya';

  @override
  String get search => 'Cari';

  @override
  String get noResults => 'Tidak ada hasil ditemukan';

  @override
  String get selectDate => 'Pilih Tanggal';

  @override
  String get selectTime => 'Pilih Waktu';

  @override
  String get from => 'Dari';

  @override
  String get to => 'Ke';

  @override
  String get duration => 'Durasi';

  @override
  String get location => 'Lokasi';

  @override
  String get address => 'Alamat';

  @override
  String get phone => 'Telepon';

  @override
  String get email => 'Email';

  @override
  String get website => 'Situs Web';

  @override
  String get price => 'Harga';

  @override
  String get viewMenu => 'Lihat Menu';

  @override
  String get recommended => 'Direkomendasikan';

  @override
  String get hiking => 'Mendaki';

  @override
  String get warning => 'Peringatan';

  @override
  String get viewDetails => 'Lihat Detail';

  @override
  String get readyForYour => 'Siap untuk';

  @override
  String get nextJourney => 'perjalanan berikutnya?';

  @override
  String get createFirstTrip =>
      'Buat perjalanan pertamamu atau bergabung dengan yang lain!';

  @override
  String get language => 'Bahasa';

  @override
  String get changePhoto => 'Ubah Foto';

  @override
  String get takePhoto => 'Ambil Foto';

  @override
  String get chooseFromGallery => 'Pilih dari Galeri';

  @override
  String get removePhoto => 'Hapus Foto';

  @override
  String get displayName => 'Nama Tampilan';

  @override
  String get enterDisplayName => 'Masukkan nama tampilan Anda';

  @override
  String get enterPhoneNumber => 'Masukkan nomor telepon Anda';

  @override
  String get displayNameRequired => 'Nama tampilan wajib diisi';

  @override
  String get displayNameMinLength => 'Nama tampilan harus minimal 2 karakter';

  @override
  String get profileUpdated => 'Profil berhasil diperbarui';

  @override
  String get failedToUpdateProfile => 'Gagal memperbarui profil';

  @override
  String get failedToPickImage => 'Gagal memilih gambar';

  @override
  String get logoutConfirmation => 'Apakah Anda yakin ingin keluar?';

  @override
  String get earlier => 'Sebelumnya';

  @override
  String get discardTrip => 'Buang Perjalanan?';

  @override
  String get discardTripMessage =>
      'Apakah Anda yakin ingin membuang perjalanan ini? Semua perubahan akan hilang.';

  @override
  String get discardChanges => 'Buang Perubahan?';

  @override
  String get discardChangesMessage =>
      'Apakah Anda yakin ingin membuang perubahan Anda?';

  @override
  String get keepEditing => 'Lanjutkan Mengedit';

  @override
  String get discard => 'Buang';

  @override
  String get tripCreatedSuccess => 'Perjalanan berhasil dibuat!';

  @override
  String get tripUpdatedSuccess => 'Perjalanan berhasil diperbarui!';

  @override
  String get tripNotFound => 'Perjalanan tidak ditemukan';

  @override
  String get itinerarySaved => 'Rencana perjalanan disimpan';

  @override
  String get comingSoon => 'Segera Hadir';

  @override
  String get signOut => 'Keluar';

  @override
  String get retry => 'Coba Lagi';

  @override
  String get viewParticipants => 'Lihat Peserta';

  @override
  String get pinnedMessages => 'Pesan Disematkan';

  @override
  String get searchMessages => 'Cari Pesan';

  @override
  String get sendAnnouncement => 'Kirim Pengumuman';

  @override
  String get photo => 'Foto';

  @override
  String get camera => 'Kamera';

  @override
  String get sharePhotosFromGallery => 'Bagikan foto dari galeri';

  @override
  String get takeNewPhoto => 'Ambil foto baru';

  @override
  String get shareCurrentLocation => 'Bagikan lokasi saat ini';

  @override
  String get featureComingSoon => 'Fitur segera hadir!';

  @override
  String get activityAddedSuccess => 'Aktivitas berhasil ditambahkan';

  @override
  String get filePickerComingSoon => 'Pemilih file segera hadir';

  @override
  String get pleaseEnterMessage => 'Silakan masukkan pesan';

  @override
  String get announcementSentSuccess => 'Pengumuman berhasil dikirim!';

  @override
  String get failedToLoadParticipants => 'Gagal memuat peserta';

  @override
  String get loginRequired => 'Login diperlukan';

  @override
  String get inviteSendFailed => 'Gagal mengirim undangan. Silakan coba lagi.';

  @override
  String get newInviteLinkGenerated => 'Link undangan baru dibuat';

  @override
  String get inviteLinkCopied => 'Link undangan disalin';

  @override
  String get userNotFound => 'Pengguna tidak ditemukan';

  @override
  String get noDestination => 'Tidak ada tujuan';

  @override
  String get loginTitle => 'Selamat Datang';

  @override
  String get loginSubtitle => 'Masuk untuk memulai perjalanan Anda';

  @override
  String get continueWithKakao => 'Lanjutkan dengan Kakao';

  @override
  String get continueWithNaver => 'Lanjutkan dengan Naver';

  @override
  String get continueWithGoogle => 'Lanjutkan dengan Google';

  @override
  String get account => 'Akun';

  @override
  String get deleteAccount => 'Hapus Akun';

  @override
  String get deleteAccountTitle => 'Hapus Akun';

  @override
  String get deleteAccountMessage =>
      'Apakah Anda yakin ingin menghapus akun Anda? Tindakan ini tidak dapat dibatalkan dan semua data Anda akan dihapus secara permanen.';

  @override
  String get deleteAccountConfirmation => 'Ketik \'HAPUS\' untuk mengonfirmasi';

  @override
  String get deletingAccount => 'Menghapus akun...';

  @override
  String get accountDeleted => 'Akun berhasil dihapus';

  @override
  String get deleteAccountFailed => 'Gagal menghapus akun';

  @override
  String get deleteAccountWarning =>
      'Peringatan: Tindakan ini tidak dapat dibatalkan. Semua data Anda termasuk perjalanan dan pesan akan dihapus secara permanen.';

  @override
  String get reportMessage => 'Laporkan Pesan';

  @override
  String get reportMessageDescription =>
      'Laporkan konten tidak pantas kepada penyelenggara perjalanan';

  @override
  String get blockUser => 'Blokir Pengguna';

  @override
  String get blockUserDescription =>
      'Anda tidak akan melihat pesan dari pengguna ini lagi';

  @override
  String get selectReportReason => 'Pilih alasan pelaporan:';

  @override
  String get additionalDetails => 'Detail Tambahan';

  @override
  String get optionalDescription => 'Jelaskan masalahnya (opsional)';

  @override
  String get report => 'Laporkan';

  @override
  String get block => 'Blokir';

  @override
  String get reportTypeSpam => 'Spam';

  @override
  String get reportTypeHarassment => 'Pelecehan';

  @override
  String get reportTypeInappropriate => 'Konten Tidak Pantas';

  @override
  String get reportTypeHateSpeech => 'Ujaran Kebencian';

  @override
  String get reportTypeViolence => 'Kekerasan';

  @override
  String get reportTypeOther => 'Lainnya';

  @override
  String get reportSubmitted =>
      'Laporan terkirim. Penyelenggara perjalanan akan diberitahu.';

  @override
  String get reportFailed => 'Gagal mengirim laporan. Silakan coba lagi.';

  @override
  String blockUserConfirmation(String userName) {
    return 'Apakah Anda yakin ingin memblokir $userName? Anda tidak akan melihat pesan mereka lagi.';
  }

  @override
  String userBlocked(String userName) {
    return '$userName telah diblokir';
  }

  @override
  String get blockFailed => 'Gagal memblokir pengguna. Silakan coba lagi.';

  @override
  String get blockedUsers => 'Pengguna yang Diblokir';

  @override
  String get noBlockedUsers => 'Tidak ada pengguna yang diblokir';

  @override
  String get unblock => 'Buka Blokir';

  @override
  String userUnblocked(String userName) {
    return '$userName telah dibuka blokirnya';
  }

  @override
  String get reportUser => 'Laporkan Pengguna';

  @override
  String get reportUserDescription =>
      'Laporkan pengguna ini kepada penyelenggara perjalanan';

  @override
  String get locationPermissionDenied => 'Izin lokasi ditolak';

  @override
  String get locationPermissionDeniedForever =>
      'Izin lokasi ditolak secara permanen. Silakan aktifkan di pengaturan.';

  @override
  String get locationServicesDisabled => 'Layanan lokasi dinonaktifkan';

  @override
  String get gettingLocation => 'Mendapatkan lokasi...';

  @override
  String get currentLocation => 'Lokasi saat ini';

  @override
  String get shareLocation => 'Bagikan lokasi';

  @override
  String get shareLocationConfirmation =>
      'Apakah Anda ingin membagikan lokasi ini di chat?';

  @override
  String get share => 'Bagikan';

  @override
  String get uploadFailed => 'Gagal mengunggah';

  @override
  String get openInGoogleMaps => 'Buka di Google Maps';

  @override
  String get getDirections => 'Dapatkan petunjuk arah';

  @override
  String get drivingDirections => 'Petunjuk arah berkendara';

  @override
  String get walkingDirections => 'Petunjuk arah berjalan';

  @override
  String get transitDirections => 'Petunjuk arah transportasi umum';

  @override
  String get noPinnedMessages => 'Tidak ada pesan disematkan';

  @override
  String get noItineraryYet => 'Belum ada rencana perjalanan';

  @override
  String get viewFullItinerary => 'Lihat rencana perjalanan lengkap';

  @override
  String get inviteParticipant => 'Undang peserta';

  @override
  String get emailAddress => 'Alamat email';

  @override
  String get enterEmailAddress => 'Masukkan alamat email';

  @override
  String get invalidEmail => 'Email tidak valid';

  @override
  String get role => 'Peran';

  @override
  String get permissions => 'Izin';

  @override
  String get sendInvite => 'Kirim undangan';

  @override
  String get inviteSent => 'Undangan terkirim';

  @override
  String get editItinerary => 'Edit rencana perjalanan';

  @override
  String get deleteItinerary => 'Hapus rencana perjalanan';

  @override
  String get deleteItineraryConfirm =>
      'Apakah Anda yakin ingin menghapus rencana perjalanan ini?';

  @override
  String get itineraryDeleted => 'Rencana perjalanan dihapus';

  @override
  String get searchPlaces => 'Cari tempat';

  @override
  String get selectLocation => 'Pilih lokasi';

  @override
  String get confirmLocation => 'Konfirmasi lokasi';

  @override
  String get hotelName => 'Nama hotel';

  @override
  String get roomType => 'Tipe kamar';

  @override
  String get checkInTime => 'Waktu check-in';

  @override
  String get checkOutTime => 'Waktu check-out';

  @override
  String get carCompany => 'Perusahaan rental';

  @override
  String get carModel => 'Model mobil';

  @override
  String get pickupLocation => 'Lokasi pengambilan';

  @override
  String get dropoffLocation => 'Lokasi pengembalian';

  @override
  String get pickupTime => 'Waktu pengambilan';

  @override
  String get dropoffTime => 'Waktu pengembalian';

  @override
  String get restaurantName => 'Nama restoran';

  @override
  String get cuisine => 'Jenis masakan';

  @override
  String get priceRange => 'Kisaran harga';

  @override
  String get reservationTime => 'Waktu reservasi';

  @override
  String get departureAirport => 'Bandara keberangkatan';

  @override
  String get arrivalAirport => 'Bandara kedatangan';

  @override
  String get departureTime => 'Waktu keberangkatan';

  @override
  String get arrivalTime => 'Waktu kedatangan';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Gerbang';

  @override
  String get confirmationNumber => 'Nomor konfirmasi';

  @override
  String get other => 'Lainnya';

  @override
  String get title => 'Judul';

  @override
  String get description => 'Deskripsi';

  @override
  String get itemNotFound => 'Item tidak ditemukan';

  @override
  String get selectDay => 'Pilih hari';

  @override
  String get selectAirline => 'Pilih maskapai';

  @override
  String get enterNotesHint => 'Masukkan catatan...';

  @override
  String get enterHotelName => 'Masukkan nama hotel';

  @override
  String get enterRoomType => 'Masukkan tipe kamar';

  @override
  String get enterAddress => 'Masukkan alamat';

  @override
  String get enterConfirmationNumber => 'Masukkan nomor konfirmasi';

  @override
  String get selectCarCompany => 'Pilih perusahaan rental';

  @override
  String get enterCarModel => 'Masukkan model mobil';

  @override
  String get enterPickupLocation => 'Masukkan lokasi pengambilan';

  @override
  String get enterDropoffLocation => 'Masukkan lokasi pengembalian';

  @override
  String get pickupInfo => 'Info pengambilan';

  @override
  String get dropoffInfo => 'Info pengembalian';

  @override
  String get enterRestaurantName => 'Masukkan nama restoran';

  @override
  String get cuisineType => 'Jenis masakan';

  @override
  String get selectCuisineType => 'Pilih jenis masakan';

  @override
  String get reservationInfo => 'Info reservasi';

  @override
  String get enterTitle => 'Masukkan judul';

  @override
  String get enterDescription => 'Masukkan deskripsi';

  @override
  String get enterLocation => 'Masukkan lokasi';

  @override
  String get startTime => 'Waktu mulai';

  @override
  String get endTime => 'Waktu selesai';

  @override
  String get addAttachments => 'Tambah lampiran';

  @override
  String get attachmentHint => 'Tambah dokumen atau gambar';

  @override
  String get itemUpdatedSuccess => 'Item berhasil diperbarui';

  @override
  String get itemDeletedSuccess => 'Item berhasil dihapus';
}
