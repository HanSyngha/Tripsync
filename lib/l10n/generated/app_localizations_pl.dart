// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Rozpocznij Swoja Podroz';

  @override
  String get welcomeSubtitle =>
      'Odkrywaj nowe doswiadczenia i twórz wyjatkowe wspomnienia';

  @override
  String get skip => 'Pomin';

  @override
  String get participant => 'Uczestnik';

  @override
  String get host => 'Gospodarz';

  @override
  String get coHost => 'Wspólgospodarz';

  @override
  String get signInWithKakao => 'Kontynuuj przez Kakao';

  @override
  String get signInWithNaver => 'Kontynuuj przez Naver';

  @override
  String get signInWithGoogle => 'Kontynuuj przez Google';

  @override
  String get signInWithApple => 'Kontynuuj przez Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Logujac sie, akceptujesz nasz $terms oraz $privacy.';
  }

  @override
  String get termsOfService => 'Regulamin';

  @override
  String get privacyPolicy => 'Polityka prywatnosci';

  @override
  String get welcomeBack => 'Witaj ponownie';

  @override
  String get readyForNextJourney => 'Gotowy na kolejna przygode?';

  @override
  String get allTrips => 'Wszystkie podróze';

  @override
  String get hosting => 'Organizowane';

  @override
  String get participating => 'Uczestniczone';

  @override
  String get happeningNow => 'Trwajace';

  @override
  String get upcomingAdventures => 'Nadchodzace przygody';

  @override
  String get viewAll => 'Zobacz wszystkie';

  @override
  String dayOf(int current, int total) {
    return 'Dzien $current z $total';
  }

  @override
  String get inProgress => 'W trakcie';

  @override
  String get manage => 'Zarzadzaj';

  @override
  String get guest => 'Gosc';

  @override
  String get tbd => 'Do ustalenia';

  @override
  String get home => 'Strona glówna';

  @override
  String get explore => 'Odkrywaj';

  @override
  String get chat => 'Czat';

  @override
  String get profile => 'Profil';

  @override
  String get createTrip => 'Utwórz podróz';

  @override
  String get letsplanYourJourney => 'Zaplanujmy Twoja podróz';

  @override
  String get hostCanEditLater =>
      'Jako gospodarz, mozesz edytowac te szczególy w dowolnym momencie.';

  @override
  String get cancel => 'Anuluj';

  @override
  String get save => 'Zapisz';

  @override
  String get basicInfo => 'Podstawowe informacje';

  @override
  String get required => 'Wymagane';

  @override
  String get tripName => 'Nazwa podrózy';

  @override
  String get tripNameHint => 'np. Lato w Kioto';

  @override
  String get destination => 'Cel podrózy';

  @override
  String get destinationHint => 'Dokad jedziesz?';

  @override
  String get dates => 'Daty';

  @override
  String get startDate => 'Data rozpoczecia';

  @override
  String get endDate => 'Data zakonczenia';

  @override
  String get optionalDetails => 'Szczególy opcjonalne';

  @override
  String get coverPhoto => 'Zdjecie okladki';

  @override
  String get tapToUploadCover => 'Dotknij, aby przeslac okladke';

  @override
  String get tripGoalMemo => 'Cel podrózy / Notatka';

  @override
  String get tripGoalHint => 'Jaki jest glówny cel tej podrózy?';

  @override
  String get nextStep => 'Nastepny krok';

  @override
  String get participantManagement => 'Zarzadzanie uczestnikami';

  @override
  String get participating_count => 'Uczestniczy';

  @override
  String get pendingInvites => 'Oczekujace zaproszenia';

  @override
  String get inviteNewMember => 'Zapros nowego czlonka';

  @override
  String get searchByNameOrEmail => 'Szukaj po nazwie lub e-mailu';

  @override
  String get hosts => 'Gospodarze';

  @override
  String get admin => 'ADMINISTRATOR';

  @override
  String get travelers => 'Podróznicy';

  @override
  String get allPermissions => 'Wszystkie uprawnienia';

  @override
  String get canEditSchedule => 'Moze edytowac harmonogram';

  @override
  String get readOnly => 'Tylko do odczytu';

  @override
  String get pendingAcceptance => 'Oczekuje na akceptacje';

  @override
  String get resend => 'Wyslij ponownie';

  @override
  String get inviteLinkActivated => 'Link zaproszenia aktywowany';

  @override
  String get copy => 'Kopiuj';

  @override
  String get allowScheduleEdit => 'Zezwól na edycje harmonogramu';

  @override
  String get allowPhotoUpload => 'Zezwól na przesylanie zdjec';

  @override
  String get removeFromTrip => 'Usun z podrózy';

  @override
  String joinedDaysAgo(int days) {
    return 'Dolaczyl $days dni temu';
  }

  @override
  String get itinerary => 'Plan podrózy';

  @override
  String get organizerView => 'Widok organizatora';

  @override
  String get draft => 'Szkic';

  @override
  String days(int count) {
    return '$count dni';
  }

  @override
  String day(int number) {
    return 'Dzien $number';
  }

  @override
  String get addActivity => 'Dodaj aktywnosc';

  @override
  String get schedule => 'Harmonogram';

  @override
  String get map => 'Mapa';

  @override
  String get people => 'Osoby';

  @override
  String get settings => 'Ustawienia';

  @override
  String get flight => 'Lot';

  @override
  String get accommodation => 'Zakwaterowanie';

  @override
  String get rentalCar => 'Wynajem samochodu';

  @override
  String get restaurant => 'Restauracja';

  @override
  String get attraction => 'Atrakcja';

  @override
  String get activity => 'Aktywnosc';

  @override
  String get transportation => 'Transport';

  @override
  String get enterDetails => 'Wprowadz szczególy';

  @override
  String get airline => 'Linia lotnicza';

  @override
  String get flightNumber => 'Numer lotu';

  @override
  String get departure => 'Wylot';

  @override
  String get arrival => 'Przylot';

  @override
  String get notes => 'Notatki';

  @override
  String get notesHint => 'Zapisz tutaj wazne notatki...';

  @override
  String get addAttachment => 'Dodaj zalacznik';

  @override
  String get eTicketOrVoucher => 'E-bilet lub voucher (PDF, JPG)';

  @override
  String get reminderSettings => 'Ustawienia przypomnien';

  @override
  String get reservationConfirmed => 'Rezerwacja potwierdzona';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Przewodnik - $members Czlonków';
  }

  @override
  String get guide => 'PRZEWODNIK';

  @override
  String get organizer => 'ORGANIZATOR';

  @override
  String get messagePlaceholder => 'Wiadomosc...';

  @override
  String get openMap => 'Otwórz mape';

  @override
  String get newAnnouncement => 'Nowe ogloszenie';

  @override
  String get toWhom => 'Do kogo?';

  @override
  String get allParticipants => 'Wszyscy uczestnicy';

  @override
  String get selectSpecific => 'Wybierz konkretne osoby';

  @override
  String othersSelected(int count) {
    return '+ $count innych wybranych';
  }

  @override
  String get messageDetails => 'Szczególy wiadomosci';

  @override
  String get nextSchedule => 'Nastepny harmonogram';

  @override
  String get urgent => 'Pilne';

  @override
  String get generalInfo => 'Informacje ogólne';

  @override
  String get poll => 'Ankieta';

  @override
  String get quickTemplates => 'Szybkie szablony';

  @override
  String get templateBusLeaving => 'Autobus odjedza za 10 minut';

  @override
  String get templateMeetingPoint => 'Zmiana miejsca spotkania';

  @override
  String get templateWeather => 'Ostrzezenie pogodowe';

  @override
  String get templateDinner => 'Rezerwacje kolacji';

  @override
  String get subject => 'Temat';

  @override
  String get subjectHint => 'np. Spotkanie w lobby';

  @override
  String get message => 'Wiadomosc';

  @override
  String get messageHint => 'Napisz swoje ogloszenie tutaj...';

  @override
  String get addPhoto => 'Dodaj zdjecie';

  @override
  String get addLocation => 'Dodaj lokalizacje';

  @override
  String get pinToTopOfChat => 'Przypnij na górze czatu';

  @override
  String get keepVisibleForAll => 'Widoczne dla wszystkich uczestników';

  @override
  String get sendAsUrgentAlert => 'Wyslij jako pilne powiadomienie';

  @override
  String get notifiesEvenIfMuted => 'Powiadamia nawet przy wyciszeniu';

  @override
  String get sendNotification => 'Wyslij powiadomienie';

  @override
  String get notifications => 'Powiadomienia';

  @override
  String get markAllAsRead => 'Oznacz wszystkie jako przeczytane';

  @override
  String get all => 'Wszystkie';

  @override
  String get announcements => 'Ogloszenia';

  @override
  String get today => 'Dzisiaj';

  @override
  String get yesterday => 'Wczoraj';

  @override
  String get announcement => 'Ogloszenie';

  @override
  String get pastAnnouncement => 'Poprzednie ogloszenie';

  @override
  String minutesAgo(int minutes) {
    return '$minutes min temu';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours godz. temu';
  }

  @override
  String get tripDetails => 'Szczególy podrózy';

  @override
  String nights(int count) {
    return '$count nocy';
  }

  @override
  String get hostedBy => 'Organizowane przez';

  @override
  String get mapView => 'Widok mapy';

  @override
  String get groupChat => 'Czat grupowy';

  @override
  String get savedDocs => 'Zapisane dokumenty';

  @override
  String get dontForget => 'Nie zapomnij!';

  @override
  String get overview => 'Przeglad';

  @override
  String get expandAll => 'Rozwin wszystko';

  @override
  String get checkIn => 'Zameldowanie';

  @override
  String get checkOut => 'Wymeldowanie';

  @override
  String get directions => 'Wskazówki dojazdu';

  @override
  String get reservation => 'Rezerwacja';

  @override
  String get currentStatus => 'Aktualny status';

  @override
  String tripStartsIn(int days) {
    return 'Podróz zaczyna sie za $days dni';
  }

  @override
  String get accountAndPermissions => 'Konto i uprawnienia';

  @override
  String get profileVisibility => 'Widocznosc profilu';

  @override
  String get displaySettings => 'Ustawienia wyswietlania';

  @override
  String get darkMode => 'Tryb ciemny';

  @override
  String get fontSize => 'Rozmiar czcionki';

  @override
  String get standard => 'Standardowy';

  @override
  String get notificationSettings => 'Powiadomienia';

  @override
  String get tripScheduleNotifications =>
      'Powiadomienia o harmonogramie podrózy';

  @override
  String get importantChangesPush => 'Powiadomienia push o waznych zmianach';

  @override
  String get newMessageNotifications => 'Powiadomienia o nowych wiadomosciach';

  @override
  String get helpAndSupport => 'Pomoc i wsparcie';

  @override
  String get appVersion => 'Wersja aplikacji';

  @override
  String get logout => 'Wyloguj';

  @override
  String get permissionRequired => 'Wymagane uprawnienie';

  @override
  String get notificationPermissionMessage =>
      'TripSync potrzebuje uprawnien do powiadomien, aby wysylac Ci wazne aktualizacje o podrózy i ogloszenia od organizatorów.';

  @override
  String get allowNotifications => 'Zezwól na powiadomienia';

  @override
  String get later => 'Pózniej';

  @override
  String get error => 'Blad';

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String get noTripsYet => 'Brak podrózy';

  @override
  String get createYourFirstTrip =>
      'Utwórz swoja pierwsza podróz lub dolacz do istniejàcej!';

  @override
  String get noNotifications => 'Brak powiadomien';

  @override
  String get youreAllCaughtUp => 'Jestes na biezaco!';

  @override
  String get loading => 'Ladowanie...';

  @override
  String get connectionError => 'Blad polaczenia';

  @override
  String get checkYourInternet => 'Sprawdz polaczenie internetowe';

  @override
  String get confirmDelete => 'Potwierdz usuniecie';

  @override
  String get deleteConfirmMessage => 'Czy na pewno chcesz to usunac?';

  @override
  String get delete => 'Usun';

  @override
  String get confirm => 'Potwierdz';

  @override
  String get done => 'Gotowe';

  @override
  String get edit => 'Edytuj';

  @override
  String get close => 'Zamknij';

  @override
  String get back => 'Wstecz';

  @override
  String get next => 'Dalej';

  @override
  String get search => 'Szukaj';

  @override
  String get noResults => 'Brak wyników';

  @override
  String get selectDate => 'Wybierz date';

  @override
  String get selectTime => 'Wybierz godzine';

  @override
  String get from => 'Od';

  @override
  String get to => 'Do';

  @override
  String get duration => 'Czas trwania';

  @override
  String get location => 'Lokalizacja';

  @override
  String get address => 'Adres';

  @override
  String get phone => 'Telefon';

  @override
  String get email => 'E-mail';

  @override
  String get website => 'Strona internetowa';

  @override
  String get price => 'Cena';

  @override
  String get viewMenu => 'Zobacz menu';

  @override
  String get recommended => 'Polecane';

  @override
  String get hiking => 'Wycieczka piesza';

  @override
  String get warning => 'Ostrzezenie';

  @override
  String get viewDetails => 'Zobacz szczególy';

  @override
  String get readyForYour => 'Gotowy na';

  @override
  String get nextJourney => 'kolejna przygode?';

  @override
  String get createFirstTrip =>
      'Utwórz swoja pierwsza podróz lub dolacz do istniejącej!';

  @override
  String get language => 'Jezyk';

  @override
  String get changePhoto => 'Zmien zdjecie';

  @override
  String get takePhoto => 'Zrób zdjecie';

  @override
  String get chooseFromGallery => 'Wybierz z galerii';

  @override
  String get removePhoto => 'Usun zdjecie';

  @override
  String get displayName => 'Nazwa wyswietlana';

  @override
  String get enterDisplayName => 'Wprowadz nazwe wyswietlana';

  @override
  String get enterPhoneNumber => 'Wprowadz numer telefonu';

  @override
  String get displayNameRequired => 'Nazwa wyswietlana jest wymagana';

  @override
  String get displayNameMinLength =>
      'Nazwa wyswietlana musi miec co najmniej 2 znaki';

  @override
  String get profileUpdated => 'Profil zostal pomyslnie zaktualizowany';

  @override
  String get failedToUpdateProfile => 'Nie udalo sie zaktualizowac profilu';

  @override
  String get failedToPickImage => 'Nie udalo sie wybrac obrazu';

  @override
  String get logoutConfirmation => 'Czy na pewno chcesz sie wylogowac?';

  @override
  String get earlier => 'Wczesniej';

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
  String get account => 'Konto';

  @override
  String get deleteAccount => 'Usun konto';

  @override
  String get deleteAccountTitle => 'Usun konto';

  @override
  String get deleteAccountMessage =>
      'Czy na pewno chcesz usunac swoje konto? Ta czynnosc jest nieodwracalna i wszystkie Twoje dane zostana trwale usuniete.';

  @override
  String get deleteAccountConfirmation => 'Wpisz \'USUN\' aby potwierdzic';

  @override
  String get deletingAccount => 'Usuwanie konta...';

  @override
  String get accountDeleted => 'Konto zostalo pomyslnie usuniete';

  @override
  String get deleteAccountFailed => 'Nie udalo sie usunac konta';

  @override
  String get deleteAccountWarning =>
      'Ostrzezenie: Tej czynnosci nie mozna cofnac. Wszystkie Twoje dane, w tym podroze i wiadomosci, zostana trwale usuniete.';
}
