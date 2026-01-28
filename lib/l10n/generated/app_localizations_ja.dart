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
  String get noMapLocations => '地図に表示する場所がありません';

  @override
  String get noMapLocationsHint => '旅程に場所を追加すると地図で確認できます';

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
  String get discardTrip => '旅行を破棄しますか？';

  @override
  String get discardTripMessage => 'この旅行を破棄してよろしいですか？すべての変更が失われます。';

  @override
  String get discardChanges => '変更を破棄しますか？';

  @override
  String get discardChangesMessage => '変更を破棄してよろしいですか？';

  @override
  String get keepEditing => '編集を続ける';

  @override
  String get discard => '破棄';

  @override
  String get tripCreatedSuccess => '旅行が正常に作成されました！';

  @override
  String get tripUpdatedSuccess => '旅行が正常に更新されました！';

  @override
  String get tripNotFound => '旅行が見つかりません';

  @override
  String get itinerarySaved => '旅程が保存されました';

  @override
  String get comingSoon => '近日公開';

  @override
  String get signOut => 'サインアウト';

  @override
  String get retry => '再試行';

  @override
  String get viewParticipants => '参加者を表示';

  @override
  String get pinnedMessages => '固定メッセージ';

  @override
  String get searchMessages => 'メッセージを検索';

  @override
  String get sendAnnouncement => 'お知らせを送信';

  @override
  String get photo => '写真';

  @override
  String get camera => 'カメラ';

  @override
  String get sharePhotosFromGallery => 'ギャラリーから写真を共有';

  @override
  String get takeNewPhoto => '新しい写真を撮る';

  @override
  String get shareCurrentLocation => '現在地を共有';

  @override
  String get featureComingSoon => '機能は近日公開！';

  @override
  String get activityAddedSuccess => 'アクティビティが正常に追加されました';

  @override
  String get filePickerComingSoon => 'ファイル選択は近日公開';

  @override
  String get pleaseEnterMessage => 'メッセージを入力してください';

  @override
  String get announcementSentSuccess => 'お知らせが正常に送信されました！';

  @override
  String get failedToLoadParticipants => '参加者の読み込みに失敗しました';

  @override
  String get loginRequired => 'ログインが必要です';

  @override
  String get inviteSendFailed => '招待の送信に失敗しました。もう一度お試しください。';

  @override
  String get newInviteLinkGenerated => '新しい招待リンクが生成されました';

  @override
  String get inviteLinkCopied => '招待リンクがコピーされました';

  @override
  String get userNotFound => 'ユーザーが見つかりません';

  @override
  String get noDestination => '目的地なし';

  @override
  String get loginTitle => 'ようこそ';

  @override
  String get loginSubtitle => 'サインインして旅を始めましょう';

  @override
  String get continueWithKakao => 'Kakaoで続行';

  @override
  String get continueWithNaver => 'Naverで続行';

  @override
  String get continueWithGoogle => 'Googleで続行';

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

  @override
  String get reportMessage => 'メッセージを報告';

  @override
  String get reportMessageDescription => '不適切なコンテンツを旅行主催者に報告';

  @override
  String get blockUser => 'ユーザーをブロック';

  @override
  String get blockUserDescription => 'このユーザーからのメッセージは表示されなくなります';

  @override
  String get selectReportReason => '報告理由を選択してください：';

  @override
  String get additionalDetails => '追加の詳細';

  @override
  String get optionalDescription => '問題を説明してください（任意）';

  @override
  String get report => '報告';

  @override
  String get block => 'ブロック';

  @override
  String get reportTypeSpam => 'スパム';

  @override
  String get reportTypeHarassment => '嫌がらせ';

  @override
  String get reportTypeInappropriate => '不適切なコンテンツ';

  @override
  String get reportTypeHateSpeech => 'ヘイトスピーチ';

  @override
  String get reportTypeViolence => '暴力';

  @override
  String get reportTypeOther => 'その他';

  @override
  String get reportSubmitted => '報告が送信されました。旅行主催者に通知されます。';

  @override
  String get reportFailed => '報告の送信に失敗しました。もう一度お試しください。';

  @override
  String blockUserConfirmation(String userName) {
    return '$userNameをブロックしますか？このユーザーのメッセージは表示されなくなります。';
  }

  @override
  String userBlocked(String userName) {
    return '$userNameをブロックしました';
  }

  @override
  String get blockFailed => 'ユーザーのブロックに失敗しました。もう一度お試しください。';

  @override
  String get blockedUsers => 'ブロック中のユーザー';

  @override
  String get noBlockedUsers => 'ブロック中のユーザーはいません';

  @override
  String get unblock => 'ブロック解除';

  @override
  String userUnblocked(String userName) {
    return '$userNameのブロックを解除しました';
  }

  @override
  String get reportUser => 'ユーザーを報告';

  @override
  String get reportUserDescription => 'このユーザーを旅行主催者に報告';

  @override
  String get locationPermissionDenied => '位置情報の許可が拒否されました';

  @override
  String get locationPermissionDeniedForever =>
      '位置情報の許可が永久に拒否されました。設定で有効にしてください。';

  @override
  String get locationServicesDisabled => '位置情報サービスが無効です';

  @override
  String get gettingLocation => '位置情報を取得中...';

  @override
  String get currentLocation => '現在地';

  @override
  String get shareLocation => '位置情報を共有';

  @override
  String get shareLocationConfirmation => 'この位置情報をチャットで共有しますか？';

  @override
  String get share => '共有';

  @override
  String get uploadFailed => 'アップロードに失敗しました';

  @override
  String get openInGoogleMaps => 'Googleマップで開く';

  @override
  String get getDirections => '道順を取得';

  @override
  String get drivingDirections => '車での道順';

  @override
  String get walkingDirections => '徒歩での道順';

  @override
  String get transitDirections => '公共交通機関での道順';

  @override
  String get noPinnedMessages => '固定メッセージはありません';

  @override
  String get noItineraryYet => 'まだ旅程がありません';

  @override
  String get viewFullItinerary => '完全な旅程を表示';

  @override
  String get inviteParticipant => '参加者を招待';

  @override
  String get emailAddress => 'メールアドレス';

  @override
  String get enterEmailAddress => 'メールアドレスを入力';

  @override
  String get invalidEmail => '無効なメールアドレス';

  @override
  String get role => '役割';

  @override
  String get permissions => '権限';

  @override
  String get sendInvite => '招待を送信';

  @override
  String get inviteSent => '招待が送信されました';

  @override
  String get editItinerary => '旅程を編集';

  @override
  String get deleteItinerary => '旅程を削除';

  @override
  String get deleteItineraryConfirm => 'この旅程を削除してもよろしいですか？';

  @override
  String get itineraryDeleted => '旅程が削除されました';

  @override
  String get searchPlaces => '場所を検索';

  @override
  String get selectLocation => '場所を選択';

  @override
  String get confirmLocation => '場所を確認';

  @override
  String get hotelName => 'ホテル名';

  @override
  String get roomType => '部屋タイプ';

  @override
  String get checkInTime => 'チェックイン時間';

  @override
  String get checkOutTime => 'チェックアウト時間';

  @override
  String get carCompany => 'レンタカー会社';

  @override
  String get carModel => '車種';

  @override
  String get pickupLocation => 'ピックアップ場所';

  @override
  String get dropoffLocation => '返却場所';

  @override
  String get pickupTime => 'ピックアップ時間';

  @override
  String get dropoffTime => '返却時間';

  @override
  String get restaurantName => 'レストラン名';

  @override
  String get cuisine => '料理の種類';

  @override
  String get priceRange => '価格帯';

  @override
  String get reservationTime => '予約時間';

  @override
  String get departureAirport => '出発空港';

  @override
  String get arrivalAirport => '到着空港';

  @override
  String get departureTime => '出発時間';

  @override
  String get arrivalTime => '到着時間';

  @override
  String get terminal => 'ターミナル';

  @override
  String get gate => 'ゲート';

  @override
  String get confirmationNumber => '確認番号';

  @override
  String get other => 'その他';

  @override
  String get title => 'タイトル';

  @override
  String get description => '説明';

  @override
  String get itemNotFound => 'アイテムが見つかりません';

  @override
  String get selectDay => '日を選択';

  @override
  String get selectAirline => '航空会社を選択';

  @override
  String get enterNotesHint => '追加のメモを入力してください';

  @override
  String get enterHotelName => 'ホテル名を入力';

  @override
  String get enterRoomType => '例：デラックスツイン';

  @override
  String get enterAddress => '住所を入力';

  @override
  String get enterConfirmationNumber => '確認番号を入力';

  @override
  String get selectCarCompany => 'レンタカー会社を選択';

  @override
  String get enterCarModel => '例：トヨタ カローラ';

  @override
  String get enterPickupLocation => 'ピックアップ場所を入力';

  @override
  String get enterDropoffLocation => '返却場所を入力';

  @override
  String get pickupInfo => 'ピックアップ情報';

  @override
  String get dropoffInfo => '返却情報';

  @override
  String get enterRestaurantName => 'レストラン名を入力';

  @override
  String get cuisineType => '料理の種類';

  @override
  String get selectCuisineType => '料理の種類を選択';

  @override
  String get reservationInfo => '予約情報';

  @override
  String get enterTitle => 'タイトルを入力';

  @override
  String get enterDescription => '説明を入力';

  @override
  String get enterLocation => '場所を入力';

  @override
  String get startTime => '開始時間';

  @override
  String get endTime => '終了時間';

  @override
  String get addAttachments => '添付ファイルを追加';

  @override
  String get attachmentHint => 'Eチケット、予約確認書など';

  @override
  String get itemUpdatedSuccess => 'アイテムが更新されました';

  @override
  String get itemDeletedSuccess => 'アイテムが削除されました';
}
