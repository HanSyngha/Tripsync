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
  String get noMapLocations => 'No locations to display on map';

  @override
  String get noMapLocationsHint => 'Add locations to your itinerary to see them on the map';

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
  String get discardTrip => 'Annulla viaggio?';

  @override
  String get discardTripMessage =>
      'Sei sicuro di voler annullare questo viaggio? Tutte le modifiche andranno perse.';

  @override
  String get discardChanges => 'Annulla modifiche?';

  @override
  String get discardChangesMessage =>
      'Sei sicuro di voler annullare le tue modifiche?';

  @override
  String get keepEditing => 'Continua a modificare';

  @override
  String get discard => 'Annulla';

  @override
  String get tripCreatedSuccess => 'Viaggio creato con successo!';

  @override
  String get tripUpdatedSuccess => 'Viaggio aggiornato con successo!';

  @override
  String get tripNotFound => 'Viaggio non trovato';

  @override
  String get itinerarySaved => 'Itinerario salvato';

  @override
  String get comingSoon => 'Prossimamente';

  @override
  String get signOut => 'Esci';

  @override
  String get retry => 'Riprova';

  @override
  String get viewParticipants => 'Visualizza partecipanti';

  @override
  String get pinnedMessages => 'Messaggi fissati';

  @override
  String get searchMessages => 'Cerca messaggi';

  @override
  String get sendAnnouncement => 'Invia annuncio';

  @override
  String get photo => 'Foto';

  @override
  String get camera => 'Fotocamera';

  @override
  String get sharePhotosFromGallery => 'Condividi foto dalla galleria';

  @override
  String get takeNewPhoto => 'Scatta nuova foto';

  @override
  String get shareCurrentLocation => 'Condividi posizione attuale';

  @override
  String get featureComingSoon => 'Funzione in arrivo!';

  @override
  String get activityAddedSuccess => 'Attivita\' aggiunta con successo';

  @override
  String get filePickerComingSoon => 'Selettore file in arrivo';

  @override
  String get pleaseEnterMessage => 'Inserisci un messaggio';

  @override
  String get announcementSentSuccess => 'Annuncio inviato con successo!';

  @override
  String get failedToLoadParticipants => 'Impossibile caricare i partecipanti';

  @override
  String get loginRequired => 'Accesso richiesto';

  @override
  String get inviteSendFailed => 'Impossibile inviare l\'invito. Riprova.';

  @override
  String get newInviteLinkGenerated => 'Nuovo link di invito generato';

  @override
  String get inviteLinkCopied => 'Link di invito copiato';

  @override
  String get userNotFound => 'Utente non trovato';

  @override
  String get noDestination => 'Nessuna destinazione';

  @override
  String get loginTitle => 'Benvenuto';

  @override
  String get loginSubtitle => 'Accedi per iniziare il tuo viaggio';

  @override
  String get continueWithKakao => 'Continua con Kakao';

  @override
  String get continueWithNaver => 'Continua con Naver';

  @override
  String get continueWithGoogle => 'Continua con Google';

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

  @override
  String get reportMessage => 'Segnala messaggio';

  @override
  String get reportMessageDescription =>
      'Segnala contenuti inappropriati all\'organizzatore del viaggio';

  @override
  String get blockUser => 'Blocca utente';

  @override
  String get blockUserDescription =>
      'Non vedrai piu\' i messaggi di questo utente';

  @override
  String get selectReportReason => 'Seleziona un motivo per la segnalazione:';

  @override
  String get additionalDetails => 'Dettagli aggiuntivi';

  @override
  String get optionalDescription => 'Descrivi il problema (facoltativo)';

  @override
  String get report => 'Segnala';

  @override
  String get block => 'Blocca';

  @override
  String get reportTypeSpam => 'Spam';

  @override
  String get reportTypeHarassment => 'Molestie';

  @override
  String get reportTypeInappropriate => 'Contenuto inappropriato';

  @override
  String get reportTypeHateSpeech => 'Discorso d\'odio';

  @override
  String get reportTypeViolence => 'Violenza';

  @override
  String get reportTypeOther => 'Altro';

  @override
  String get reportSubmitted =>
      'Segnalazione inviata. L\'organizzatore del viaggio sara\' notificato.';

  @override
  String get reportFailed => 'Impossibile inviare la segnalazione. Riprova.';

  @override
  String blockUserConfirmation(String userName) {
    return 'Sei sicuro di voler bloccare $userName? Non vedrai piu\' i suoi messaggi.';
  }

  @override
  String userBlocked(String userName) {
    return '$userName e\' stato bloccato';
  }

  @override
  String get blockFailed => 'Impossibile bloccare l\'utente. Riprova.';

  @override
  String get blockedUsers => 'Utenti bloccati';

  @override
  String get noBlockedUsers => 'Nessun utente bloccato';

  @override
  String get unblock => 'Sblocca';

  @override
  String userUnblocked(String userName) {
    return '$userName e\' stato sbloccato';
  }

  @override
  String get reportUser => 'Segnala utente';

  @override
  String get reportUserDescription =>
      'Segnala questo utente all\'organizzatore del viaggio';

  @override
  String get locationPermissionDenied => 'Permesso di localizzazione negato';

  @override
  String get locationPermissionDeniedForever =>
      'Permesso di localizzazione negato permanentemente. Abilitalo nelle impostazioni.';

  @override
  String get locationServicesDisabled =>
      'Servizi di localizzazione disabilitati';

  @override
  String get gettingLocation => 'Ottenimento posizione...';

  @override
  String get currentLocation => 'Posizione attuale';

  @override
  String get shareLocation => 'Condividi posizione';

  @override
  String get shareLocationConfirmation =>
      'Vuoi condividere questa posizione nella chat?';

  @override
  String get share => 'Condividi';

  @override
  String get uploadFailed => 'Caricamento fallito';

  @override
  String get openInGoogleMaps => 'Apri in Google Maps';

  @override
  String get getDirections => 'Ottieni indicazioni';

  @override
  String get drivingDirections => 'Indicazioni in auto';

  @override
  String get walkingDirections => 'Indicazioni a piedi';

  @override
  String get transitDirections => 'Indicazioni con trasporto pubblico';

  @override
  String get noPinnedMessages => 'Nessun messaggio fissato';

  @override
  String get noItineraryYet => 'Nessun itinerario ancora';

  @override
  String get viewFullItinerary => 'Visualizza itinerario completo';

  @override
  String get inviteParticipant => 'Invita partecipante';

  @override
  String get emailAddress => 'Indirizzo email';

  @override
  String get enterEmailAddress => 'Inserisci indirizzo email';

  @override
  String get invalidEmail => 'Indirizzo email non valido';

  @override
  String get role => 'Ruolo';

  @override
  String get permissions => 'Autorizzazioni';

  @override
  String get sendInvite => 'Invia invito';

  @override
  String get inviteSent => 'Invito inviato';

  @override
  String get editItinerary => 'Modifica itinerario';

  @override
  String get deleteItinerary => 'Elimina itinerario';

  @override
  String get deleteItineraryConfirm =>
      'Sei sicuro di voler eliminare questo itinerario?';

  @override
  String get itineraryDeleted => 'Itinerario eliminato';

  @override
  String get searchPlaces => 'Cerca luoghi';

  @override
  String get selectLocation => 'Seleziona posizione';

  @override
  String get confirmLocation => 'Conferma posizione';

  @override
  String get hotelName => 'Nome hotel';

  @override
  String get roomType => 'Tipo di camera';

  @override
  String get checkInTime => 'Orario check-in';

  @override
  String get checkOutTime => 'Orario check-out';

  @override
  String get carCompany => 'Compagnia noleggio';

  @override
  String get carModel => 'Modello auto';

  @override
  String get pickupLocation => 'Luogo ritiro';

  @override
  String get dropoffLocation => 'Luogo riconsegna';

  @override
  String get pickupTime => 'Orario ritiro';

  @override
  String get dropoffTime => 'Orario riconsegna';

  @override
  String get restaurantName => 'Nome ristorante';

  @override
  String get cuisine => 'Cucina';

  @override
  String get priceRange => 'Fascia di prezzo';

  @override
  String get reservationTime => 'Orario prenotazione';

  @override
  String get departureAirport => 'Aeroporto di partenza';

  @override
  String get arrivalAirport => 'Aeroporto di arrivo';

  @override
  String get departureTime => 'Orario di partenza';

  @override
  String get arrivalTime => 'Orario di arrivo';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Gate';

  @override
  String get confirmationNumber => 'Numero di conferma';

  @override
  String get other => 'Altro';

  @override
  String get title => 'Titolo';

  @override
  String get description => 'Descrizione';

  @override
  String get itemNotFound => 'Elemento non trovato';

  @override
  String get selectDay => 'Seleziona giorno';

  @override
  String get selectAirline => 'Seleziona compagnia aerea';

  @override
  String get enterNotesHint => 'Inserisci note aggiuntive';

  @override
  String get enterHotelName => 'Inserisci nome hotel';

  @override
  String get enterRoomType => 'Es: Suite Deluxe';

  @override
  String get enterAddress => 'Inserisci indirizzo';

  @override
  String get enterConfirmationNumber => 'Inserisci numero di conferma';

  @override
  String get selectCarCompany => 'Seleziona compagnia noleggio';

  @override
  String get enterCarModel => 'Es: Fiat 500';

  @override
  String get enterPickupLocation => 'Inserisci luogo ritiro';

  @override
  String get enterDropoffLocation => 'Inserisci luogo riconsegna';

  @override
  String get pickupInfo => 'Informazioni ritiro';

  @override
  String get dropoffInfo => 'Informazioni riconsegna';

  @override
  String get enterRestaurantName => 'Inserisci nome ristorante';

  @override
  String get cuisineType => 'Tipo di cucina';

  @override
  String get selectCuisineType => 'Seleziona tipo di cucina';

  @override
  String get reservationInfo => 'Informazioni prenotazione';

  @override
  String get enterTitle => 'Inserisci titolo';

  @override
  String get enterDescription => 'Inserisci descrizione';

  @override
  String get enterLocation => 'Inserisci posizione';

  @override
  String get startTime => 'Ora di inizio';

  @override
  String get endTime => 'Ora di fine';

  @override
  String get addAttachments => 'Aggiungi allegati';

  @override
  String get attachmentHint => 'E-ticket, conferma prenotazione, ecc.';

  @override
  String get itemUpdatedSuccess => 'Elemento aggiornato con successo';

  @override
  String get itemDeletedSuccess => 'Elemento eliminato con successo';
}
