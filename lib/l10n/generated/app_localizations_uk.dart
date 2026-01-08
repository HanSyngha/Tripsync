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
}
