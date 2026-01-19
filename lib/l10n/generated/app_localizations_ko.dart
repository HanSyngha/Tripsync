// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => '여행의 시작';

  @override
  String get welcomeSubtitle => '새로운 경험을 발견하고 특별한 추억을 만들어보세요';

  @override
  String get skip => '건너뛰기';

  @override
  String get participant => '참여자';

  @override
  String get host => '진행자';

  @override
  String get coHost => '공동 진행자';

  @override
  String get signInWithKakao => '카카오로 계속하기';

  @override
  String get signInWithNaver => '네이버로 계속하기';

  @override
  String get signInWithGoogle => 'Google로 계속하기';

  @override
  String get signInWithApple => 'Apple로 계속하기';

  @override
  String termsAgreement(String terms, String privacy) {
    return '로그인 시 $terms 및 $privacy에 동의하게 됩니다.';
  }

  @override
  String get termsOfService => '이용약관';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get welcomeBack => '돌아오신 것을 환영합니다';

  @override
  String get readyForNextJourney => '다음 여행을 준비하셨나요?';

  @override
  String get allTrips => '전체 여행';

  @override
  String get hosting => '진행 중';

  @override
  String get participating => '참여 중';

  @override
  String get happeningNow => '진행 중인 여행';

  @override
  String get upcomingAdventures => '예정된 여행';

  @override
  String get viewAll => '전체 보기';

  @override
  String dayOf(int current, int total) {
    return '$total일 중 $current일차';
  }

  @override
  String get inProgress => '진행 중';

  @override
  String get manage => '관리';

  @override
  String get guest => '게스트';

  @override
  String get tbd => '미정';

  @override
  String get home => '홈';

  @override
  String get explore => '탐색';

  @override
  String get chat => '채팅';

  @override
  String get profile => '프로필';

  @override
  String get createTrip => '여행 만들기';

  @override
  String get letsplanYourJourney => '여행을 계획해 보세요';

  @override
  String get hostCanEditLater => '진행자로서 나중에 언제든지 이 정보를 수정할 수 있습니다.';

  @override
  String get cancel => '취소';

  @override
  String get save => '저장';

  @override
  String get basicInfo => '기본 정보';

  @override
  String get required => '필수';

  @override
  String get tripName => '여행 이름';

  @override
  String get tripNameHint => '예: 교토에서의 여름';

  @override
  String get destination => '목적지';

  @override
  String get destinationHint => '어디로 떠나시나요?';

  @override
  String get dates => '날짜';

  @override
  String get startDate => '시작일';

  @override
  String get endDate => '종료일';

  @override
  String get optionalDetails => '추가 정보';

  @override
  String get coverPhoto => '커버 사진';

  @override
  String get tapToUploadCover => '탭하여 커버 업로드';

  @override
  String get tripGoalMemo => '여행 목표 / 메모';

  @override
  String get tripGoalHint => '이 여행의 주요 목표는 무엇인가요?';

  @override
  String get nextStep => '다음 단계';

  @override
  String get participantManagement => '참여자 관리';

  @override
  String get participating_count => '참여 중';

  @override
  String get pendingInvites => '초대 대기';

  @override
  String get inviteNewMember => '새 멤버 초대하기';

  @override
  String get searchByNameOrEmail => '이름 또는 이메일로 검색';

  @override
  String get hosts => '운영진';

  @override
  String get admin => '관리자';

  @override
  String get travelers => '참여자';

  @override
  String get allPermissions => '모든 권한 보유';

  @override
  String get canEditSchedule => '일정 편집 가능';

  @override
  String get readOnly => '읽기 전용';

  @override
  String get pendingAcceptance => '초대 수락 대기 중';

  @override
  String get resend => '재전송';

  @override
  String get inviteLinkActivated => '초대 링크가 활성화되었습니다';

  @override
  String get copy => '복사';

  @override
  String get allowScheduleEdit => '일정 편집 허용';

  @override
  String get allowPhotoUpload => '사진 업로드 허용';

  @override
  String get removeFromTrip => '내보내기';

  @override
  String joinedDaysAgo(int days) {
    return '$days일 전 가입';
  }

  @override
  String get itinerary => '일정';

  @override
  String get organizerView => '진행자 화면';

  @override
  String get draft => '임시저장';

  @override
  String days(int count) {
    return '$count일';
  }

  @override
  String day(int number) {
    return '$number일차';
  }

  @override
  String get addActivity => '일정 추가';

  @override
  String get schedule => '일정';

  @override
  String get map => '지도';

  @override
  String get people => '인원';

  @override
  String get settings => '설정';

  @override
  String get flight => '항공편';

  @override
  String get accommodation => '숙소';

  @override
  String get rentalCar => '렌터카';

  @override
  String get restaurant => '식당';

  @override
  String get attraction => '관광지';

  @override
  String get activity => '활동';

  @override
  String get transportation => '교통';

  @override
  String get enterDetails => '세부 정보 입력';

  @override
  String get airline => '항공사';

  @override
  String get flightNumber => '편명';

  @override
  String get departure => '출발';

  @override
  String get arrival => '도착';

  @override
  String get notes => '메모';

  @override
  String get notesHint => '터미널 정보, 게이트 번호 등 잊지 말아야 할 내용을 적어주세요.';

  @override
  String get addAttachment => '첨부파일 추가';

  @override
  String get eTicketOrVoucher => 'E-티켓 또는 바우처 (PDF, JPG)';

  @override
  String get reminderSettings => '알림 설정';

  @override
  String get reservationConfirmed => '예약 확정';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides명의 가이드 • $members명의 멤버';
  }

  @override
  String get guide => '가이드';

  @override
  String get organizer => '진행자';

  @override
  String get messagePlaceholder => '메시지...';

  @override
  String get openMap => '지도 열기';

  @override
  String get newAnnouncement => '새 공지사항';

  @override
  String get toWhom => '받는 사람';

  @override
  String get allParticipants => '전체 참여자';

  @override
  String get selectSpecific => '특정 참여자 선택';

  @override
  String othersSelected(int count) {
    return '+ $count명 선택됨';
  }

  @override
  String get messageDetails => '메시지 내용';

  @override
  String get nextSchedule => '다음 일정';

  @override
  String get urgent => '긴급';

  @override
  String get generalInfo => '일반 정보';

  @override
  String get poll => '투표';

  @override
  String get quickTemplates => '빠른 템플릿';

  @override
  String get templateBusLeaving => '버스 10분 후 출발';

  @override
  String get templateMeetingPoint => '집합 장소 변경';

  @override
  String get templateWeather => '날씨 알림';

  @override
  String get templateDinner => '저녁 식사 예약';

  @override
  String get subject => '제목';

  @override
  String get subjectHint => '예: 로비 집합';

  @override
  String get message => '메시지';

  @override
  String get messageHint => '공지사항을 작성해 주세요...';

  @override
  String get addPhoto => '사진 추가';

  @override
  String get addLocation => '위치 추가';

  @override
  String get pinToTopOfChat => '채팅 상단에 고정';

  @override
  String get keepVisibleForAll => '모든 참여자에게 계속 표시';

  @override
  String get sendAsUrgentAlert => '긴급 알림으로 전송';

  @override
  String get notifiesEvenIfMuted => '음소거 상태에서도 알림';

  @override
  String get sendNotification => '알림 보내기';

  @override
  String get notifications => '알림';

  @override
  String get markAllAsRead => '모두 읽음';

  @override
  String get all => '전체';

  @override
  String get announcements => '공지';

  @override
  String get today => '오늘';

  @override
  String get yesterday => '어제';

  @override
  String get announcement => '공지';

  @override
  String get pastAnnouncement => '지난 공지';

  @override
  String minutesAgo(int minutes) {
    return '$minutes분 전';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours시간 전';
  }

  @override
  String get tripDetails => '여행 상세';

  @override
  String nights(int count) {
    return '$count박';
  }

  @override
  String get hostedBy => '진행자';

  @override
  String get mapView => '지도 보기';

  @override
  String get groupChat => '그룹 채팅';

  @override
  String get savedDocs => '저장된 문서';

  @override
  String get dontForget => '잊지 마세요!';

  @override
  String get overview => '개요';

  @override
  String get expandAll => '전체 펼치기';

  @override
  String get checkIn => '체크인';

  @override
  String get checkOut => '체크아웃';

  @override
  String get directions => '길찾기';

  @override
  String get reservation => '예약 정보';

  @override
  String get currentStatus => '현재 상태';

  @override
  String tripStartsIn(int days) {
    return '$days일 후 출발';
  }

  @override
  String get accountAndPermissions => '계정 및 권한';

  @override
  String get profileVisibility => '프로필 공개 범위';

  @override
  String get displaySettings => '화면 설정';

  @override
  String get darkMode => '다크 모드';

  @override
  String get fontSize => '글자 크기';

  @override
  String get standard => '표준';

  @override
  String get notificationSettings => '알림';

  @override
  String get tripScheduleNotifications => '여행 일정 알림';

  @override
  String get importantChangesPush => '중요 변경사항 푸시 알림';

  @override
  String get newMessageNotifications => '새 메시지 알림';

  @override
  String get helpAndSupport => '도움말 및 지원';

  @override
  String get appVersion => '앱 버전';

  @override
  String get logout => '로그아웃';

  @override
  String get permissionRequired => '권한 필요';

  @override
  String get notificationPermissionMessage =>
      'TripSync가 중요한 여행 업데이트와 진행자의 공지사항을 보내려면 알림 권한이 필요합니다.';

  @override
  String get allowNotifications => '알림 허용';

  @override
  String get later => '나중에';

  @override
  String get error => '오류';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get noTripsYet => '아직 여행이 없습니다';

  @override
  String get createYourFirstTrip => '첫 번째 여행을 만들거나 참여하세요!';

  @override
  String get noNotifications => '알림이 없습니다';

  @override
  String get youreAllCaughtUp => '모든 알림을 확인했습니다!';

  @override
  String get loading => '로딩 중...';

  @override
  String get connectionError => '연결 오류';

  @override
  String get checkYourInternet => '인터넷 연결을 확인해 주세요';

  @override
  String get confirmDelete => '삭제 확인';

  @override
  String get deleteConfirmMessage => '정말 삭제하시겠습니까?';

  @override
  String get delete => '삭제';

  @override
  String get confirm => '확인';

  @override
  String get done => '완료';

  @override
  String get edit => '편집';

  @override
  String get close => '닫기';

  @override
  String get back => '뒤로';

  @override
  String get next => '다음';

  @override
  String get search => '검색';

  @override
  String get noResults => '검색 결과가 없습니다';

  @override
  String get selectDate => '날짜 선택';

  @override
  String get selectTime => '시간 선택';

  @override
  String get from => '출발지';

  @override
  String get to => '도착지';

  @override
  String get duration => '소요 시간';

  @override
  String get location => '위치';

  @override
  String get address => '주소';

  @override
  String get phone => '전화번호';

  @override
  String get email => '이메일';

  @override
  String get website => '웹사이트';

  @override
  String get price => '가격';

  @override
  String get viewMenu => '메뉴 보기';

  @override
  String get recommended => '추천';

  @override
  String get hiking => '하이킹';

  @override
  String get warning => '주의';

  @override
  String get viewDetails => '상세 보기';

  @override
  String get readyForYour => '다음 여행을';

  @override
  String get nextJourney => '준비하셨나요?';

  @override
  String get createFirstTrip => '첫 번째 여행을 만들거나 참여하세요!';

  @override
  String get language => '언어';

  @override
  String get changePhoto => '사진 변경';

  @override
  String get takePhoto => '사진 촬영';

  @override
  String get chooseFromGallery => '갤러리에서 선택';

  @override
  String get removePhoto => '사진 삭제';

  @override
  String get displayName => '표시 이름';

  @override
  String get enterDisplayName => '표시 이름을 입력하세요';

  @override
  String get enterPhoneNumber => '전화번호를 입력하세요';

  @override
  String get displayNameRequired => '표시 이름은 필수입니다';

  @override
  String get displayNameMinLength => '표시 이름은 최소 2자 이상이어야 합니다';

  @override
  String get profileUpdated => '프로필이 업데이트되었습니다';

  @override
  String get failedToUpdateProfile => '프로필 업데이트에 실패했습니다';

  @override
  String get failedToPickImage => '이미지를 선택하지 못했습니다';

  @override
  String get logoutConfirmation => '정말 로그아웃 하시겠습니까?';

  @override
  String get earlier => '이전';

  @override
  String get discardTrip => '여행을 취소하시겠습니까?';

  @override
  String get discardTripMessage => '정말 이 여행을 취소하시겠습니까? 모든 변경사항이 사라집니다.';

  @override
  String get discardChanges => '변경사항을 취소하시겠습니까?';

  @override
  String get discardChangesMessage => '정말 변경사항을 취소하시겠습니까?';

  @override
  String get keepEditing => '계속 편집';

  @override
  String get discard => '취소';

  @override
  String get tripCreatedSuccess => '여행이 생성되었습니다!';

  @override
  String get tripUpdatedSuccess => '여행이 업데이트되었습니다!';

  @override
  String get tripNotFound => '여행을 찾을 수 없습니다';

  @override
  String get itinerarySaved => '일정이 저장되었습니다';

  @override
  String get comingSoon => '출시 예정';

  @override
  String get signOut => '로그아웃';

  @override
  String get retry => '다시 시도';

  @override
  String get viewParticipants => '참여자 보기';

  @override
  String get pinnedMessages => '고정된 메시지';

  @override
  String get searchMessages => '메시지 검색';

  @override
  String get sendAnnouncement => '공지사항 보내기';

  @override
  String get photo => '사진';

  @override
  String get camera => '카메라';

  @override
  String get sharePhotosFromGallery => '갤러리에서 사진 공유';

  @override
  String get takeNewPhoto => '새 사진 촬영';

  @override
  String get shareCurrentLocation => '현재 위치 공유';

  @override
  String get featureComingSoon => '곧 출시됩니다!';

  @override
  String get activityAddedSuccess => '활동이 추가되었습니다';

  @override
  String get filePickerComingSoon => '파일 선택 기능 출시 예정';

  @override
  String get pleaseEnterMessage => '메시지를 입력해 주세요';

  @override
  String get announcementSentSuccess => '공지사항이 전송되었습니다!';

  @override
  String get failedToLoadParticipants => '참여자를 불러오지 못했습니다';

  @override
  String get loginRequired => '로그인이 필요합니다';

  @override
  String get inviteSendFailed => '초대 전송에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get newInviteLinkGenerated => '새 초대 링크가 생성되었습니다';

  @override
  String get inviteLinkCopied => '초대 링크가 복사되었습니다';

  @override
  String get userNotFound => '사용자를 찾을 수 없습니다';

  @override
  String get noDestination => '목적지 없음';

  @override
  String get loginTitle => '환영합니다';

  @override
  String get loginSubtitle => '여행을 시작하려면 로그인하세요';

  @override
  String get continueWithKakao => '카카오로 계속하기';

  @override
  String get continueWithNaver => '네이버로 계속하기';

  @override
  String get continueWithGoogle => '구글로 계속하기';

  @override
  String get account => '계정';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get deleteAccountTitle => '계정을 삭제하시겠습니까?';

  @override
  String get deleteAccountMessage =>
      '이 작업은 취소할 수 없습니다. 여행, 메시지, 프로필 정보를 포함한 모든 데이터가 영구적으로 삭제됩니다.';

  @override
  String get deleteAccountConfirmation => '확인을 위해 DELETE를 입력하세요';

  @override
  String get deletingAccount => '계정 삭제 중...';

  @override
  String get accountDeleted => '계정이 성공적으로 삭제되었습니다';

  @override
  String get deleteAccountFailed => '계정 삭제에 실패했습니다';

  @override
  String get deleteAccountWarning => '경고: 계정과 관련된 모든 데이터가 영구적으로 삭제됩니다.';

  @override
  String get reportMessage => '메시지 신고';

  @override
  String get reportMessageDescription => '부적절한 내용을 여행 진행자에게 신고합니다';

  @override
  String get blockUser => '사용자 차단';

  @override
  String get blockUserDescription => '이 사용자의 메시지를 더 이상 볼 수 없습니다';

  @override
  String get selectReportReason => '신고 사유를 선택하세요:';

  @override
  String get additionalDetails => '추가 설명';

  @override
  String get optionalDescription => '문제를 설명해 주세요 (선택사항)';

  @override
  String get report => '신고';

  @override
  String get block => '차단';

  @override
  String get reportTypeSpam => '스팸';

  @override
  String get reportTypeHarassment => '괴롭힘';

  @override
  String get reportTypeInappropriate => '부적절한 콘텐츠';

  @override
  String get reportTypeHateSpeech => '혐오 발언';

  @override
  String get reportTypeViolence => '폭력';

  @override
  String get reportTypeOther => '기타';

  @override
  String get reportSubmitted => '신고가 접수되었습니다. 여행 진행자에게 알림이 전송됩니다.';

  @override
  String get reportFailed => '신고 접수에 실패했습니다. 다시 시도해 주세요.';

  @override
  String blockUserConfirmation(String userName) {
    return '$userName님을 차단하시겠습니까? 더 이상 이 사용자의 메시지를 볼 수 없습니다.';
  }

  @override
  String userBlocked(String userName) {
    return '$userName님이 차단되었습니다';
  }

  @override
  String get blockFailed => '사용자 차단에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get blockedUsers => '차단된 사용자';

  @override
  String get noBlockedUsers => '차단된 사용자가 없습니다';

  @override
  String get unblock => '차단 해제';

  @override
  String userUnblocked(String userName) {
    return '$userName님의 차단이 해제되었습니다';
  }

  @override
  String get reportUser => '사용자 신고';

  @override
  String get reportUserDescription => '이 사용자를 여행 진행자에게 신고합니다';

  @override
  String get locationPermissionDenied => '위치 권한이 거부되었습니다';

  @override
  String get locationPermissionDeniedForever =>
      '위치 권한이 영구적으로 거부되었습니다. 설정에서 활성화해 주세요.';

  @override
  String get locationServicesDisabled =>
      '위치 서비스가 비활성화되어 있습니다. 위치 서비스를 활성화해 주세요.';

  @override
  String get gettingLocation => '현재 위치를 가져오는 중...';

  @override
  String get currentLocation => '현재 위치';

  @override
  String get shareLocation => '위치 공유';

  @override
  String get shareLocationConfirmation => '현재 위치를 그룹과 공유하시겠습니까?';

  @override
  String get share => '공유';

  @override
  String get uploadFailed => '업로드 실패';

  @override
  String get openInGoogleMaps => 'Google 지도에서 열기';

  @override
  String get getDirections => '길찾기';

  @override
  String get drivingDirections => '자동차 길찾기';

  @override
  String get walkingDirections => '도보 길찾기';

  @override
  String get transitDirections => '대중교통 길찾기';

  @override
  String get noPinnedMessages => '고정된 메시지가 없습니다';

  @override
  String get noItineraryYet => '아직 일정이 없습니다';

  @override
  String get viewFullItinerary => '전체 일정 보기';

  @override
  String get inviteParticipant => '참여자 초대';

  @override
  String get emailAddress => '이메일 주소';

  @override
  String get enterEmailAddress => '이메일 주소를 입력하세요';

  @override
  String get invalidEmail => '유효한 이메일 주소를 입력해 주세요';

  @override
  String get role => '역할';

  @override
  String get permissions => '권한';

  @override
  String get sendInvite => '초대 보내기';

  @override
  String get inviteSent => '초대가 전송되었습니다';

  @override
  String get editItinerary => '일정 수정';

  @override
  String get deleteItinerary => '일정 삭제';

  @override
  String get deleteItineraryConfirm => '이 일정 항목을 삭제하시겠습니까?';

  @override
  String get itineraryDeleted => '일정이 삭제되었습니다';

  @override
  String get searchPlaces => '장소 검색';

  @override
  String get selectLocation => '위치 선택';

  @override
  String get confirmLocation => '위치 확인';

  @override
  String get hotelName => '호텔 이름';

  @override
  String get roomType => '객실 유형';

  @override
  String get checkInTime => '체크인 시간';

  @override
  String get checkOutTime => '체크아웃 시간';

  @override
  String get carCompany => '렌터카 회사';

  @override
  String get carModel => '차량 모델';

  @override
  String get pickupLocation => '픽업 장소';

  @override
  String get dropoffLocation => '반납 장소';

  @override
  String get pickupTime => '픽업 시간';

  @override
  String get dropoffTime => '반납 시간';

  @override
  String get restaurantName => '식당 이름';

  @override
  String get cuisine => '음식 종류';

  @override
  String get priceRange => '가격대';

  @override
  String get reservationTime => '예약 시간';

  @override
  String get departureAirport => '출발 공항';

  @override
  String get arrivalAirport => '도착 공항';

  @override
  String get departureTime => '출발 시간';

  @override
  String get arrivalTime => '도착 시간';

  @override
  String get terminal => '터미널';

  @override
  String get gate => '게이트';

  @override
  String get confirmationNumber => '예약 번호';

  @override
  String get other => '기타';

  @override
  String get title => '제목';

  @override
  String get description => '설명';

  @override
  String get itemNotFound => '항목을 찾을 수 없습니다';

  @override
  String get selectDay => '일자 선택';

  @override
  String get selectAirline => '항공사 선택';

  @override
  String get enterNotesHint => '추가 메모를 입력하세요';

  @override
  String get enterHotelName => '호텔 이름을 입력하세요';

  @override
  String get enterRoomType => '예: 디럭스 트윈';

  @override
  String get enterAddress => '주소를 입력하세요';

  @override
  String get enterConfirmationNumber => '예약 번호를 입력하세요';

  @override
  String get selectCarCompany => '렌터카 회사 선택';

  @override
  String get enterCarModel => '예: 현대 아반떼';

  @override
  String get enterPickupLocation => '픽업 장소를 입력하세요';

  @override
  String get enterDropoffLocation => '반납 장소를 입력하세요';

  @override
  String get pickupInfo => '픽업 정보';

  @override
  String get dropoffInfo => '반납 정보';

  @override
  String get enterRestaurantName => '식당 이름을 입력하세요';

  @override
  String get cuisineType => '음식 종류';

  @override
  String get selectCuisineType => '음식 종류 선택';

  @override
  String get reservationInfo => '예약 정보';

  @override
  String get enterTitle => '제목을 입력하세요';

  @override
  String get enterDescription => '설명을 입력하세요';

  @override
  String get enterLocation => '위치를 입력하세요';

  @override
  String get startTime => '시작 시간';

  @override
  String get endTime => '종료 시간';

  @override
  String get addAttachments => '첨부파일 추가';

  @override
  String get attachmentHint => 'E-티켓, 예약 확인서 등';

  @override
  String get itemUpdatedSuccess => '항목이 업데이트되었습니다';

  @override
  String get itemDeletedSuccess => '항목이 삭제되었습니다';
}
