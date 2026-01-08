// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Bắt Đầu Hành Trình';

  @override
  String get welcomeSubtitle =>
      'Khám phá trải nghiệm mới và tạo nên những kỷ niệm đặc biệt';

  @override
  String get skip => 'Bỏ qua';

  @override
  String get participant => 'Người tham gia';

  @override
  String get host => 'Chủ trì';

  @override
  String get coHost => 'Đồng chủ trì';

  @override
  String get signInWithKakao => 'Tiếp tục với Kakao';

  @override
  String get signInWithNaver => 'Tiếp tục với Naver';

  @override
  String get signInWithGoogle => 'Tiếp tục với Google';

  @override
  String get signInWithApple => 'Tiếp tục với Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Bằng việc đăng nhập, bạn đồng ý với $terms và $privacy của chúng tôi.';
  }

  @override
  String get termsOfService => 'Điều khoản dịch vụ';

  @override
  String get privacyPolicy => 'Chính sách bảo mật';

  @override
  String get welcomeBack => 'Chào mừng trở lại';

  @override
  String get readyForNextJourney => 'Sẵn sàng cho chuyến đi tiếp theo?';

  @override
  String get allTrips => 'Tất cả chuyến đi';

  @override
  String get hosting => 'Đang tổ chức';

  @override
  String get participating => 'Đang tham gia';

  @override
  String get happeningNow => 'Đang diễn ra';

  @override
  String get upcomingAdventures => 'Chuyến phiêu lưu sắp tới';

  @override
  String get viewAll => 'Xem tất cả';

  @override
  String dayOf(int current, int total) {
    return 'Ngày $current của $total';
  }

  @override
  String get inProgress => 'Đang tiến hành';

  @override
  String get manage => 'Quản lý';

  @override
  String get guest => 'Khách';

  @override
  String get tbd => 'Chưa xác định';

  @override
  String get home => 'Trang chủ';

  @override
  String get explore => 'Khám phá';

  @override
  String get chat => 'Trò chuyện';

  @override
  String get profile => 'Hồ sơ';

  @override
  String get createTrip => 'Tạo chuyến đi';

  @override
  String get letsplanYourJourney => 'Hãy lên kế hoạch cho hành trình của bạn';

  @override
  String get hostCanEditLater =>
      'Là chủ trì, bạn có thể chỉnh sửa những chi tiết này bất cứ lúc nào.';

  @override
  String get cancel => 'Hủy';

  @override
  String get save => 'Lưu';

  @override
  String get basicInfo => 'Thông tin cơ bản';

  @override
  String get required => 'Bắt buộc';

  @override
  String get tripName => 'Tên chuyến đi';

  @override
  String get tripNameHint => 'VD: Mùa hè ở Kyoto';

  @override
  String get destination => 'Điểm đến';

  @override
  String get destinationHint => 'Bạn đang đi đâu?';

  @override
  String get dates => 'Ngày';

  @override
  String get startDate => 'Ngày bắt đầu';

  @override
  String get endDate => 'Ngày kết thúc';

  @override
  String get optionalDetails => 'Chi tiết tùy chọn';

  @override
  String get coverPhoto => 'Ảnh bìa';

  @override
  String get tapToUploadCover => 'Nhấn để tải ảnh bìa';

  @override
  String get tripGoalMemo => 'Mục tiêu / Ghi chú chuyến đi';

  @override
  String get tripGoalHint => 'Mục tiêu chính của chuyến đi này là gì?';

  @override
  String get nextStep => 'Bước tiếp theo';

  @override
  String get participantManagement => 'Quản lý người tham gia';

  @override
  String get participating_count => 'Đang tham gia';

  @override
  String get pendingInvites => 'Lời mời đang chờ';

  @override
  String get inviteNewMember => 'Mời thành viên mới';

  @override
  String get searchByNameOrEmail => 'Tìm theo tên hoặc email';

  @override
  String get hosts => 'Người tổ chức';

  @override
  String get admin => 'QUẢN TRỊ';

  @override
  String get travelers => 'Khách du lịch';

  @override
  String get allPermissions => 'Tất cả quyền';

  @override
  String get canEditSchedule => 'Có thể chỉnh sửa lịch trình';

  @override
  String get readOnly => 'Chỉ xem';

  @override
  String get pendingAcceptance => 'Đang chờ chấp nhận';

  @override
  String get resend => 'Gửi lại';

  @override
  String get inviteLinkActivated => 'Đã kích hoạt liên kết mời';

  @override
  String get copy => 'Sao chép';

  @override
  String get allowScheduleEdit => 'Cho phép chỉnh sửa lịch trình';

  @override
  String get allowPhotoUpload => 'Cho phép tải ảnh lên';

  @override
  String get removeFromTrip => 'Xóa khỏi chuyến đi';

  @override
  String joinedDaysAgo(int days) {
    return 'Đã tham gia $days ngày trước';
  }

  @override
  String get itinerary => 'Lịch trình';

  @override
  String get organizerView => 'Chế độ xem người tổ chức';

  @override
  String get draft => 'Bản nháp';

  @override
  String days(int count) {
    return '$count Ngày';
  }

  @override
  String day(int number) {
    return 'Ngày $number';
  }

  @override
  String get addActivity => 'Thêm hoạt động';

  @override
  String get schedule => 'Lịch trình';

  @override
  String get map => 'Bản đồ';

  @override
  String get people => 'Mọi người';

  @override
  String get settings => 'Cài đặt';

  @override
  String get flight => 'Chuyến bay';

  @override
  String get accommodation => 'Chỗ ở';

  @override
  String get rentalCar => 'Xe thuê';

  @override
  String get restaurant => 'Nhà hàng';

  @override
  String get attraction => 'Điểm tham quan';

  @override
  String get activity => 'Hoạt động';

  @override
  String get transportation => 'Phương tiện di chuyển';

  @override
  String get enterDetails => 'Nhập chi tiết';

  @override
  String get airline => 'Hãng hàng không';

  @override
  String get flightNumber => 'Số hiệu chuyến bay';

  @override
  String get departure => 'Khởi hành';

  @override
  String get arrival => 'Đến nơi';

  @override
  String get notes => 'Ghi chú';

  @override
  String get notesHint => 'Viết các ghi chú quan trọng ở đây...';

  @override
  String get addAttachment => 'Thêm tệp đính kèm';

  @override
  String get eTicketOrVoucher => 'Vé điện tử hoặc phiếu (PDF, JPG)';

  @override
  String get reminderSettings => 'Cài đặt nhắc nhở';

  @override
  String get reservationConfirmed => 'Đã xác nhận đặt chỗ';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Hướng dẫn viên - $members Thành viên';
  }

  @override
  String get guide => 'HƯỚNG DẪN';

  @override
  String get organizer => 'NGƯỜI TỔ CHỨC';

  @override
  String get messagePlaceholder => 'Tin nhắn...';

  @override
  String get openMap => 'Mở bản đồ';

  @override
  String get newAnnouncement => 'Thông báo mới';

  @override
  String get toWhom => 'Gửi đến ai?';

  @override
  String get allParticipants => 'Tất cả người tham gia';

  @override
  String get selectSpecific => 'Chọn cụ thể';

  @override
  String othersSelected(int count) {
    return '+ $count người khác được chọn';
  }

  @override
  String get messageDetails => 'Chi tiết tin nhắn';

  @override
  String get nextSchedule => 'Lịch trình tiếp theo';

  @override
  String get urgent => 'Khẩn cấp';

  @override
  String get generalInfo => 'Thông tin chung';

  @override
  String get poll => 'Bình chọn';

  @override
  String get quickTemplates => 'Mẫu nhanh';

  @override
  String get templateBusLeaving => 'Xe buýt khởi hành trong 10 phút';

  @override
  String get templateMeetingPoint => 'Đã thay đổi điểm gặp mặt';

  @override
  String get templateWeather => 'Cảnh báo thời tiết';

  @override
  String get templateDinner => 'Đặt chỗ ăn tối';

  @override
  String get subject => 'Chủ đề';

  @override
  String get subjectHint => 'VD: Gặp nhau ở sảnh';

  @override
  String get message => 'Tin nhắn';

  @override
  String get messageHint => 'Viết thông báo của bạn ở đây...';

  @override
  String get addPhoto => 'Thêm ảnh';

  @override
  String get addLocation => 'Thêm vị trí';

  @override
  String get pinToTopOfChat => 'Ghim lên đầu cuộc trò chuyện';

  @override
  String get keepVisibleForAll => 'Giữ hiển thị cho tất cả người tham gia';

  @override
  String get sendAsUrgentAlert => 'Gửi dưới dạng cảnh báo khẩn cấp';

  @override
  String get notifiesEvenIfMuted => 'Thông báo ngay cả khi đã tắt tiếng';

  @override
  String get sendNotification => 'Gửi thông báo';

  @override
  String get notifications => 'Thông báo';

  @override
  String get markAllAsRead => 'Đánh dấu tất cả đã đọc';

  @override
  String get all => 'Tất cả';

  @override
  String get announcements => 'Thông báo';

  @override
  String get today => 'Hôm nay';

  @override
  String get yesterday => 'Hôm qua';

  @override
  String get announcement => 'Thông báo';

  @override
  String get pastAnnouncement => 'Thông báo trước đây';

  @override
  String minutesAgo(int minutes) {
    return '$minutes phút trước';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours giờ trước';
  }

  @override
  String get tripDetails => 'Chi tiết chuyến đi';

  @override
  String nights(int count) {
    return '$count Đêm';
  }

  @override
  String get hostedBy => 'Tổ chức bởi';

  @override
  String get mapView => 'Xem bản đồ';

  @override
  String get groupChat => 'Trò chuyện nhóm';

  @override
  String get savedDocs => 'Tài liệu đã lưu';

  @override
  String get dontForget => 'Đừng quên!';

  @override
  String get overview => 'Tổng quan';

  @override
  String get expandAll => 'Mở rộng tất cả';

  @override
  String get checkIn => 'Nhận phòng';

  @override
  String get checkOut => 'Trả phòng';

  @override
  String get directions => 'Chỉ đường';

  @override
  String get reservation => 'Đặt chỗ';

  @override
  String get currentStatus => 'Trạng thái hiện tại';

  @override
  String tripStartsIn(int days) {
    return 'Chuyến đi bắt đầu trong $days ngày';
  }

  @override
  String get accountAndPermissions => 'Tài khoản & Quyền';

  @override
  String get profileVisibility => 'Hiển thị hồ sơ';

  @override
  String get displaySettings => 'Cài đặt hiển thị';

  @override
  String get darkMode => 'Chế độ tối';

  @override
  String get fontSize => 'Cỡ chữ';

  @override
  String get standard => 'Tiêu chuẩn';

  @override
  String get notificationSettings => 'Thông báo';

  @override
  String get tripScheduleNotifications => 'Thông báo lịch trình chuyến đi';

  @override
  String get importantChangesPush => 'Thông báo đẩy về các thay đổi quan trọng';

  @override
  String get newMessageNotifications => 'Thông báo tin nhắn mới';

  @override
  String get helpAndSupport => 'Trợ giúp & Hỗ trợ';

  @override
  String get appVersion => 'Phiên bản ứng dụng';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get permissionRequired => 'Yêu cầu quyền';

  @override
  String get notificationPermissionMessage =>
      'TripSync cần quyền thông báo để gửi cho bạn các cập nhật chuyến đi quan trọng và thông báo từ người tổ chức.';

  @override
  String get allowNotifications => 'Cho phép thông báo';

  @override
  String get later => 'Để sau';

  @override
  String get error => 'Lỗi';

  @override
  String get tryAgain => 'Thử lại';

  @override
  String get noTripsYet => 'Chưa có chuyến đi nào';

  @override
  String get createYourFirstTrip =>
      'Tạo chuyến đi đầu tiên hoặc tham gia một chuyến!';

  @override
  String get noNotifications => 'Không có thông báo';

  @override
  String get youreAllCaughtUp => 'Bạn đã cập nhật hết rồi!';

  @override
  String get loading => 'Đang tải...';

  @override
  String get connectionError => 'Lỗi kết nối';

  @override
  String get checkYourInternet => 'Vui lòng kiểm tra kết nối internet của bạn';

  @override
  String get confirmDelete => 'Xác nhận xóa';

  @override
  String get deleteConfirmMessage => 'Bạn có chắc chắn muốn xóa không?';

  @override
  String get delete => 'Xóa';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get done => 'Xong';

  @override
  String get edit => 'Chỉnh sửa';

  @override
  String get close => 'Đóng';

  @override
  String get back => 'Quay lại';

  @override
  String get next => 'Tiếp theo';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get noResults => 'Không tìm thấy kết quả';

  @override
  String get selectDate => 'Chọn ngày';

  @override
  String get selectTime => 'Chọn giờ';

  @override
  String get from => 'Từ';

  @override
  String get to => 'Đến';

  @override
  String get duration => 'Thời lượng';

  @override
  String get location => 'Vị trí';

  @override
  String get address => 'Địa chỉ';

  @override
  String get phone => 'Điện thoại';

  @override
  String get email => 'Email';

  @override
  String get website => 'Trang web';

  @override
  String get price => 'Giá';

  @override
  String get viewMenu => 'Xem thực đơn';

  @override
  String get recommended => 'Đề xuất';

  @override
  String get hiking => 'Đi bộ đường dài';

  @override
  String get warning => 'Cảnh báo';

  @override
  String get viewDetails => 'Xem chi tiết';

  @override
  String get readyForYour => 'Sẵn sàng cho';

  @override
  String get nextJourney => 'chuyến đi tiếp theo?';

  @override
  String get createFirstTrip =>
      'Tạo chuyến đi đầu tiên hoặc tham gia một chuyến!';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get changePhoto => 'Đổi ảnh';

  @override
  String get takePhoto => 'Chụp ảnh';

  @override
  String get chooseFromGallery => 'Chọn từ thư viện';

  @override
  String get removePhoto => 'Xóa ảnh';

  @override
  String get displayName => 'Tên hiển thị';

  @override
  String get enterDisplayName => 'Nhập tên hiển thị của bạn';

  @override
  String get enterPhoneNumber => 'Nhập số điện thoại của bạn';

  @override
  String get displayNameRequired => 'Tên hiển thị là bắt buộc';

  @override
  String get displayNameMinLength => 'Tên hiển thị phải có ít nhất 2 ký tự';

  @override
  String get profileUpdated => 'Hồ sơ đã được cập nhật thành công';

  @override
  String get failedToUpdateProfile => 'Không thể cập nhật hồ sơ';

  @override
  String get failedToPickImage => 'Không thể chọn hình ảnh';

  @override
  String get logoutConfirmation => 'Bạn có chắc chắn muốn đăng xuất không?';

  @override
  String get earlier => 'Trước đó';

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
  String get account => 'Tài khoản';

  @override
  String get deleteAccount => 'Xóa tài khoản';

  @override
  String get deleteAccountTitle => 'Xóa tài khoản';

  @override
  String get deleteAccountMessage =>
      'Bạn có chắc chắn muốn xóa tài khoản không? Hành động này không thể hoàn tác và tất cả dữ liệu của bạn sẽ bị xóa vĩnh viễn.';

  @override
  String get deleteAccountConfirmation => 'Nhập \'XÓA\' để xác nhận';

  @override
  String get deletingAccount => 'Đang xóa tài khoản...';

  @override
  String get accountDeleted => 'Tài khoản đã được xóa thành công';

  @override
  String get deleteAccountFailed => 'Xóa tài khoản thất bại';

  @override
  String get deleteAccountWarning =>
      'Cảnh báo: Hành động này không thể hoàn tác. Tất cả dữ liệu của bạn bao gồm chuyến đi và tin nhắn sẽ bị xóa vĩnh viễn.';
}
