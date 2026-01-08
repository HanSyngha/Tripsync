// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Начните своё путешествие';

  @override
  String get welcomeSubtitle =>
      'Открывайте новые впечатления и создавайте особые воспоминания';

  @override
  String get skip => 'Пропустить';

  @override
  String get participant => 'Участник';

  @override
  String get host => 'Организатор';

  @override
  String get coHost => 'Со-организатор';

  @override
  String get signInWithKakao => 'Войти через Kakao';

  @override
  String get signInWithNaver => 'Войти через Naver';

  @override
  String get signInWithGoogle => 'Войти через Google';

  @override
  String get signInWithApple => 'Войти через Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Входя в систему, вы соглашаетесь с $terms и $privacy.';
  }

  @override
  String get termsOfService => 'Условиями использования';

  @override
  String get privacyPolicy => 'Политикой конфиденциальности';

  @override
  String get welcomeBack => 'С возвращением';

  @override
  String get readyForNextJourney => 'Готовы к следующему путешествию?';

  @override
  String get allTrips => 'Все поездки';

  @override
  String get hosting => 'Организую';

  @override
  String get participating => 'Участвую';

  @override
  String get happeningNow => 'Сейчас';

  @override
  String get upcomingAdventures => 'Предстоящие приключения';

  @override
  String get viewAll => 'Смотреть все';

  @override
  String dayOf(int current, int total) {
    return 'День $current из $total';
  }

  @override
  String get inProgress => 'В процессе';

  @override
  String get manage => 'Управление';

  @override
  String get guest => 'Гость';

  @override
  String get tbd => 'Уточняется';

  @override
  String get home => 'Главная';

  @override
  String get explore => 'Обзор';

  @override
  String get chat => 'Чат';

  @override
  String get profile => 'Профиль';

  @override
  String get createTrip => 'Создать поездку';

  @override
  String get letsplanYourJourney => 'Давайте спланируем ваше путешествие';

  @override
  String get hostCanEditLater =>
      'Как организатор, вы можете изменить эти данные позже в любое время.';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get basicInfo => 'Основная информация';

  @override
  String get required => 'Обязательно';

  @override
  String get tripName => 'Название поездки';

  @override
  String get tripNameHint => 'напр. Лето в Киото';

  @override
  String get destination => 'Направление';

  @override
  String get destinationHint => 'Куда вы направляетесь?';

  @override
  String get dates => 'Даты';

  @override
  String get startDate => 'Дата начала';

  @override
  String get endDate => 'Дата окончания';

  @override
  String get optionalDetails => 'Дополнительные сведения';

  @override
  String get coverPhoto => 'Обложка';

  @override
  String get tapToUploadCover => 'Нажмите, чтобы загрузить обложку';

  @override
  String get tripGoalMemo => 'Цель поездки / Заметка';

  @override
  String get tripGoalHint => 'Какова главная цель этой поездки?';

  @override
  String get nextStep => 'Следующий шаг';

  @override
  String get participantManagement => 'Управление участниками';

  @override
  String get participating_count => 'Участвуют';

  @override
  String get pendingInvites => 'Ожидающие приглашения';

  @override
  String get inviteNewMember => 'Пригласить участника';

  @override
  String get searchByNameOrEmail => 'Поиск по имени или email';

  @override
  String get hosts => 'Организаторы';

  @override
  String get admin => 'АДМИН';

  @override
  String get travelers => 'Путешественники';

  @override
  String get allPermissions => 'Все права';

  @override
  String get canEditSchedule => 'Может редактировать расписание';

  @override
  String get readOnly => 'Только просмотр';

  @override
  String get pendingAcceptance => 'Ожидает подтверждения';

  @override
  String get resend => 'Отправить повторно';

  @override
  String get inviteLinkActivated => 'Ссылка-приглашение активирована';

  @override
  String get copy => 'Копировать';

  @override
  String get allowScheduleEdit => 'Разрешить редактирование расписания';

  @override
  String get allowPhotoUpload => 'Разрешить загрузку фото';

  @override
  String get removeFromTrip => 'Удалить из поездки';

  @override
  String joinedDaysAgo(int days) {
    return 'Присоединился $days дн. назад';
  }

  @override
  String get itinerary => 'Маршрут';

  @override
  String get organizerView => 'Режим организатора';

  @override
  String get draft => 'Черновик';

  @override
  String days(int count) {
    return '$count дн.';
  }

  @override
  String day(int number) {
    return 'День $number';
  }

  @override
  String get addActivity => 'Добавить активность';

  @override
  String get schedule => 'Расписание';

  @override
  String get map => 'Карта';

  @override
  String get people => 'Люди';

  @override
  String get settings => 'Настройки';

  @override
  String get flight => 'Перелёт';

  @override
  String get accommodation => 'Проживание';

  @override
  String get rentalCar => 'Аренда авто';

  @override
  String get restaurant => 'Ресторан';

  @override
  String get attraction => 'Достопримечательность';

  @override
  String get activity => 'Активность';

  @override
  String get transportation => 'Транспорт';

  @override
  String get enterDetails => 'Введите данные';

  @override
  String get airline => 'Авиакомпания';

  @override
  String get flightNumber => 'Номер рейса';

  @override
  String get departure => 'Вылет';

  @override
  String get arrival => 'Прилёт';

  @override
  String get notes => 'Заметки';

  @override
  String get notesHint => 'Напишите важные заметки здесь...';

  @override
  String get addAttachment => 'Добавить вложение';

  @override
  String get eTicketOrVoucher => 'Электронный билет или ваучер (PDF, JPG)';

  @override
  String get reminderSettings => 'Настройки напоминаний';

  @override
  String get reservationConfirmed => 'Бронирование подтверждено';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides гид - $members участников';
  }

  @override
  String get guide => 'ГИД';

  @override
  String get organizer => 'ОРГАНИЗАТОР';

  @override
  String get messagePlaceholder => 'Сообщение...';

  @override
  String get openMap => 'Открыть карту';

  @override
  String get newAnnouncement => 'Новое объявление';

  @override
  String get toWhom => 'Кому?';

  @override
  String get allParticipants => 'Все участники';

  @override
  String get selectSpecific => 'Выбрать конкретных';

  @override
  String othersSelected(int count) {
    return '+ ещё $count выбрано';
  }

  @override
  String get messageDetails => 'Детали сообщения';

  @override
  String get nextSchedule => 'Следующее в расписании';

  @override
  String get urgent => 'Срочно';

  @override
  String get generalInfo => 'Общая информация';

  @override
  String get poll => 'Опрос';

  @override
  String get quickTemplates => 'Быстрые шаблоны';

  @override
  String get templateBusLeaving => 'Автобус отправляется через 10 мин';

  @override
  String get templateMeetingPoint => 'Место встречи изменилось';

  @override
  String get templateWeather => 'Предупреждение о погоде';

  @override
  String get templateDinner => 'Бронирование ужина';

  @override
  String get subject => 'Тема';

  @override
  String get subjectHint => 'напр. Встреча в холле';

  @override
  String get message => 'Сообщение';

  @override
  String get messageHint => 'Напишите ваше объявление здесь...';

  @override
  String get addPhoto => 'Добавить фото';

  @override
  String get addLocation => 'Добавить местоположение';

  @override
  String get pinToTopOfChat => 'Закрепить вверху чата';

  @override
  String get keepVisibleForAll => 'Видно всем участникам';

  @override
  String get sendAsUrgentAlert => 'Отправить как срочное уведомление';

  @override
  String get notifiesEvenIfMuted => 'Уведомляет даже при отключённом звуке';

  @override
  String get sendNotification => 'Отправить уведомление';

  @override
  String get notifications => 'Уведомления';

  @override
  String get markAllAsRead => 'Отметить все как прочитанные';

  @override
  String get all => 'Все';

  @override
  String get announcements => 'Объявления';

  @override
  String get today => 'Сегодня';

  @override
  String get yesterday => 'Вчера';

  @override
  String get announcement => 'Объявление';

  @override
  String get pastAnnouncement => 'Прошлое объявление';

  @override
  String minutesAgo(int minutes) {
    return '$minutes мин. назад';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours ч. назад';
  }

  @override
  String get tripDetails => 'Детали поездки';

  @override
  String nights(int count) {
    return '$count ночей';
  }

  @override
  String get hostedBy => 'Организатор';

  @override
  String get mapView => 'Вид на карте';

  @override
  String get groupChat => 'Групповой чат';

  @override
  String get savedDocs => 'Сохранённые документы';

  @override
  String get dontForget => 'Не забудьте!';

  @override
  String get overview => 'Обзор';

  @override
  String get expandAll => 'Развернуть всё';

  @override
  String get checkIn => 'Заезд';

  @override
  String get checkOut => 'Выезд';

  @override
  String get directions => 'Маршрут';

  @override
  String get reservation => 'Бронирование';

  @override
  String get currentStatus => 'Текущий статус';

  @override
  String tripStartsIn(int days) {
    return 'Поездка начнётся через $days дн.';
  }

  @override
  String get accountAndPermissions => 'Аккаунт и права доступа';

  @override
  String get profileVisibility => 'Видимость профиля';

  @override
  String get displaySettings => 'Настройки отображения';

  @override
  String get darkMode => 'Тёмная тема';

  @override
  String get fontSize => 'Размер шрифта';

  @override
  String get standard => 'Стандартный';

  @override
  String get notificationSettings => 'Уведомления';

  @override
  String get tripScheduleNotifications => 'Уведомления о расписании поездки';

  @override
  String get importantChangesPush => 'Push-уведомления о важных изменениях';

  @override
  String get newMessageNotifications => 'Уведомления о новых сообщениях';

  @override
  String get helpAndSupport => 'Помощь и поддержка';

  @override
  String get appVersion => 'Версия приложения';

  @override
  String get logout => 'Выйти';

  @override
  String get permissionRequired => 'Требуется разрешение';

  @override
  String get notificationPermissionMessage =>
      'TripSync требуется разрешение на уведомления, чтобы отправлять вам важные обновления о поездке и объявления от организаторов.';

  @override
  String get allowNotifications => 'Разрешить уведомления';

  @override
  String get later => 'Позже';

  @override
  String get error => 'Ошибка';

  @override
  String get tryAgain => 'Попробовать снова';

  @override
  String get noTripsYet => 'Пока нет поездок';

  @override
  String get createYourFirstTrip =>
      'Создайте свою первую поездку или присоединитесь!';

  @override
  String get noNotifications => 'Нет уведомлений';

  @override
  String get youreAllCaughtUp => 'Вы всё просмотрели!';

  @override
  String get loading => 'Загрузка...';

  @override
  String get connectionError => 'Ошибка соединения';

  @override
  String get checkYourInternet =>
      'Пожалуйста, проверьте подключение к интернету';

  @override
  String get confirmDelete => 'Подтвердить удаление';

  @override
  String get deleteConfirmMessage => 'Вы уверены, что хотите это удалить?';

  @override
  String get delete => 'Удалить';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get done => 'Готово';

  @override
  String get edit => 'Редактировать';

  @override
  String get close => 'Закрыть';

  @override
  String get back => 'Назад';

  @override
  String get next => 'Далее';

  @override
  String get search => 'Поиск';

  @override
  String get noResults => 'Ничего не найдено';

  @override
  String get selectDate => 'Выберите дату';

  @override
  String get selectTime => 'Выберите время';

  @override
  String get from => 'Откуда';

  @override
  String get to => 'Куда';

  @override
  String get duration => 'Продолжительность';

  @override
  String get location => 'Местоположение';

  @override
  String get address => 'Адрес';

  @override
  String get phone => 'Телефон';

  @override
  String get email => 'Эл. почта';

  @override
  String get website => 'Веб-сайт';

  @override
  String get price => 'Цена';

  @override
  String get viewMenu => 'Посмотреть меню';

  @override
  String get recommended => 'Рекомендовано';

  @override
  String get hiking => 'Пеший туризм';

  @override
  String get warning => 'Предупреждение';

  @override
  String get viewDetails => 'Подробнее';

  @override
  String get readyForYour => 'Готовы к вашему';

  @override
  String get nextJourney => 'следующему путешествию?';

  @override
  String get createFirstTrip =>
      'Создайте свою первую поездку или присоединитесь!';

  @override
  String get language => 'Язык';

  @override
  String get changePhoto => 'Изменить фото';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get chooseFromGallery => 'Выбрать из галереи';

  @override
  String get removePhoto => 'Удалить фото';

  @override
  String get displayName => 'Отображаемое имя';

  @override
  String get enterDisplayName => 'Введите отображаемое имя';

  @override
  String get enterPhoneNumber => 'Введите номер телефона';

  @override
  String get displayNameRequired => 'Имя обязательно';

  @override
  String get displayNameMinLength => 'Имя должно содержать минимум 2 символа';

  @override
  String get profileUpdated => 'Профиль успешно обновлён';

  @override
  String get failedToUpdateProfile => 'Не удалось обновить профиль';

  @override
  String get failedToPickImage => 'Не удалось выбрать изображение';

  @override
  String get logoutConfirmation => 'Вы уверены, что хотите выйти?';

  @override
  String get earlier => 'Ранее';

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
  String get account => 'Аккаунт';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get deleteAccountTitle => 'Удалить аккаунт';

  @override
  String get deleteAccountMessage =>
      'Вы уверены, что хотите удалить свой аккаунт? Это действие необратимо, и все ваши данные будут безвозвратно удалены.';

  @override
  String get deleteAccountConfirmation =>
      'Введите \'УДАЛИТЬ\' для подтверждения';

  @override
  String get deletingAccount => 'Удаление аккаунта...';

  @override
  String get accountDeleted => 'Аккаунт успешно удалён';

  @override
  String get deleteAccountFailed => 'Не удалось удалить аккаунт';

  @override
  String get deleteAccountWarning =>
      'Внимание: Это действие нельзя отменить. Все ваши данные, включая поездки и сообщения, будут безвозвратно удалены.';
}
