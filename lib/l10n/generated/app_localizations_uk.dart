// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Розпочніть свою подорож';

  @override
  String get welcomeSubtitle =>
      'Відкривайте нові враження та створюйте особливі спогади';

  @override
  String get skip => 'Пропустити';

  @override
  String get participant => 'Учасник';

  @override
  String get host => 'Організатор';

  @override
  String get coHost => 'Співорганізатор';

  @override
  String get signInWithKakao => 'Продовжити з Kakao';

  @override
  String get signInWithNaver => 'Продовжити з Naver';

  @override
  String get signInWithGoogle => 'Продовжити з Google';

  @override
  String get signInWithApple => 'Продовжити з Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Входячи в систему, ви погоджуєтесь з нашими $terms та $privacy.';
  }

  @override
  String get termsOfService => 'Умови використання';

  @override
  String get privacyPolicy => 'Політика конфіденційності';

  @override
  String get welcomeBack => 'З поверненням';

  @override
  String get readyForNextJourney => 'Готові до наступної подорожі?';

  @override
  String get allTrips => 'Усі подорожі';

  @override
  String get hosting => 'Організую';

  @override
  String get participating => 'Беру участь';

  @override
  String get happeningNow => 'Зараз відбувається';

  @override
  String get upcomingAdventures => 'Майбутні пригоди';

  @override
  String get viewAll => 'Переглянути все';

  @override
  String dayOf(int current, int total) {
    return 'День $current з $total';
  }

  @override
  String get inProgress => 'Триває';

  @override
  String get manage => 'Керувати';

  @override
  String get guest => 'Гість';

  @override
  String get tbd => 'Буде визначено';

  @override
  String get home => 'Головна';

  @override
  String get explore => 'Огляд';

  @override
  String get chat => 'Чат';

  @override
  String get profile => 'Профіль';

  @override
  String get createTrip => 'Створити подорож';

  @override
  String get letsplanYourJourney => 'Давайте сплануємо вашу подорож';

  @override
  String get hostCanEditLater =>
      'Як організатор, ви можете змінити ці деталі пізніше в будь-який час.';

  @override
  String get cancel => 'Скасувати';

  @override
  String get save => 'Зберегти';

  @override
  String get basicInfo => 'Основна інформація';

  @override
  String get required => 'Обов\'язково';

  @override
  String get tripName => 'Назва подорожі';

  @override
  String get tripNameHint => 'напр. Літо в Кіото';

  @override
  String get destination => 'Місце призначення';

  @override
  String get destinationHint => 'Куди ви їдете?';

  @override
  String get dates => 'Дати';

  @override
  String get startDate => 'Дата початку';

  @override
  String get endDate => 'Дата закінчення';

  @override
  String get optionalDetails => 'Додаткові деталі';

  @override
  String get coverPhoto => 'Обкладинка';

  @override
  String get tapToUploadCover => 'Натисніть, щоб завантажити обкладинку';

  @override
  String get tripGoalMemo => 'Мета подорожі / Нотатка';

  @override
  String get tripGoalHint => 'Яка головна мета цієї подорожі?';

  @override
  String get nextStep => 'Наступний крок';

  @override
  String get participantManagement => 'Керування учасниками';

  @override
  String get participating_count => 'Беруть участь';

  @override
  String get pendingInvites => 'Очікують запрошення';

  @override
  String get inviteNewMember => 'Запросити нового учасника';

  @override
  String get searchByNameOrEmail => 'Пошук за іменем або електронною поштою';

  @override
  String get hosts => 'Організатори';

  @override
  String get admin => 'АДМІН';

  @override
  String get travelers => 'Мандрівники';

  @override
  String get allPermissions => 'Усі дозволи';

  @override
  String get canEditSchedule => 'Може редагувати розклад';

  @override
  String get readOnly => 'Лише перегляд';

  @override
  String get pendingAcceptance => 'Очікує підтвердження';

  @override
  String get resend => 'Надіслати повторно';

  @override
  String get inviteLinkActivated => 'Посилання для запрошення активовано';

  @override
  String get copy => 'Копіювати';

  @override
  String get allowScheduleEdit => 'Дозволити редагування розкладу';

  @override
  String get allowPhotoUpload => 'Дозволити завантаження фото';

  @override
  String get removeFromTrip => 'Видалити з подорожі';

  @override
  String joinedDaysAgo(int days) {
    return 'Приєднався $days днів тому';
  }

  @override
  String get itinerary => 'Маршрут';

  @override
  String get organizerView => 'Вигляд організатора';

  @override
  String get draft => 'Чернетка';

  @override
  String days(int count) {
    return '$count днів';
  }

  @override
  String day(int number) {
    return 'День $number';
  }

  @override
  String get addActivity => 'Додати активність';

  @override
  String get schedule => 'Розклад';

  @override
  String get map => 'Карта';

  @override
  String get people => 'Люди';

  @override
  String get settings => 'Налаштування';

  @override
  String get flight => 'Рейс';

  @override
  String get accommodation => 'Проживання';

  @override
  String get rentalCar => 'Оренда авто';

  @override
  String get restaurant => 'Ресторан';

  @override
  String get attraction => 'Пам\'ятка';

  @override
  String get activity => 'Активність';

  @override
  String get transportation => 'Транспорт';

  @override
  String get enterDetails => 'Введіть деталі';

  @override
  String get airline => 'Авіакомпанія';

  @override
  String get flightNumber => 'Номер рейсу';

  @override
  String get departure => 'Виліт';

  @override
  String get arrival => 'Приліт';

  @override
  String get notes => 'Нотатки';

  @override
  String get notesHint => 'Напишіть тут важливі нотатки...';

  @override
  String get addAttachment => 'Додати вкладення';

  @override
  String get eTicketOrVoucher => 'Електронний квиток або ваучер (PDF, JPG)';

  @override
  String get reminderSettings => 'Налаштування нагадувань';

  @override
  String get reservationConfirmed => 'Бронювання підтверджено';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides гід - $members учасників';
  }

  @override
  String get guide => 'ГІД';

  @override
  String get organizer => 'ОРГАНІЗАТОР';

  @override
  String get messagePlaceholder => 'Повідомлення...';

  @override
  String get openMap => 'Відкрити карту';

  @override
  String get newAnnouncement => 'Нове оголошення';

  @override
  String get toWhom => 'Кому?';

  @override
  String get allParticipants => 'Усім учасникам';

  @override
  String get selectSpecific => 'Вибрати конкретних';

  @override
  String othersSelected(int count) {
    return '+ ще $count вибрано';
  }

  @override
  String get messageDetails => 'Деталі повідомлення';

  @override
  String get nextSchedule => 'Наступний розклад';

  @override
  String get urgent => 'Терміново';

  @override
  String get generalInfo => 'Загальна інформація';

  @override
  String get poll => 'Опитування';

  @override
  String get quickTemplates => 'Швидкі шаблони';

  @override
  String get templateBusLeaving => 'Автобус відправляється через 10 хв';

  @override
  String get templateMeetingPoint => 'Місце зустрічі змінено';

  @override
  String get templateWeather => 'Попередження про погоду';

  @override
  String get templateDinner => 'Бронювання вечері';

  @override
  String get subject => 'Тема';

  @override
  String get subjectHint => 'напр. Зустріч у холі';

  @override
  String get message => 'Повідомлення';

  @override
  String get messageHint => 'Напишіть тут своє оголошення...';

  @override
  String get addPhoto => 'Додати фото';

  @override
  String get addLocation => 'Додати місцезнаходження';

  @override
  String get pinToTopOfChat => 'Закріпити вгорі чату';

  @override
  String get keepVisibleForAll => 'Залишити видимим для всіх учасників';

  @override
  String get sendAsUrgentAlert => 'Надіслати як термінове сповіщення';

  @override
  String get notifiesEvenIfMuted => 'Сповіщає навіть якщо вимкнено звук';

  @override
  String get sendNotification => 'Надіслати сповіщення';

  @override
  String get notifications => 'Сповіщення';

  @override
  String get markAllAsRead => 'Позначити все як прочитане';

  @override
  String get all => 'Усі';

  @override
  String get announcements => 'Оголошення';

  @override
  String get today => 'Сьогодні';

  @override
  String get yesterday => 'Вчора';

  @override
  String get announcement => 'Оголошення';

  @override
  String get pastAnnouncement => 'Минуле оголошення';

  @override
  String minutesAgo(int minutes) {
    return '$minutes хв тому';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours год тому';
  }

  @override
  String get tripDetails => 'Деталі подорожі';

  @override
  String nights(int count) {
    return '$count ночей';
  }

  @override
  String get hostedBy => 'Організатор';

  @override
  String get mapView => 'Вигляд карти';

  @override
  String get groupChat => 'Груповий чат';

  @override
  String get savedDocs => 'Збережені документи';

  @override
  String get dontForget => 'Не забудьте!';

  @override
  String get overview => 'Огляд';

  @override
  String get expandAll => 'Розгорнути все';

  @override
  String get checkIn => 'Заселення';

  @override
  String get checkOut => 'Виселення';

  @override
  String get directions => 'Маршрут';

  @override
  String get reservation => 'Бронювання';

  @override
  String get currentStatus => 'Поточний статус';

  @override
  String tripStartsIn(int days) {
    return 'Подорож починається через $days днів';
  }

  @override
  String get accountAndPermissions => 'Акаунт і дозволи';

  @override
  String get profileVisibility => 'Видимість профілю';

  @override
  String get displaySettings => 'Налаштування відображення';

  @override
  String get darkMode => 'Темний режим';

  @override
  String get fontSize => 'Розмір шрифту';

  @override
  String get standard => 'Стандартний';

  @override
  String get notificationSettings => 'Сповіщення';

  @override
  String get tripScheduleNotifications => 'Сповіщення про розклад подорожі';

  @override
  String get importantChangesPush => 'Push-сповіщення про важливі зміни';

  @override
  String get newMessageNotifications => 'Сповіщення про нові повідомлення';

  @override
  String get helpAndSupport => 'Допомога та підтримка';

  @override
  String get appVersion => 'Версія додатку';

  @override
  String get logout => 'Вийти';

  @override
  String get permissionRequired => 'Потрібен дозвіл';

  @override
  String get notificationPermissionMessage =>
      'TripSync потребує дозволу на сповіщення, щоб надсилати вам важливі оновлення подорожей та оголошення від організаторів.';

  @override
  String get allowNotifications => 'Дозволити сповіщення';

  @override
  String get later => 'Пізніше';

  @override
  String get error => 'Помилка';

  @override
  String get tryAgain => 'Спробувати знову';

  @override
  String get noTripsYet => 'Подорожей ще немає';

  @override
  String get createYourFirstTrip =>
      'Створіть свою першу подорож або приєднайтесь до існуючої!';

  @override
  String get noNotifications => 'Немає сповіщень';

  @override
  String get youreAllCaughtUp => 'Ви все переглянули!';

  @override
  String get loading => 'Завантаження...';

  @override
  String get connectionError => 'Помилка з\'єднання';

  @override
  String get checkYourInternet =>
      'Будь ласка, перевірте підключення до інтернету';

  @override
  String get confirmDelete => 'Підтвердити видалення';

  @override
  String get deleteConfirmMessage => 'Ви впевнені, що хочете це видалити?';

  @override
  String get delete => 'Видалити';

  @override
  String get confirm => 'Підтвердити';

  @override
  String get done => 'Готово';

  @override
  String get edit => 'Редагувати';

  @override
  String get close => 'Закрити';

  @override
  String get back => 'Назад';

  @override
  String get next => 'Далі';

  @override
  String get search => 'Пошук';

  @override
  String get noResults => 'Результатів не знайдено';

  @override
  String get selectDate => 'Вибрати дату';

  @override
  String get selectTime => 'Вибрати час';

  @override
  String get from => 'Від';

  @override
  String get to => 'До';

  @override
  String get duration => 'Тривалість';

  @override
  String get location => 'Місцезнаходження';

  @override
  String get address => 'Адреса';

  @override
  String get phone => 'Телефон';

  @override
  String get email => 'Електронна пошта';

  @override
  String get website => 'Веб-сайт';

  @override
  String get price => 'Ціна';

  @override
  String get viewMenu => 'Переглянути меню';

  @override
  String get recommended => 'Рекомендовано';

  @override
  String get hiking => 'Піший туризм';

  @override
  String get warning => 'Попередження';

  @override
  String get viewDetails => 'Переглянути деталі';

  @override
  String get readyForYour => 'Готові до';

  @override
  String get nextJourney => 'наступної подорожі?';

  @override
  String get createFirstTrip =>
      'Створіть свою першу подорож або приєднайтесь до існуючої!';

  @override
  String get language => 'Мова';

  @override
  String get changePhoto => 'Змінити фото';

  @override
  String get takePhoto => 'Зробити фото';

  @override
  String get chooseFromGallery => 'Вибрати з галереї';

  @override
  String get removePhoto => 'Видалити фото';

  @override
  String get displayName => 'Ім\'я користувача';

  @override
  String get enterDisplayName => 'Введіть ваше ім\'я';

  @override
  String get enterPhoneNumber => 'Введіть ваш номер телефону';

  @override
  String get displayNameRequired => 'Ім\'я користувача обов\'язкове';

  @override
  String get displayNameMinLength =>
      'Ім\'я користувача повинно містити щонайменше 2 символи';

  @override
  String get profileUpdated => 'Профіль успішно оновлено';

  @override
  String get failedToUpdateProfile => 'Не вдалося оновити профіль';

  @override
  String get failedToPickImage => 'Не вдалося вибрати зображення';

  @override
  String get logoutConfirmation => 'Ви впевнені, що хочете вийти?';

  @override
  String get earlier => 'Раніше';

  @override
  String get discardTrip => 'Скасувати подорож?';

  @override
  String get discardTripMessage =>
      'Ви впевнені, що хочете скасувати цю подорож? Усі зміни будуть втрачені.';

  @override
  String get discardChanges => 'Скасувати зміни?';

  @override
  String get discardChangesMessage =>
      'Ви впевнені, що хочете скасувати ваші зміни?';

  @override
  String get keepEditing => 'Продовжити редагування';

  @override
  String get discard => 'Скасувати';

  @override
  String get tripCreatedSuccess => 'Подорож успішно створено!';

  @override
  String get tripUpdatedSuccess => 'Подорож успішно оновлено!';

  @override
  String get tripNotFound => 'Подорож не знайдено';

  @override
  String get itinerarySaved => 'Маршрут збережено';

  @override
  String get comingSoon => 'Незабаром';

  @override
  String get signOut => 'Вийти';

  @override
  String get retry => 'Повторити';

  @override
  String get viewParticipants => 'Переглянути учасників';

  @override
  String get pinnedMessages => 'Закріплені повідомлення';

  @override
  String get searchMessages => 'Пошук повідомлень';

  @override
  String get sendAnnouncement => 'Надіслати оголошення';

  @override
  String get photo => 'Фото';

  @override
  String get camera => 'Камера';

  @override
  String get sharePhotosFromGallery => 'Поділитися фото з галереї';

  @override
  String get takeNewPhoto => 'Зробити нове фото';

  @override
  String get shareCurrentLocation => 'Поділитися поточним місцезнаходженням';

  @override
  String get featureComingSoon => 'Функція незабаром!';

  @override
  String get activityAddedSuccess => 'Активність успішно додано';

  @override
  String get filePickerComingSoon => 'Вибір файлів незабаром';

  @override
  String get pleaseEnterMessage => 'Будь ласка, введіть повідомлення';

  @override
  String get announcementSentSuccess => 'Оголошення успішно надіслано!';

  @override
  String get failedToLoadParticipants => 'Не вдалося завантажити учасників';

  @override
  String get loginRequired => 'Потрібен вхід';

  @override
  String get inviteSendFailed =>
      'Не вдалося надіслати запрошення. Будь ласка, спробуйте знову.';

  @override
  String get newInviteLinkGenerated => 'Нове посилання-запрошення створено';

  @override
  String get inviteLinkCopied => 'Посилання-запрошення скопійовано';

  @override
  String get userNotFound => 'Користувача не знайдено';

  @override
  String get noDestination => 'Немає призначення';

  @override
  String get loginTitle => 'Ласкаво просимо';

  @override
  String get loginSubtitle => 'Увійдіть, щоб почати подорож';

  @override
  String get continueWithKakao => 'Продовжити з Kakao';

  @override
  String get continueWithNaver => 'Продовжити з Naver';

  @override
  String get continueWithGoogle => 'Продовжити з Google';

  @override
  String get account => 'Акаунт';

  @override
  String get deleteAccount => 'Видалити акаунт';

  @override
  String get deleteAccountTitle => 'Видалити акаунт';

  @override
  String get deleteAccountMessage =>
      'Ви впевнені, що хочете видалити свій акаунт? Ця дія незворотна, і всі ваші дані будуть назавжди видалені.';

  @override
  String get deleteAccountConfirmation =>
      'Введіть \'ВИДАЛИТИ\' для підтвердження';

  @override
  String get deletingAccount => 'Видалення акаунту...';

  @override
  String get accountDeleted => 'Акаунт успішно видалено';

  @override
  String get deleteAccountFailed => 'Не вдалося видалити акаунт';

  @override
  String get deleteAccountWarning =>
      'Увага: Цю дію не можна скасувати. Усі ваші дані, включаючи подорожі та повідомлення, будуть назавжди видалені.';

  @override
  String get reportMessage => 'Поскаржитися на повідомлення';

  @override
  String get reportMessageDescription =>
      'Повідомити про неприйнятний вміст організатору подорожі';

  @override
  String get blockUser => 'Заблокувати користувача';

  @override
  String get blockUserDescription =>
      'Ви більше не бачитимете повідомлень від цього користувача';

  @override
  String get selectReportReason => 'Виберіть причину скарги:';

  @override
  String get additionalDetails => 'Додаткові деталі';

  @override
  String get optionalDescription => 'Опишіть проблему (необов\'язково)';

  @override
  String get report => 'Поскаржитися';

  @override
  String get block => 'Заблокувати';

  @override
  String get reportTypeSpam => 'Спам';

  @override
  String get reportTypeHarassment => 'Переслідування';

  @override
  String get reportTypeInappropriate => 'Неприйнятний вміст';

  @override
  String get reportTypeHateSpeech => 'Мова ненависті';

  @override
  String get reportTypeViolence => 'Насильство';

  @override
  String get reportTypeOther => 'Інше';

  @override
  String get reportSubmitted =>
      'Скаргу надіслано. Організатор подорожі буде повідомлений.';

  @override
  String get reportFailed =>
      'Не вдалося надіслати скаргу. Будь ласка, спробуйте знову.';

  @override
  String blockUserConfirmation(String userName) {
    return 'Ви впевнені, що хочете заблокувати $userName? Ви більше не бачитимете їхніх повідомлень.';
  }

  @override
  String userBlocked(String userName) {
    return '$userName заблоковано';
  }

  @override
  String get blockFailed =>
      'Не вдалося заблокувати користувача. Будь ласка, спробуйте знову.';

  @override
  String get blockedUsers => 'Заблоковані користувачі';

  @override
  String get noBlockedUsers => 'Немає заблокованих користувачів';

  @override
  String get unblock => 'Розблокувати';

  @override
  String userUnblocked(String userName) {
    return '$userName розблоковано';
  }

  @override
  String get reportUser => 'Поскаржитися на користувача';

  @override
  String get reportUserDescription =>
      'Повідомити про цього користувача організатору подорожі';

  @override
  String get locationPermissionDenied => 'Дозвіл на місцезнаходження відхилено';

  @override
  String get locationPermissionDeniedForever =>
      'Дозвіл на місцезнаходження відхилено назавжди. Будь ласка, увімкніть у налаштуваннях.';

  @override
  String get locationServicesDisabled => 'Служби геолокації вимкнено';

  @override
  String get gettingLocation => 'Отримання місцезнаходження...';

  @override
  String get currentLocation => 'Поточне місцезнаходження';

  @override
  String get shareLocation => 'Поділитися місцезнаходженням';

  @override
  String get shareLocationConfirmation =>
      'Бажаєте поділитися цим місцезнаходженням у чаті?';

  @override
  String get share => 'Поділитися';

  @override
  String get uploadFailed => 'Помилка завантаження';

  @override
  String get openInGoogleMaps => 'Відкрити в Google Maps';

  @override
  String get getDirections => 'Отримати маршрут';

  @override
  String get drivingDirections => 'Автомобільний маршрут';

  @override
  String get walkingDirections => 'Пішохідний маршрут';

  @override
  String get transitDirections => 'Маршрут громадським транспортом';

  @override
  String get noPinnedMessages => 'Немає закріплених повідомлень';

  @override
  String get noItineraryYet => 'Маршруту поки немає';

  @override
  String get viewFullItinerary => 'Переглянути повний маршрут';

  @override
  String get inviteParticipant => 'Запросити учасника';

  @override
  String get emailAddress => 'Електронна пошта';

  @override
  String get enterEmailAddress => 'Введіть адресу електронної пошти';

  @override
  String get invalidEmail => 'Невірна адреса електронної пошти';

  @override
  String get role => 'Роль';

  @override
  String get permissions => 'Права доступу';

  @override
  String get sendInvite => 'Надіслати запрошення';

  @override
  String get inviteSent => 'Запрошення надіслано';

  @override
  String get editItinerary => 'Редагувати маршрут';

  @override
  String get deleteItinerary => 'Видалити маршрут';

  @override
  String get deleteItineraryConfirm =>
      'Ви впевнені, що хочете видалити цей маршрут?';

  @override
  String get itineraryDeleted => 'Маршрут видалено';

  @override
  String get searchPlaces => 'Пошук місць';

  @override
  String get selectLocation => 'Вибрати місцезнаходження';

  @override
  String get confirmLocation => 'Підтвердити місцезнаходження';

  @override
  String get hotelName => 'Назва готелю';

  @override
  String get roomType => 'Тип номера';

  @override
  String get checkInTime => 'Час заселення';

  @override
  String get checkOutTime => 'Час виселення';

  @override
  String get carCompany => 'Прокатна компанія';

  @override
  String get carModel => 'Модель автомобіля';

  @override
  String get pickupLocation => 'Місце отримання';

  @override
  String get dropoffLocation => 'Місце повернення';

  @override
  String get pickupTime => 'Час отримання';

  @override
  String get dropoffTime => 'Час повернення';

  @override
  String get restaurantName => 'Назва ресторану';

  @override
  String get cuisine => 'Кухня';

  @override
  String get priceRange => 'Ціновий діапазон';

  @override
  String get reservationTime => 'Час бронювання';

  @override
  String get departureAirport => 'Аеропорт вильоту';

  @override
  String get arrivalAirport => 'Аеропорт прильоту';

  @override
  String get departureTime => 'Час вильоту';

  @override
  String get arrivalTime => 'Час прильоту';

  @override
  String get terminal => 'Термінал';

  @override
  String get gate => 'Гейт';

  @override
  String get confirmationNumber => 'Номер підтвердження';

  @override
  String get other => 'Інше';

  @override
  String get title => 'Назва';

  @override
  String get description => 'Опис';

  @override
  String get itemNotFound => 'Елемент не знайдено';

  @override
  String get selectDay => 'Виберіть день';

  @override
  String get selectAirline => 'Виберіть авіакомпанію';

  @override
  String get enterNotesHint => 'Введіть нотатки...';

  @override
  String get enterHotelName => 'Введіть назву готелю';

  @override
  String get enterRoomType => 'Введіть тип номера';

  @override
  String get enterAddress => 'Введіть адресу';

  @override
  String get enterConfirmationNumber => 'Введіть номер підтвердження';

  @override
  String get selectCarCompany => 'Виберіть прокатну компанію';

  @override
  String get enterCarModel => 'Введіть модель автомобіля';

  @override
  String get enterPickupLocation => 'Введіть місце отримання';

  @override
  String get enterDropoffLocation => 'Введіть місце повернення';

  @override
  String get pickupInfo => 'Інформація про отримання';

  @override
  String get dropoffInfo => 'Інформація про повернення';

  @override
  String get enterRestaurantName => 'Введіть назву ресторану';

  @override
  String get cuisineType => 'Тип кухні';

  @override
  String get selectCuisineType => 'Виберіть тип кухні';

  @override
  String get reservationInfo => 'Інформація про бронювання';

  @override
  String get enterTitle => 'Введіть назву';

  @override
  String get enterDescription => 'Введіть опис';

  @override
  String get enterLocation => 'Введіть місцезнаходження';

  @override
  String get startTime => 'Час початку';

  @override
  String get endTime => 'Час закінчення';

  @override
  String get addAttachments => 'Додати вкладення';

  @override
  String get attachmentHint => 'Додайте документи або зображення';

  @override
  String get itemUpdatedSuccess => 'Елемент успішно оновлено';

  @override
  String get itemDeletedSuccess => 'Елемент успішно видалено';
}
