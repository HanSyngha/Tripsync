// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => '开启您的旅程';

  @override
  String get welcomeSubtitle => '发现新体验，创造特别的回忆';

  @override
  String get skip => '跳过';

  @override
  String get participant => '参与者';

  @override
  String get host => '组织者';

  @override
  String get coHost => '协助组织者';

  @override
  String get signInWithKakao => '使用Kakao继续';

  @override
  String get signInWithNaver => '使用Naver继续';

  @override
  String get signInWithGoogle => '使用Google继续';

  @override
  String get signInWithApple => '使用Apple继续';

  @override
  String termsAgreement(String terms, String privacy) {
    return '登录即表示您同意我们的$terms和$privacy。';
  }

  @override
  String get termsOfService => '服务条款';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get welcomeBack => '欢迎回来';

  @override
  String get readyForNextJourney => '准备好下一次旅行了吗？';

  @override
  String get allTrips => '全部行程';

  @override
  String get hosting => '我组织的';

  @override
  String get participating => '我参与的';

  @override
  String get happeningNow => '正在进行';

  @override
  String get upcomingAdventures => '即将到来的旅行';

  @override
  String get viewAll => '查看全部';

  @override
  String dayOf(int current, int total) {
    return '第$current天，共$total天';
  }

  @override
  String get inProgress => '进行中';

  @override
  String get manage => '管理';

  @override
  String get guest => '访客';

  @override
  String get tbd => '待定';

  @override
  String get home => '首页';

  @override
  String get explore => '探索';

  @override
  String get chat => '聊天';

  @override
  String get profile => '个人资料';

  @override
  String get createTrip => '创建行程';

  @override
  String get letsplanYourJourney => '让我们规划您的旅程';

  @override
  String get hostCanEditLater => '作为组织者，您可以随时修改这些信息。';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get basicInfo => '基本信息';

  @override
  String get required => '必填';

  @override
  String get tripName => '行程名称';

  @override
  String get tripNameHint => '例如：京都之夏';

  @override
  String get destination => '目的地';

  @override
  String get destinationHint => '您要去哪里？';

  @override
  String get dates => '日期';

  @override
  String get startDate => '开始日期';

  @override
  String get endDate => '结束日期';

  @override
  String get optionalDetails => '可选信息';

  @override
  String get coverPhoto => '封面照片';

  @override
  String get tapToUploadCover => '点击上传封面';

  @override
  String get tripGoalMemo => '旅行目标/备忘';

  @override
  String get tripGoalHint => '这次旅行的主要目标是什么？';

  @override
  String get nextStep => '下一步';

  @override
  String get participantManagement => '参与者管理';

  @override
  String get participating_count => '参与中';

  @override
  String get pendingInvites => '待接受邀请';

  @override
  String get inviteNewMember => '邀请新成员';

  @override
  String get searchByNameOrEmail => '按姓名或邮箱搜索';

  @override
  String get hosts => '组织者';

  @override
  String get admin => '管理员';

  @override
  String get travelers => '旅行者';

  @override
  String get allPermissions => '拥有所有权限';

  @override
  String get canEditSchedule => '可编辑行程';

  @override
  String get readOnly => '只读';

  @override
  String get pendingAcceptance => '等待接受';

  @override
  String get resend => '重新发送';

  @override
  String get inviteLinkActivated => '邀请链接已激活';

  @override
  String get copy => '复制';

  @override
  String get allowScheduleEdit => '允许编辑行程';

  @override
  String get allowPhotoUpload => '允许上传照片';

  @override
  String get removeFromTrip => '移出行程';

  @override
  String joinedDaysAgo(int days) {
    return '$days天前加入';
  }

  @override
  String get itinerary => '行程安排';

  @override
  String get organizerView => '组织者视图';

  @override
  String get draft => '草稿';

  @override
  String days(int count) {
    return '$count天';
  }

  @override
  String day(int number) {
    return '第$number天';
  }

  @override
  String get addActivity => '添加活动';

  @override
  String get schedule => '日程';

  @override
  String get map => '地图';

  @override
  String get people => '成员';

  @override
  String get settings => '设置';

  @override
  String get flight => '航班';

  @override
  String get accommodation => '住宿';

  @override
  String get rentalCar => '租车';

  @override
  String get restaurant => '餐厅';

  @override
  String get attraction => '景点';

  @override
  String get activity => '活动';

  @override
  String get transportation => '交通';

  @override
  String get enterDetails => '输入详情';

  @override
  String get airline => '航空公司';

  @override
  String get flightNumber => '航班号';

  @override
  String get departure => '出发';

  @override
  String get arrival => '到达';

  @override
  String get notes => '备注';

  @override
  String get notesHint => '在这里写下重要的备注...';

  @override
  String get addAttachment => '添加附件';

  @override
  String get eTicketOrVoucher => '电子机票或凭证 (PDF, JPG)';

  @override
  String get reminderSettings => '提醒设置';

  @override
  String get reservationConfirmed => '预订已确认';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides位向导 • $members位成员';
  }

  @override
  String get guide => '向导';

  @override
  String get organizer => '组织者';

  @override
  String get messagePlaceholder => '消息...';

  @override
  String get openMap => '打开地图';

  @override
  String get newAnnouncement => '新公告';

  @override
  String get toWhom => '发送给';

  @override
  String get allParticipants => '所有参与者';

  @override
  String get selectSpecific => '选择特定人员';

  @override
  String othersSelected(int count) {
    return '+ 已选择$count人';
  }

  @override
  String get messageDetails => '消息内容';

  @override
  String get nextSchedule => '下一个日程';

  @override
  String get urgent => '紧急';

  @override
  String get generalInfo => '一般信息';

  @override
  String get poll => '投票';

  @override
  String get quickTemplates => '快速模板';

  @override
  String get templateBusLeaving => '巴士10分钟后出发';

  @override
  String get templateMeetingPoint => '集合点变更';

  @override
  String get templateWeather => '天气提醒';

  @override
  String get templateDinner => '晚餐预订';

  @override
  String get subject => '主题';

  @override
  String get subjectHint => '例如：大厅集合';

  @override
  String get message => '消息';

  @override
  String get messageHint => '在这里写公告...';

  @override
  String get addPhoto => '添加照片';

  @override
  String get addLocation => '添加位置';

  @override
  String get pinToTopOfChat => '置顶聊天';

  @override
  String get keepVisibleForAll => '对所有参与者持续显示';

  @override
  String get sendAsUrgentAlert => '作为紧急提醒发送';

  @override
  String get notifiesEvenIfMuted => '即使静音也会通知';

  @override
  String get sendNotification => '发送通知';

  @override
  String get notifications => '通知';

  @override
  String get markAllAsRead => '全部标为已读';

  @override
  String get all => '全部';

  @override
  String get announcements => '公告';

  @override
  String get today => '今天';

  @override
  String get yesterday => '昨天';

  @override
  String get announcement => '公告';

  @override
  String get pastAnnouncement => '历史公告';

  @override
  String minutesAgo(int minutes) {
    return '$minutes分钟前';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours小时前';
  }

  @override
  String get tripDetails => '行程详情';

  @override
  String nights(int count) {
    return '$count晚';
  }

  @override
  String get hostedBy => '组织者';

  @override
  String get mapView => '地图视图';

  @override
  String get groupChat => '群聊';

  @override
  String get savedDocs => '已保存文档';

  @override
  String get dontForget => '别忘了！';

  @override
  String get overview => '概览';

  @override
  String get expandAll => '展开全部';

  @override
  String get checkIn => '入住';

  @override
  String get checkOut => '退房';

  @override
  String get directions => '导航';

  @override
  String get reservation => '预订';

  @override
  String get currentStatus => '当前状态';

  @override
  String tripStartsIn(int days) {
    return '$days天后出发';
  }

  @override
  String get accountAndPermissions => '账户和权限';

  @override
  String get profileVisibility => '个人资料可见性';

  @override
  String get displaySettings => '显示设置';

  @override
  String get darkMode => '深色模式';

  @override
  String get fontSize => '字体大小';

  @override
  String get standard => '标准';

  @override
  String get notificationSettings => '通知';

  @override
  String get tripScheduleNotifications => '行程通知';

  @override
  String get importantChangesPush => '重要变更推送通知';

  @override
  String get newMessageNotifications => '新消息通知';

  @override
  String get helpAndSupport => '帮助与支持';

  @override
  String get appVersion => '应用版本';

  @override
  String get logout => '退出登录';

  @override
  String get permissionRequired => '需要权限';

  @override
  String get notificationPermissionMessage =>
      'TripSync需要通知权限来向您发送重要的行程更新和组织者公告。';

  @override
  String get allowNotifications => '允许通知';

  @override
  String get later => '稍后';

  @override
  String get error => '错误';

  @override
  String get tryAgain => '重试';

  @override
  String get noTripsYet => '还没有行程';

  @override
  String get createYourFirstTrip => '创建您的第一个行程或加入一个！';

  @override
  String get noNotifications => '没有通知';

  @override
  String get youreAllCaughtUp => '您已查看所有通知！';

  @override
  String get loading => '加载中...';

  @override
  String get connectionError => '连接错误';

  @override
  String get checkYourInternet => '请检查您的网络连接';

  @override
  String get confirmDelete => '确认删除';

  @override
  String get deleteConfirmMessage => '您确定要删除吗？';

  @override
  String get delete => '删除';

  @override
  String get confirm => '确认';

  @override
  String get done => '完成';

  @override
  String get edit => '编辑';

  @override
  String get close => '关闭';

  @override
  String get back => '返回';

  @override
  String get next => '下一步';

  @override
  String get search => '搜索';

  @override
  String get noResults => '未找到结果';

  @override
  String get selectDate => '选择日期';

  @override
  String get selectTime => '选择时间';

  @override
  String get from => '从';

  @override
  String get to => '到';

  @override
  String get duration => '时长';

  @override
  String get location => '位置';

  @override
  String get address => '地址';

  @override
  String get phone => '电话';

  @override
  String get email => '邮箱';

  @override
  String get website => '网站';

  @override
  String get price => '价格';

  @override
  String get viewMenu => '查看菜单';

  @override
  String get recommended => '推荐';

  @override
  String get hiking => '徒步';

  @override
  String get warning => '警告';

  @override
  String get viewDetails => '查看详情';

  @override
  String get readyForYour => '准备好';

  @override
  String get nextJourney => '下一次旅行了吗？';

  @override
  String get createFirstTrip => '创建您的第一个行程或加入一个！';

  @override
  String get language => '语言';

  @override
  String get changePhoto => '更换照片';

  @override
  String get takePhoto => '拍照';

  @override
  String get chooseFromGallery => '从相册选择';

  @override
  String get removePhoto => '删除照片';

  @override
  String get displayName => '显示名称';

  @override
  String get enterDisplayName => '请输入显示名称';

  @override
  String get enterPhoneNumber => '请输入电话号码';

  @override
  String get displayNameRequired => '显示名称为必填项';

  @override
  String get displayNameMinLength => '显示名称至少需要2个字符';

  @override
  String get profileUpdated => '个人资料已更新';

  @override
  String get failedToUpdateProfile => '更新个人资料失败';

  @override
  String get failedToPickImage => '选择图片失败';

  @override
  String get logoutConfirmation => '确定要退出登录吗？';

  @override
  String get earlier => '更早';

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
  String get account => '账户';

  @override
  String get deleteAccount => '删除账户';

  @override
  String get deleteAccountTitle => '确定要删除账户吗？';

  @override
  String get deleteAccountMessage => '此操作无法撤销。包括旅行、消息和个人资料在内的所有数据将被永久删除。';

  @override
  String get deleteAccountConfirmation => '请输入 DELETE 以确认';

  @override
  String get deletingAccount => '正在删除账户...';

  @override
  String get accountDeleted => '账户已成功删除';

  @override
  String get deleteAccountFailed => '删除账户失败';

  @override
  String get deleteAccountWarning => '警告：您的账户和所有相关数据将被永久删除。';
}
