// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Starten Sie Ihre Reise';

  @override
  String get welcomeSubtitle =>
      'Planen Sie Ihre Reisen gemeinsam mit Freunden und Familie';

  @override
  String get skip => 'Überspringen';

  @override
  String get participant => 'Teilnehmer';

  @override
  String get host => 'Gastgeber';

  @override
  String get coHost => 'Co-Gastgeber';

  @override
  String get signInWithKakao => 'Mit Kakao anmelden';

  @override
  String get signInWithNaver => 'Mit Naver anmelden';

  @override
  String get signInWithGoogle => 'Mit Google anmelden';

  @override
  String get signInWithApple => 'Mit Apple anmelden';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Durch die Anmeldung stimmen Sie unseren Nutzungsbedingungen und Datenschutzrichtlinien zu';
  }

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get welcomeBack => 'Willkommen zurück';

  @override
  String get readyForNextJourney => 'Bereit für Ihre nächste Reise?';

  @override
  String get allTrips => 'Alle Reisen';

  @override
  String get hosting => 'Als Gastgeber';

  @override
  String get participating => 'Als Teilnehmer';

  @override
  String get happeningNow => 'Aktuell unterwegs';

  @override
  String get upcomingAdventures => 'Kommende Abenteuer';

  @override
  String get viewAll => 'Alle anzeigen';

  @override
  String dayOf(int current, int total) {
    return 'Tag von';
  }

  @override
  String get inProgress => 'Im Gange';

  @override
  String get manage => 'Verwalten';

  @override
  String get guest => 'Gast';

  @override
  String get tbd => 'Noch offen';

  @override
  String get home => 'Startseite';

  @override
  String get explore => 'Entdecken';

  @override
  String get chat => 'Chat';

  @override
  String get profile => 'Profil';

  @override
  String get createTrip => 'Reise erstellen';

  @override
  String get letsplanYourJourney => 'Planen wir Ihre Reise';

  @override
  String get hostCanEditLater => 'Der Gastgeber kann dies später bearbeiten';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get basicInfo => 'Grundinformationen';

  @override
  String get required => 'Erforderlich';

  @override
  String get tripName => 'Reisename';

  @override
  String get tripNameHint => 'z.B. Sommer in Kyoto';

  @override
  String get destination => 'Reiseziel';

  @override
  String get destinationHint => 'Wohin geht es?';

  @override
  String get dates => 'Termine';

  @override
  String get startDate => 'Startdatum';

  @override
  String get endDate => 'Enddatum';

  @override
  String get optionalDetails => 'Optionale Details';

  @override
  String get coverPhoto => 'Titelbild';

  @override
  String get tapToUploadCover => 'Tippen zum Hochladen';

  @override
  String get tripGoalMemo => 'Reiseziel-Notiz';

  @override
  String get tripGoalHint => 'Was ist das Hauptziel dieser Reise?';

  @override
  String get nextStep => 'Nächster Schritt';

  @override
  String get participantManagement => 'Teilnehmerverwaltung';

  @override
  String get participating_count => 'Teilnehmend';

  @override
  String get pendingInvites => 'Ausstehende Einladungen';

  @override
  String get inviteNewMember => 'Neues Mitglied einladen';

  @override
  String get searchByNameOrEmail => 'Nach Name oder E-Mail suchen';

  @override
  String get hosts => 'Gastgeber';

  @override
  String get admin => 'Administrator';

  @override
  String get travelers => 'Reisende';

  @override
  String get allPermissions => 'Alle Berechtigungen';

  @override
  String get canEditSchedule => 'Kann Zeitplan bearbeiten';

  @override
  String get readOnly => 'Nur lesen';

  @override
  String get pendingAcceptance => 'Ausstehende Bestätigung';

  @override
  String get resend => 'Erneut senden';

  @override
  String get inviteLinkActivated => 'Einladungslink aktiviert';

  @override
  String get copy => 'Kopieren';

  @override
  String get allowScheduleEdit => 'Zeitplanbearbeitung erlauben';

  @override
  String get allowPhotoUpload => 'Foto-Upload erlauben';

  @override
  String get removeFromTrip => 'Von Reise entfernen';

  @override
  String joinedDaysAgo(int days) {
    return 'Vor $days Tagen beigetreten';
  }

  @override
  String get itinerary => 'Reiseplan';

  @override
  String get organizerView => 'Organisatoransicht';

  @override
  String get draft => 'Entwurf';

  @override
  String days(int count) {
    return 'Tage';
  }

  @override
  String day(int number) {
    return 'Tag';
  }

  @override
  String get addActivity => 'Aktivität hinzufügen';

  @override
  String get schedule => 'Zeitplan';

  @override
  String get map => 'Karte';

  @override
  String get people => 'Personen';

  @override
  String get settings => 'Einstellungen';

  @override
  String get flight => 'Flug';

  @override
  String get accommodation => 'Unterkunft';

  @override
  String get rentalCar => 'Mietwagen';

  @override
  String get restaurant => 'Restaurant';

  @override
  String get attraction => 'Sehenswürdigkeit';

  @override
  String get activity => 'Aktivität';

  @override
  String get transportation => 'Transport';

  @override
  String get enterDetails => 'Details eingeben';

  @override
  String get airline => 'Fluggesellschaft';

  @override
  String get flightNumber => 'Flugnummer';

  @override
  String get departure => 'Abflug';

  @override
  String get arrival => 'Ankunft';

  @override
  String get notes => 'Notizen';

  @override
  String get notesHint => 'Wichtige Notizen hier schreiben...';

  @override
  String get addAttachment => 'Anhang hinzufügen';

  @override
  String get eTicketOrVoucher => 'E-Ticket oder Gutschein (PDF, JPG)';

  @override
  String get reminderSettings => 'Erinnerungseinstellungen';

  @override
  String get reservationConfirmed => 'Reservierung bestätigt';

  @override
  String chatTitle(String tripName) {
    return 'Gruppenchat';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Reiseleiter - $members Mitglieder';
  }

  @override
  String get guide => 'Reiseleiter';

  @override
  String get organizer => 'Organisator';

  @override
  String get messagePlaceholder => 'Nachricht eingeben...';

  @override
  String get openMap => 'Karte öffnen';

  @override
  String get newAnnouncement => 'Neue Ankündigung';

  @override
  String get toWhom => 'An wen';

  @override
  String get allParticipants => 'Alle Teilnehmer';

  @override
  String get selectSpecific => 'Bestimmte auswählen';

  @override
  String othersSelected(int count) {
    return '+ $count weitere ausgewählt';
  }

  @override
  String get messageDetails => 'Nachrichtendetails';

  @override
  String get nextSchedule => 'Nächster Termin';

  @override
  String get urgent => 'Dringend';

  @override
  String get generalInfo => 'Allgemeine Information';

  @override
  String get poll => 'Umfrage';

  @override
  String get quickTemplates => 'Schnellvorlagen';

  @override
  String get templateBusLeaving => 'Bus fährt in 10 Min';

  @override
  String get templateMeetingPoint => 'Treffpunkt geändert';

  @override
  String get templateWeather => 'Wetterwarnung';

  @override
  String get templateDinner => 'Abendessen-Reservierung';

  @override
  String get subject => 'Betreff';

  @override
  String get subjectHint => 'z.B. Treffen in der Lobby';

  @override
  String get message => 'Nachricht';

  @override
  String get messageHint => 'Schreiben Sie Ihre Ankündigung hier...';

  @override
  String get addPhoto => 'Foto hinzufügen';

  @override
  String get addLocation => 'Standort hinzufügen';

  @override
  String get pinToTopOfChat => 'Oben im Chat anheften';

  @override
  String get keepVisibleForAll => 'Für alle sichtbar halten';

  @override
  String get sendAsUrgentAlert => 'Als dringende Warnung senden';

  @override
  String get notifiesEvenIfMuted => 'Benachrichtigt auch wenn stumm';

  @override
  String get sendNotification => 'Benachrichtigung senden';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get markAllAsRead => 'Alle als gelesen markieren';

  @override
  String get all => 'Alle';

  @override
  String get announcements => 'Ankündigungen';

  @override
  String get today => 'Heute';

  @override
  String get yesterday => 'Gestern';

  @override
  String get announcement => 'Ankündigung';

  @override
  String get pastAnnouncement => 'Vergangene Ankündigung';

  @override
  String minutesAgo(int minutes) {
    return 'vor $minutes Minuten';
  }

  @override
  String hoursAgo(int hours) {
    return 'vor $hours Stunden';
  }

  @override
  String get tripDetails => 'Reisedetails';

  @override
  String nights(int count) {
    return '$count Nächte';
  }

  @override
  String get hostedBy => 'Organisiert von';

  @override
  String get mapView => 'Kartenansicht';

  @override
  String get groupChat => 'Gruppenchat';

  @override
  String get savedDocs => 'Gespeicherte Dokumente';

  @override
  String get dontForget => 'Nicht vergessen';

  @override
  String get overview => 'Übersicht';

  @override
  String get expandAll => 'Alle aufklappen';

  @override
  String get checkIn => 'Check-in';

  @override
  String get checkOut => 'Check-out';

  @override
  String get directions => 'Wegbeschreibung';

  @override
  String get reservation => 'Reservierung';

  @override
  String get currentStatus => 'Aktueller Status';

  @override
  String tripStartsIn(int days) {
    return 'Reise beginnt in $days Tagen';
  }

  @override
  String get accountAndPermissions => 'Konto und Berechtigungen';

  @override
  String get profileVisibility => 'Profil-Sichtbarkeit';

  @override
  String get displaySettings => 'Anzeigeeinstellungen';

  @override
  String get darkMode => 'Dunkelmodus';

  @override
  String get fontSize => 'Schriftgröße';

  @override
  String get standard => 'Standard';

  @override
  String get notificationSettings => 'Benachrichtigungseinstellungen';

  @override
  String get tripScheduleNotifications => 'Reiseplan-Benachrichtigungen';

  @override
  String get importantChangesPush =>
      'Push-Benachrichtigungen für wichtige Änderungen';

  @override
  String get newMessageNotifications =>
      'Benachrichtigungen für neue Nachrichten';

  @override
  String get helpAndSupport => 'Hilfe und Support';

  @override
  String get appVersion => 'App-Version';

  @override
  String get logout => 'Abmelden';

  @override
  String get permissionRequired => 'Berechtigung erforderlich';

  @override
  String get notificationPermissionMessage =>
      'TripSync benötigt die Benachrichtigungsberechtigung, um Ihnen wichtige Updates zu senden.';

  @override
  String get allowNotifications => 'Benachrichtigungen erlauben';

  @override
  String get later => 'Später';

  @override
  String get error => 'Fehler';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get noTripsYet => 'Noch keine Reisen';

  @override
  String get createYourFirstTrip =>
      'Erstellen Sie Ihre erste Reise oder treten Sie einer bei!';

  @override
  String get noNotifications => 'Keine Benachrichtigungen';

  @override
  String get youreAllCaughtUp => 'Sie sind auf dem Laufenden!';

  @override
  String get loading => 'Wird geladen...';

  @override
  String get connectionError => 'Verbindungsfehler';

  @override
  String get checkYourInternet =>
      'Bitte überprüfen Sie Ihre Internetverbindung';

  @override
  String get confirmDelete => 'Löschen bestätigen';

  @override
  String get deleteConfirmMessage =>
      'Sind Sie sicher, dass Sie dies löschen möchten?';

  @override
  String get delete => 'Löschen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get done => 'Fertig';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get close => 'Schließen';

  @override
  String get back => 'Zurück';

  @override
  String get next => 'Weiter';

  @override
  String get search => 'Suchen';

  @override
  String get noResults => 'Keine Ergebnisse';

  @override
  String get selectDate => 'Datum auswählen';

  @override
  String get selectTime => 'Uhrzeit auswählen';

  @override
  String get from => 'Von';

  @override
  String get to => 'Nach';

  @override
  String get duration => 'Dauer';

  @override
  String get location => 'Standort';

  @override
  String get address => 'Adresse';

  @override
  String get phone => 'Telefon';

  @override
  String get email => 'E-Mail';

  @override
  String get website => 'Webseite';

  @override
  String get price => 'Preis';

  @override
  String get viewMenu => 'Speisekarte ansehen';

  @override
  String get recommended => 'Empfohlen';

  @override
  String get hiking => 'Wandern';

  @override
  String get warning => 'Warnung';

  @override
  String get viewDetails => 'Details anzeigen';

  @override
  String get readyForYour => 'Bereit für Ihre';

  @override
  String get nextJourney => 'nächste Reise?';

  @override
  String get createFirstTrip =>
      'Erstellen Sie Ihre erste Reise oder treten Sie einer bei!';

  @override
  String get language => 'Sprache';

  @override
  String get changePhoto => 'Foto ändern';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get chooseFromGallery => 'Aus Galerie wählen';

  @override
  String get removePhoto => 'Foto entfernen';

  @override
  String get displayName => 'Anzeigename';

  @override
  String get enterDisplayName => 'Geben Sie Ihren Anzeigenamen ein';

  @override
  String get enterPhoneNumber => 'Geben Sie Ihre Telefonnummer ein';

  @override
  String get displayNameRequired => 'Anzeigename ist erforderlich';

  @override
  String get displayNameMinLength =>
      'Anzeigename muss mindestens 2 Zeichen lang sein';

  @override
  String get profileUpdated => 'Profil erfolgreich aktualisiert';

  @override
  String get failedToUpdateProfile => 'Profil konnte nicht aktualisiert werden';

  @override
  String get failedToPickImage => 'Bild konnte nicht ausgewählt werden';

  @override
  String get logoutConfirmation =>
      'Sind Sie sicher, dass Sie sich abmelden möchten?';

  @override
  String get earlier => 'Früher';

  @override
  String get discardTrip => 'Reise verwerfen?';

  @override
  String get discardTripMessage =>
      'Sind Sie sicher, dass Sie diese Reise verwerfen möchten? Alle Änderungen gehen verloren.';

  @override
  String get discardChanges => 'Änderungen verwerfen?';

  @override
  String get discardChangesMessage =>
      'Sind Sie sicher, dass Sie Ihre Änderungen verwerfen möchten?';

  @override
  String get keepEditing => 'Weiter bearbeiten';

  @override
  String get discard => 'Verwerfen';

  @override
  String get tripCreatedSuccess => 'Reise erfolgreich erstellt!';

  @override
  String get tripUpdatedSuccess => 'Reise erfolgreich aktualisiert!';

  @override
  String get tripNotFound => 'Reise nicht gefunden';

  @override
  String get itinerarySaved => 'Reiseplan gespeichert';

  @override
  String get comingSoon => 'Demnächst verfügbar';

  @override
  String get signOut => 'Abmelden';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get viewParticipants => 'Teilnehmer anzeigen';

  @override
  String get pinnedMessages => 'Angeheftete Nachrichten';

  @override
  String get searchMessages => 'Nachrichten suchen';

  @override
  String get sendAnnouncement => 'Ankündigung senden';

  @override
  String get photo => 'Foto';

  @override
  String get camera => 'Kamera';

  @override
  String get sharePhotosFromGallery => 'Fotos aus der Galerie teilen';

  @override
  String get takeNewPhoto => 'Neues Foto aufnehmen';

  @override
  String get shareCurrentLocation => 'Aktuellen Standort teilen';

  @override
  String get featureComingSoon => 'Funktion demnächst verfügbar!';

  @override
  String get activityAddedSuccess => 'Aktivität erfolgreich hinzugefügt';

  @override
  String get filePickerComingSoon => 'Dateiauswahl demnächst verfügbar';

  @override
  String get pleaseEnterMessage => 'Bitte geben Sie eine Nachricht ein';

  @override
  String get announcementSentSuccess => 'Ankündigung erfolgreich gesendet!';

  @override
  String get failedToLoadParticipants =>
      'Teilnehmer konnten nicht geladen werden';

  @override
  String get loginRequired => 'Anmeldung erforderlich';

  @override
  String get inviteSendFailed =>
      'Einladung konnte nicht gesendet werden. Bitte erneut versuchen.';

  @override
  String get newInviteLinkGenerated => 'Neuer Einladungslink generiert';

  @override
  String get inviteLinkCopied => 'Einladungslink kopiert';

  @override
  String get userNotFound => 'Benutzer nicht gefunden';

  @override
  String get noDestination => 'Kein Ziel';

  @override
  String get loginTitle => 'Willkommen';

  @override
  String get loginSubtitle => 'Melden Sie sich an, um Ihre Reise zu beginnen';

  @override
  String get continueWithKakao => 'Mit Kakao fortfahren';

  @override
  String get continueWithNaver => 'Mit Naver fortfahren';

  @override
  String get continueWithGoogle => 'Mit Google fortfahren';

  @override
  String get account => 'Konto';

  @override
  String get deleteAccount => 'Konto löschen';

  @override
  String get deleteAccountTitle => 'Konto löschen?';

  @override
  String get deleteAccountMessage =>
      'Diese Aktion kann nicht rückgängig gemacht werden. Alle Ihre Daten einschließlich Reisen, Nachrichten und Profilinformationen werden dauerhaft gelöscht.';

  @override
  String get deleteAccountConfirmation =>
      'Geben Sie DELETE ein, um zu bestätigen';

  @override
  String get deletingAccount => 'Konto wird gelöscht...';

  @override
  String get accountDeleted => 'Konto erfolgreich gelöscht';

  @override
  String get deleteAccountFailed => 'Konto konnte nicht gelöscht werden';

  @override
  String get deleteAccountWarning =>
      'Warnung: Dies wird Ihr Konto und alle zugehörigen Daten dauerhaft löschen.';

  @override
  String get reportMessage => 'Nachricht melden';

  @override
  String get reportMessageDescription =>
      'Unangemessenen Inhalt an den Reiseveranstalter melden';

  @override
  String get blockUser => 'Benutzer blockieren';

  @override
  String get blockUserDescription =>
      'Sie werden keine Nachrichten von diesem Benutzer mehr sehen';

  @override
  String get selectReportReason => 'Wählen Sie einen Grund für die Meldung:';

  @override
  String get additionalDetails => 'Zusätzliche Details';

  @override
  String get optionalDescription => 'Beschreiben Sie das Problem (optional)';

  @override
  String get report => 'Melden';

  @override
  String get block => 'Blockieren';

  @override
  String get reportTypeSpam => 'Spam';

  @override
  String get reportTypeHarassment => 'Belästigung';

  @override
  String get reportTypeInappropriate => 'Unangemessener Inhalt';

  @override
  String get reportTypeHateSpeech => 'Hassrede';

  @override
  String get reportTypeViolence => 'Gewalt';

  @override
  String get reportTypeOther => 'Sonstiges';

  @override
  String get reportSubmitted =>
      'Meldung gesendet. Der Reiseveranstalter wird benachrichtigt.';

  @override
  String get reportFailed =>
      'Meldung konnte nicht gesendet werden. Bitte versuchen Sie es erneut.';

  @override
  String blockUserConfirmation(String userName) {
    return 'Sind Sie sicher, dass Sie $userName blockieren möchten? Sie werden deren Nachrichten nicht mehr sehen.';
  }

  @override
  String userBlocked(String userName) {
    return '$userName wurde blockiert';
  }

  @override
  String get blockFailed =>
      'Benutzer konnte nicht blockiert werden. Bitte versuchen Sie es erneut.';

  @override
  String get blockedUsers => 'Blockierte Benutzer';

  @override
  String get noBlockedUsers => 'Keine blockierten Benutzer';

  @override
  String get unblock => 'Entsperren';

  @override
  String userUnblocked(String userName) {
    return '$userName wurde entsperrt';
  }

  @override
  String get reportUser => 'Benutzer melden';

  @override
  String get reportUserDescription =>
      'Diesen Benutzer an den Reiseveranstalter melden';

  @override
  String get locationPermissionDenied => 'Standortberechtigung verweigert';

  @override
  String get locationPermissionDeniedForever =>
      'Standortberechtigung dauerhaft verweigert. Bitte in den Einstellungen aktivieren.';

  @override
  String get locationServicesDisabled => 'Standortdienste deaktiviert';

  @override
  String get gettingLocation => 'Standort wird ermittelt...';

  @override
  String get currentLocation => 'Aktueller Standort';

  @override
  String get shareLocation => 'Standort teilen';

  @override
  String get shareLocationConfirmation =>
      'Mochten Sie diesen Standort im Chat teilen?';

  @override
  String get share => 'Teilen';

  @override
  String get uploadFailed => 'Upload fehlgeschlagen';

  @override
  String get openInGoogleMaps => 'In Google Maps offnen';

  @override
  String get getDirections => 'Wegbeschreibung abrufen';

  @override
  String get drivingDirections => 'Fahrtroute';

  @override
  String get walkingDirections => 'Fussweg';

  @override
  String get transitDirections => 'OPNV-Route';

  @override
  String get noPinnedMessages => 'Keine angehefteten Nachrichten';

  @override
  String get noItineraryYet => 'Noch kein Reiseplan';

  @override
  String get viewFullItinerary => 'Vollstandigen Reiseplan anzeigen';

  @override
  String get inviteParticipant => 'Teilnehmer einladen';

  @override
  String get emailAddress => 'E-Mail-Adresse';

  @override
  String get enterEmailAddress => 'E-Mail-Adresse eingeben';

  @override
  String get invalidEmail => 'Ungultige E-Mail-Adresse';

  @override
  String get role => 'Rolle';

  @override
  String get permissions => 'Berechtigungen';

  @override
  String get sendInvite => 'Einladung senden';

  @override
  String get inviteSent => 'Einladung gesendet';

  @override
  String get editItinerary => 'Reiseplan bearbeiten';

  @override
  String get deleteItinerary => 'Reiseplan loschen';

  @override
  String get deleteItineraryConfirm =>
      'Sind Sie sicher, dass Sie diesen Reiseplan loschen mochten?';

  @override
  String get itineraryDeleted => 'Reiseplan geloscht';

  @override
  String get searchPlaces => 'Orte suchen';

  @override
  String get selectLocation => 'Standort auswahlen';

  @override
  String get confirmLocation => 'Standort bestatigen';

  @override
  String get hotelName => 'Hotelname';

  @override
  String get roomType => 'Zimmertyp';

  @override
  String get checkInTime => 'Check-in-Zeit';

  @override
  String get checkOutTime => 'Check-out-Zeit';

  @override
  String get carCompany => 'Autovermietung';

  @override
  String get carModel => 'Automodell';

  @override
  String get pickupLocation => 'Abholort';

  @override
  String get dropoffLocation => 'Ruckgabeort';

  @override
  String get pickupTime => 'Abholzeit';

  @override
  String get dropoffTime => 'Ruckgabezeit';

  @override
  String get restaurantName => 'Restaurantname';

  @override
  String get cuisine => 'Kuche';

  @override
  String get priceRange => 'Preisklasse';

  @override
  String get reservationTime => 'Reservierungszeit';

  @override
  String get departureAirport => 'Abflughafen';

  @override
  String get arrivalAirport => 'Ankunftsflughafen';

  @override
  String get departureTime => 'Abflugzeit';

  @override
  String get arrivalTime => 'Ankunftszeit';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Gate';

  @override
  String get confirmationNumber => 'Bestatigungsnummer';

  @override
  String get other => 'Sonstiges';

  @override
  String get title => 'Titel';

  @override
  String get description => 'Beschreibung';

  @override
  String get itemNotFound => 'Element nicht gefunden';

  @override
  String get selectDay => 'Tag auswahlen';

  @override
  String get selectAirline => 'Fluggesellschaft auswahlen';

  @override
  String get enterNotesHint => 'Zusatzliche Notizen eingeben';

  @override
  String get enterHotelName => 'Hotelnamen eingeben';

  @override
  String get enterRoomType => 'z.B. Deluxe Doppelzimmer';

  @override
  String get enterAddress => 'Adresse eingeben';

  @override
  String get enterConfirmationNumber => 'Bestatigungsnummer eingeben';

  @override
  String get selectCarCompany => 'Autovermietung auswahlen';

  @override
  String get enterCarModel => 'z.B. VW Golf';

  @override
  String get enterPickupLocation => 'Abholort eingeben';

  @override
  String get enterDropoffLocation => 'Ruckgabeort eingeben';

  @override
  String get pickupInfo => 'Abholinformationen';

  @override
  String get dropoffInfo => 'Ruckgabeinformationen';

  @override
  String get enterRestaurantName => 'Restaurantnamen eingeben';

  @override
  String get cuisineType => 'Kuchenart';

  @override
  String get selectCuisineType => 'Kuchenart auswahlen';

  @override
  String get reservationInfo => 'Reservierungsinformationen';

  @override
  String get enterTitle => 'Titel eingeben';

  @override
  String get enterDescription => 'Beschreibung eingeben';

  @override
  String get enterLocation => 'Ort eingeben';

  @override
  String get startTime => 'Startzeit';

  @override
  String get endTime => 'Endzeit';

  @override
  String get addAttachments => 'Anhange hinzufugen';

  @override
  String get attachmentHint => 'E-Ticket, Reservierungsbestatigung, usw.';

  @override
  String get itemUpdatedSuccess => 'Element erfolgreich aktualisiert';

  @override
  String get itemDeletedSuccess => 'Element erfolgreich geloscht';
}
