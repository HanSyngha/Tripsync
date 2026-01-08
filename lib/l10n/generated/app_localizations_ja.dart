// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => '旅の始まり';

  @override
  String get welcomeSubtitle => '新しい体験を発見し、特別な思い出を作りましょう';

  @override
  String get skip => 'スキップ';

  @override
  String get participant => '参加者';

  @override
  String get host => '主催者';

  @override
  String get coHost => '共同主催者';

  @override
  String get signInWithKakao => 'Kakaoで続ける';

  @override
  String get signInWithNaver => 'Naverで続ける';

  @override
  String get signInWithGoogle => 'Googleで続ける';

  @override
  String get signInWithApple => 'Appleで続ける';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'ログインすると、$termsと$privacyに同意したことになります。';
  }

  @override
  String get termsOfService => '利用規約';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get welcomeBack => 'おかえりなさい';

  @override
  String get readyForNextJourney => '次の旅の準備はできましたか？';

  @override
  String get allTrips => 'すべての旅行';

  @override
  String get hosting => '主催中';

  @override
  String get participating => '参加中';

  @override
  String get happeningNow => '進行中';

  @override
  String get upcomingAdventures => '今後の旅行';

  @override
  String get viewAll => 'すべて見る';

  @override
  String dayOf(int current, int total) {
    return '$total日中$current日目';
  }

  @override
  String get inProgress => '進行中';

  @override
  String get manage => '管理';

  @override
  String get guest => 'ゲスト';

  @override
  String get tbd => '未定';

  @override
  String get home => 'ホーム';

  @override
  String get explore => '探索';

  @override
  String get chat => 'チャット';

  @override
  String get profile => 'プロフィール';

  @override
  String get createTrip => '旅行を作成';

  @override
  String get letsplanYourJourney => '旅行を計画しましょう';

  @override
  String get hostCanEditLater => '主催者として、いつでもこれらの詳細を編集できます。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get basicInfo => '基本情報';

  @override
  String get required => '必須';

  @override
  String get tripName => '旅行名';

  @override
  String get tripNameHint => '例：京都の夏';

  @override
  String get destination => '目的地';

  @override
  String get destinationHint => 'どこへ行きますか？';

  @override
  String get dates => '日程';

  @override
  String get startDate => '開始日';

  @override
  String get endDate => '終了日';

  @override
  String get optionalDetails => 'オプション情報';

  @override
  String get coverPhoto => 'カバー写真';

  @override
  String get tapToUploadCover => 'タップしてカバーをアップロード';

  @override
  String get tripGoalMemo => '旅行の目標/メモ';

  @override
  String get tripGoalHint => 'この旅行の主な目標は何ですか？';

  @override
  String get nextStep => '次へ';

  @override
  String get participantManagement => '参加者管理';

  @override
  String get participating_count => '参加中';

  @override
  String get pendingInvites => '招待待ち';

  @override
  String get inviteNewMember => '新しいメンバーを招待';

  @override
  String get searchByNameOrEmail => '名前またはメールで検索';

  @override
  String get hosts => '主催者';

  @override
  String get admin => '管理者';

  @override
  String get travelers => '旅行者';

  @override
  String get allPermissions => 'すべての権限あり';

  @override
  String get canEditSchedule => 'スケジュール編集可能';

  @override
  String get readOnly => '閲覧のみ';

  @override
  String get pendingAcceptance => '承認待ち';

  @override
  String get resend => '再送信';

  @override
  String get inviteLinkActivated => '招待リンクが有効になりました';

  @override
  String get copy => 'コピー';

  @override
  String get allowScheduleEdit => 'スケジュール編集を許可';

  @override
  String get allowPhotoUpload => '写真アップロードを許可';

  @override
  String get removeFromTrip => '旅行から削除';

  @override
  String joinedDaysAgo(int days) {
    return '$days日前に参加';
  }

  @override
  String get itinerary => '旅程';

  @override
  String get organizerView => '主催者ビュー';

  @override
  String get draft => '下書き';

  @override
  String days(int count) {
    return '$count日間';
  }

  @override
  String day(int number) {
    return '$number日目';
  }

  @override
  String get addActivity => 'アクティビティを追加';

  @override
  String get schedule => 'スケジュール';

  @override
  String get map => 'マップ';

  @override
  String get people => 'メンバー';

  @override
  String get settings => '設定';

  @override
  String get flight => 'フライト';

  @override
  String get accommodation => '宿泊';

  @override
  String get rentalCar => 'レンタカー';

  @override
  String get restaurant => 'レストラン';

  @override
  String get attraction => '観光地';

  @override
  String get activity => 'アクティビティ';

  @override
  String get transportation => '交通';

  @override
  String get enterDetails => '詳細を入力';

  @override
  String get airline => '航空会社';

  @override
  String get flightNumber => '便名';

  @override
  String get departure => '出発';

  @override
  String get arrival => '到着';

  @override
  String get notes => 'メモ';

  @override
  String get notesHint => '重要なメモをここに書いてください...';

  @override
  String get addAttachment => '添付ファイルを追加';

  @override
  String get eTicketOrVoucher => 'Eチケットまたはバウチャー (PDF, JPG)';

  @override
  String get reminderSettings => 'リマインダー設定';

  @override
  String get reservationConfirmed => '予約確定';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides名のガイド・$members名のメンバー';
  }

  @override
  String get guide => 'ガイド';

  @override
  String get organizer => '主催者';

  @override
  String get messagePlaceholder => 'メッセージ...';

  @override
  String get openMap => 'マップを開く';

  @override
  String get newAnnouncement => '新しいお知らせ';

  @override
  String get toWhom => '宛先';

  @override
  String get allParticipants => '全参加者';

  @override
  String get selectSpecific => '特定の人を選択';

  @override
  String othersSelected(int count) {
    return '+ $count名を選択';
  }

  @override
  String get messageDetails => 'メッセージ内容';

  @override
  String get nextSchedule => '次のスケジュール';

  @override
  String get urgent => '緊急';

  @override
  String get generalInfo => '一般情報';

  @override
  String get poll => '投票';

  @override
  String get quickTemplates => 'クイックテンプレート';

  @override
  String get templateBusLeaving => 'バス10分後出発';

  @override
  String get templateMeetingPoint => '集合場所変更';

  @override
  String get templateWeather => '天気情報';

  @override
  String get templateDinner => '夕食予約';

  @override
  String get subject => '件名';

  @override
  String get subjectHint => '例：ロビー集合';

  @override
  String get message => 'メッセージ';

  @override
  String get messageHint => 'お知らせを書いてください...';

  @override
  String get addPhoto => '写真を追加';

  @override
  String get addLocation => '位置を追加';

  @override
  String get pinToTopOfChat => 'チャットの上部に固定';

  @override
  String get keepVisibleForAll => '全参加者に表示し続ける';

  @override
  String get sendAsUrgentAlert => '緊急アラートとして送信';

  @override
  String get notifiesEvenIfMuted => 'ミュート中でも通知';

  @override
  String get sendNotification => '通知を送信';

  @override
  String get notifications => '通知';

  @override
  String get markAllAsRead => 'すべて既読にする';

  @override
  String get all => 'すべて';

  @override
  String get announcements => 'お知らせ';

  @override
  String get today => '今日';

  @override
  String get yesterday => '昨日';

  @override
  String get announcement => 'お知らせ';

  @override
  String get pastAnnouncement => '過去のお知らせ';

  @override
  String minutesAgo(int minutes) {
    return '$minutes分前';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours時間前';
  }

  @override
  String get tripDetails => '旅行の詳細';

  @override
  String nights(int count) {
    return '$count泊';
  }

  @override
  String get hostedBy => '主催者';

  @override
  String get mapView => 'マップビュー';

  @override
  String get groupChat => 'グループチャット';

  @override
  String get savedDocs => '保存済みドキュメント';

  @override
  String get dontForget => 'お忘れなく！';

  @override
  String get overview => '概要';

  @override
  String get expandAll => 'すべて展開';

  @override
  String get checkIn => 'チェックイン';

  @override
  String get checkOut => 'チェックアウト';

  @override
  String get directions => 'ルート案内';

  @override
  String get reservation => '予約';

  @override
  String get currentStatus => '現在の状況';

  @override
  String tripStartsIn(int days) {
    return '出発まであと$days日';
  }

  @override
  String get accountAndPermissions => 'アカウントと権限';

  @override
  String get profileVisibility => 'プロフィールの公開範囲';

  @override
  String get displaySettings => '表示設定';

  @override
  String get darkMode => 'ダークモード';

  @override
  String get fontSize => '文字サイズ';

  @override
  String get standard => '標準';

  @override
  String get notificationSettings => '通知';

  @override
  String get tripScheduleNotifications => '旅行スケジュール通知';

  @override
  String get importantChangesPush => '重要な変更のプッシュ通知';

  @override
  String get newMessageNotifications => '新着メッセージ通知';

  @override
  String get helpAndSupport => 'ヘルプとサポート';

  @override
  String get appVersion => 'アプリバージョン';

  @override
  String get logout => 'ログアウト';

  @override
  String get permissionRequired => '権限が必要です';

  @override
  String get notificationPermissionMessage =>
      'TripSyncは重要な旅行の更新や主催者からのお知らせを送信するために通知の許可が必要です。';

  @override
  String get allowNotifications => '通知を許可';

  @override
  String get later => '後で';

  @override
  String get error => 'エラー';

  @override
  String get tryAgain => '再試行';

  @override
  String get noTripsYet => 'まだ旅行がありません';

  @override
  String get createYourFirstTrip => '最初の旅行を作成するか、参加しましょう！';

  @override
  String get noNotifications => '通知はありません';

  @override
  String get youreAllCaughtUp => 'すべての通知を確認しました！';

  @override
  String get loading => '読み込み中...';

  @override
  String get connectionError => '接続エラー';

  @override
  String get checkYourInternet => 'インターネット接続を確認してください';

  @override
  String get confirmDelete => '削除の確認';

  @override
  String get deleteConfirmMessage => '本当に削除しますか？';

  @override
  String get delete => '削除';

  @override
  String get confirm => '確認';

  @override
  String get done => '完了';

  @override
  String get edit => '編集';

  @override
  String get close => '閉じる';

  @override
  String get back => '戻る';

  @override
  String get next => '次へ';

  @override
  String get search => '検索';

  @override
  String get noResults => '結果が見つかりません';

  @override
  String get selectDate => '日付を選択';

  @override
  String get selectTime => '時間を選択';

  @override
  String get from => '出発地';

  @override
  String get to => '目的地';

  @override
  String get duration => '所要時間';

  @override
  String get location => '場所';

  @override
  String get address => '住所';

  @override
  String get phone => '電話番号';

  @override
  String get email => 'メール';

  @override
  String get website => 'ウェブサイト';

  @override
  String get price => '料金';

  @override
  String get viewMenu => 'メニューを見る';

  @override
  String get recommended => 'おすすめ';

  @override
  String get hiking => 'ハイキング';

  @override
  String get warning => '警告';

  @override
  String get viewDetails => '詳細を見る';

  @override
  String get readyForYour => '次の旅の';

  @override
  String get nextJourney => '準備はできましたか？';

  @override
  String get createFirstTrip => '最初の旅行を作成するか、参加しましょう！';

  @override
  String get language => '言語';

  @override
  String get changePhoto => '写真を変更';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get chooseFromGallery => 'ギャラリーから選択';

  @override
  String get removePhoto => '写真を削除';

  @override
  String get displayName => '表示名';

  @override
  String get enterDisplayName => '表示名を入力してください';

  @override
  String get enterPhoneNumber => '電話番号を入力してください';

  @override
  String get displayNameRequired => '表示名は必須です';

  @override
  String get displayNameMinLength => '表示名は2文字以上必要です';

  @override
  String get profileUpdated => 'プロフィールが更新されました';

  @override
  String get failedToUpdateProfile => 'プロフィールの更新に失敗しました';

  @override
  String get failedToPickImage => '画像の選択に失敗しました';

  @override
  String get logoutConfirmation => '本当にログアウトしますか？';

  @override
  String get earlier => '以前';

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
  String get account => 'アカウント';

  @override
  String get deleteAccount => 'アカウント削除';

  @override
  String get deleteAccountTitle => 'アカウントを削除しますか？';

  @override
  String get deleteAccountMessage =>
      'この操作は取り消せません。旅行、メッセージ、プロフィール情報を含むすべてのデータが完全に削除されます。';

  @override
  String get deleteAccountConfirmation => '確認のため DELETE と入力してください';

  @override
  String get deletingAccount => 'アカウント削除中...';

  @override
  String get accountDeleted => 'アカウントが正常に削除されました';

  @override
  String get deleteAccountFailed => 'アカウントの削除に失敗しました';

  @override
  String get deleteAccountWarning => '警告：アカウントと関連するすべてのデータが完全に削除されます。';
}
