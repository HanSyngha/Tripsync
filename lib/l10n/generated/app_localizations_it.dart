// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Inizia il Tuo Viaggio';

  @override
  String get welcomeSubtitle =>
      'Scopri nuove esperienze e crea ricordi speciali';

  @override
  String get skip => 'Salta';

  @override
  String get participant => 'Partecipante';

  @override
  String get host => 'Organizzatore';

  @override
  String get coHost => 'Co-Organizzatore';

  @override
  String get signInWithKakao => 'Continua con Kakao';

  @override
  String get signInWithNaver => 'Continua con Naver';

  @override
  String get signInWithGoogle => 'Continua con Google';

  @override
  String get signInWithApple => 'Continua con Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Effettuando l\'accesso, accetti i nostri $terms e la nostra $privacy.';
  }

  @override
  String get termsOfService => 'Termini di Servizio';

  @override
  String get privacyPolicy => 'Informativa sulla Privacy';

  @override
  String get welcomeBack => 'Bentornato';

  @override
  String get readyForNextJourney => 'Pronto per la tua prossima avventura?';

  @override
  String get allTrips => 'Tutti i Viaggi';

  @override
  String get hosting => 'Organizzati da te';

  @override
  String get participating => 'A cui partecipi';

  @override
  String get happeningNow => 'In Corso';

  @override
  String get upcomingAdventures => 'Prossime Avventure';

  @override
  String get viewAll => 'Vedi tutto';

  @override
  String dayOf(int current, int total) {
    return 'Giorno $current di $total';
  }

  @override
  String get inProgress => 'In Corso';

  @override
  String get manage => 'Gestisci';

  @override
  String get guest => 'Ospite';

  @override
  String get tbd => 'Da definire';

  @override
  String get home => 'Home';

  @override
  String get explore => 'Esplora';

  @override
  String get chat => 'Chat';

  @override
  String get profile => 'Profilo';

  @override
  String get createTrip => 'Crea Viaggio';

  @override
  String get letsplanYourJourney => 'Pianifichiamo il tuo viaggio';

  @override
  String get hostCanEditLater =>
      'Come organizzatore, potrai modificare questi dettagli in qualsiasi momento.';

  @override
  String get cancel => 'Annulla';

  @override
  String get save => 'Salva';

  @override
  String get basicInfo => 'Informazioni Base';

  @override
  String get required => 'Obbligatorio';

  @override
  String get tripName => 'Nome del Viaggio';

  @override
  String get tripNameHint => 'es. Estate a Kyoto';

  @override
  String get destination => 'Destinazione';

  @override
  String get destinationHint => 'Dove stai andando?';

  @override
  String get dates => 'Date';

  @override
  String get startDate => 'Data di Inizio';

  @override
  String get endDate => 'Data di Fine';

  @override
  String get optionalDetails => 'Dettagli Facoltativi';

  @override
  String get coverPhoto => 'Foto di Copertina';

  @override
  String get tapToUploadCover => 'Tocca per caricare la copertina';

  @override
  String get tripGoalMemo => 'Obiettivo / Memo del Viaggio';

  @override
  String get tripGoalHint =>
      'Qual e\' l\'obiettivo principale di questo viaggio?';

  @override
  String get nextStep => 'Prossimo Passo';

  @override
  String get participantManagement => 'Gestione Partecipanti';

  @override
  String get participating_count => 'Partecipanti';

  @override
  String get pendingInvites => 'Inviti in Sospeso';

  @override
  String get inviteNewMember => 'Invita Nuovo Membro';

  @override
  String get searchByNameOrEmail => 'Cerca per nome o email';

  @override
  String get hosts => 'Organizzatori';

  @override
  String get admin => 'ADMIN';

  @override
  String get travelers => 'Viaggiatori';

  @override
  String get allPermissions => 'Tutti i permessi';

  @override
  String get canEditSchedule => 'Puo\' modificare il programma';

  @override
  String get readOnly => 'Solo lettura';

  @override
  String get pendingAcceptance => 'In attesa di accettazione';

  @override
  String get resend => 'Reinvia';

  @override
  String get inviteLinkActivated => 'Link di invito attivato';

  @override
  String get copy => 'Copia';

  @override
  String get allowScheduleEdit => 'Consenti modifica programma';

  @override
  String get allowPhotoUpload => 'Consenti caricamento foto';

  @override
  String get removeFromTrip => 'Rimuovi dal viaggio';

  @override
  String joinedDaysAgo(int days) {
    return 'Si e\' unito $days giorni fa';
  }

  @override
  String get itinerary => 'Itinerario';

  @override
  String get organizerView => 'Vista Organizzatore';

  @override
  String get draft => 'Bozza';

  @override
  String days(int count) {
    return '$count Giorni';
  }

  @override
  String day(int number) {
    return 'Giorno $number';
  }

  @override
  String get addActivity => 'Aggiungi Attivita\'';

  @override
  String get schedule => 'Programma';

  @override
  String get map => 'Mappa';

  @override
  String get people => 'Persone';

  @override
  String get settings => 'Impostazioni';

  @override
  String get flight => 'Volo';

  @override
  String get accommodation => 'Alloggio';

  @override
  String get rentalCar => 'Auto a Noleggio';

  @override
  String get restaurant => 'Ristorante';

  @override
  String get attraction => 'Attrazione';

  @override
  String get activity => 'Attivita\'';

  @override
  String get transportation => 'Trasporto';

  @override
  String get enterDetails => 'Inserisci Dettagli';

  @override
  String get airline => 'Compagnia Aerea';

  @override
  String get flightNumber => 'Numero del Volo';

  @override
  String get departure => 'Partenza';

  @override
  String get arrival => 'Arrivo';

  @override
  String get notes => 'Note';

  @override
  String get notesHint => 'Scrivi qui eventuali note importanti...';

  @override
  String get addAttachment => 'Aggiungi Allegato';

  @override
  String get eTicketOrVoucher => 'E-ticket o voucher (PDF, JPG)';

  @override
  String get reminderSettings => 'Impostazioni Promemoria';

  @override
  String get reservationConfirmed => 'Prenotazione Confermata';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Guida - $members Membri';
  }

  @override
  String get guide => 'GUIDA';

  @override
  String get organizer => 'ORGANIZZATORE';

  @override
  String get messagePlaceholder => 'Messaggio...';

  @override
  String get openMap => 'Apri Mappa';

  @override
  String get newAnnouncement => 'Nuovo Annuncio';

  @override
  String get toWhom => 'A chi?';

  @override
  String get allParticipants => 'Tutti i Partecipanti';

  @override
  String get selectSpecific => 'Seleziona Specifici';

  @override
  String othersSelected(int count) {
    return '+ $count altri selezionati';
  }

  @override
  String get messageDetails => 'Dettagli Messaggio';

  @override
  String get nextSchedule => 'Prossimo Programma';

  @override
  String get urgent => 'Urgente';

  @override
  String get generalInfo => 'Informazioni Generali';

  @override
  String get poll => 'Sondaggio';

  @override
  String get quickTemplates => 'Modelli Rapidi';

  @override
  String get templateBusLeaving => 'Autobus in partenza tra 10';

  @override
  String get templateMeetingPoint => 'Punto di incontro cambiato';

  @override
  String get templateWeather => 'Allerta meteo';

  @override
  String get templateDinner => 'Prenotazioni per la cena';

  @override
  String get subject => 'Oggetto';

  @override
  String get subjectHint => 'es. Ritrovo nella hall';

  @override
  String get message => 'Messaggio';

  @override
  String get messageHint => 'Scrivi qui il tuo annuncio...';

  @override
  String get addPhoto => 'Aggiungi Foto';

  @override
  String get addLocation => 'Aggiungi Posizione';

  @override
  String get pinToTopOfChat => 'Fissa in cima alla chat';

  @override
  String get keepVisibleForAll => 'Mantieni visibile per tutti i partecipanti';

  @override
  String get sendAsUrgentAlert => 'Invia come Avviso Urgente';

  @override
  String get notifiesEvenIfMuted => 'Notifica anche se silenziato';

  @override
  String get sendNotification => 'Invia Notifica';

  @override
  String get notifications => 'Notifiche';

  @override
  String get markAllAsRead => 'Segna tutto come letto';

  @override
  String get all => 'Tutto';

  @override
  String get announcements => 'Annunci';

  @override
  String get today => 'Oggi';

  @override
  String get yesterday => 'Ieri';

  @override
  String get announcement => 'Annuncio';

  @override
  String get pastAnnouncement => 'Annuncio Passato';

  @override
  String minutesAgo(int minutes) {
    return '$minutes min fa';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours ore fa';
  }

  @override
  String get tripDetails => 'Dettagli Viaggio';

  @override
  String nights(int count) {
    return '$count Notti';
  }

  @override
  String get hostedBy => 'Organizzato da';

  @override
  String get mapView => 'Vista Mappa';

  @override
  String get groupChat => 'Chat di Gruppo';

  @override
  String get savedDocs => 'Documenti Salvati';

  @override
  String get dontForget => 'Non dimenticare!';

  @override
  String get overview => 'Panoramica';

  @override
  String get expandAll => 'Espandi Tutto';

  @override
  String get checkIn => 'Check-in';

  @override
  String get checkOut => 'Check-out';

  @override
  String get directions => 'Indicazioni';

  @override
  String get reservation => 'Prenotazione';

  @override
  String get currentStatus => 'Stato Attuale';

  @override
  String tripStartsIn(int days) {
    return 'Il viaggio inizia tra $days giorni';
  }

  @override
  String get accountAndPermissions => 'Account e Permessi';

  @override
  String get profileVisibility => 'Visibilita\' Profilo';

  @override
  String get displaySettings => 'Impostazioni Schermo';

  @override
  String get darkMode => 'Modalita\' Scura';

  @override
  String get fontSize => 'Dimensione Carattere';

  @override
  String get standard => 'Standard';

  @override
  String get notificationSettings => 'Notifiche';

  @override
  String get tripScheduleNotifications => 'Notifiche programma viaggio';

  @override
  String get importantChangesPush => 'Notifiche push per modifiche importanti';

  @override
  String get newMessageNotifications => 'Notifiche nuovi messaggi';

  @override
  String get helpAndSupport => 'Aiuto e Supporto';

  @override
  String get appVersion => 'Versione App';

  @override
  String get logout => 'Esci';

  @override
  String get permissionRequired => 'Permesso Richiesto';

  @override
  String get notificationPermissionMessage =>
      'TripSync ha bisogno del permesso per le notifiche per inviarti aggiornamenti importanti sul viaggio e annunci dagli organizzatori.';

  @override
  String get allowNotifications => 'Consenti Notifiche';

  @override
  String get later => 'Piu\' tardi';

  @override
  String get error => 'Errore';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get noTripsYet => 'Nessun viaggio ancora';

  @override
  String get createYourFirstTrip =>
      'Crea il tuo primo viaggio o unisciti a uno!';

  @override
  String get noNotifications => 'Nessuna notifica';

  @override
  String get youreAllCaughtUp => 'Sei in pari!';

  @override
  String get loading => 'Caricamento...';

  @override
  String get connectionError => 'Errore di connessione';

  @override
  String get checkYourInternet => 'Controlla la tua connessione internet';

  @override
  String get confirmDelete => 'Conferma Eliminazione';

  @override
  String get deleteConfirmMessage => 'Sei sicuro di voler eliminare questo?';

  @override
  String get delete => 'Elimina';

  @override
  String get confirm => 'Conferma';

  @override
  String get done => 'Fatto';

  @override
  String get edit => 'Modifica';

  @override
  String get close => 'Chiudi';

  @override
  String get back => 'Indietro';

  @override
  String get next => 'Avanti';

  @override
  String get search => 'Cerca';

  @override
  String get noResults => 'Nessun risultato trovato';

  @override
  String get selectDate => 'Seleziona Data';

  @override
  String get selectTime => 'Seleziona Ora';

  @override
  String get from => 'Da';

  @override
  String get to => 'A';

  @override
  String get duration => 'Durata';

  @override
  String get location => 'Posizione';

  @override
  String get address => 'Indirizzo';

  @override
  String get phone => 'Telefono';

  @override
  String get email => 'Email';

  @override
  String get website => 'Sito Web';

  @override
  String get price => 'Prezzo';

  @override
  String get viewMenu => 'Vedi Menu';

  @override
  String get recommended => 'Consigliato';

  @override
  String get hiking => 'Escursionismo';

  @override
  String get warning => 'Attenzione';

  @override
  String get viewDetails => 'Vedi Dettagli';

  @override
  String get readyForYour => 'Pronto per la tua';

  @override
  String get nextJourney => 'prossima avventura?';

  @override
  String get createFirstTrip => 'Crea il tuo primo viaggio o unisciti a uno!';

  @override
  String get language => 'Lingua';

  @override
  String get changePhoto => 'Cambia foto';

  @override
  String get takePhoto => 'Scatta foto';

  @override
  String get chooseFromGallery => 'Scegli dalla galleria';

  @override
  String get removePhoto => 'Rimuovi foto';

  @override
  String get displayName => 'Nome visualizzato';

  @override
  String get enterDisplayName => 'Inserisci il nome visualizzato';

  @override
  String get enterPhoneNumber => 'Inserisci il tuo numero di telefono';

  @override
  String get displayNameRequired => 'Il nome visualizzato e\' obbligatorio';

  @override
  String get displayNameMinLength => 'Il nome deve avere almeno 2 caratteri';

  @override
  String get profileUpdated => 'Profilo aggiornato con successo';

  @override
  String get failedToUpdateProfile => 'Aggiornamento profilo fallito';

  @override
  String get failedToPickImage => 'Selezione immagine fallita';

  @override
  String get logoutConfirmation => 'Sei sicuro di voler uscire?';

  @override
  String get earlier => 'Prima';

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
  String get account => 'Account';

  @override
  String get deleteAccount => 'Elimina Account';

  @override
  String get deleteAccountTitle => 'Elimina Account';

  @override
  String get deleteAccountMessage =>
      'Sei sicuro di voler eliminare il tuo account? Questa azione e\' irreversibile e tutti i tuoi dati verranno eliminati permanentemente.';

  @override
  String get deleteAccountConfirmation => 'Digita \'ELIMINA\' per confermare';

  @override
  String get deletingAccount => 'Eliminazione account in corso...';

  @override
  String get accountDeleted => 'Account eliminato con successo';

  @override
  String get deleteAccountFailed => 'Eliminazione account fallita';

  @override
  String get deleteAccountWarning =>
      'Attenzione: Questa azione non puo\' essere annullata. Tutti i tuoi dati, inclusi viaggi e messaggi, verranno eliminati permanentemente.';
}
