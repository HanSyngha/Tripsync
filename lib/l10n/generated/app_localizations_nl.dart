// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Begin je reis';

  @override
  String get welcomeSubtitle =>
      'Ontdek nieuwe ervaringen en creeer bijzondere herinneringen';

  @override
  String get skip => 'Overslaan';

  @override
  String get participant => 'Deelnemer';

  @override
  String get host => 'Organisator';

  @override
  String get coHost => 'Mede-organisator';

  @override
  String get signInWithKakao => 'Doorgaan met Kakao';

  @override
  String get signInWithNaver => 'Doorgaan met Naver';

  @override
  String get signInWithGoogle => 'Doorgaan met Google';

  @override
  String get signInWithApple => 'Doorgaan met Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Door in te loggen ga je akkoord met onze $terms en $privacy.';
  }

  @override
  String get termsOfService => 'Servicevoorwaarden';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get welcomeBack => 'Welkom terug';

  @override
  String get readyForNextJourney => 'Klaar voor je volgende reis?';

  @override
  String get allTrips => 'Alle reizen';

  @override
  String get hosting => 'Organiseren';

  @override
  String get participating => 'Deelnemen';

  @override
  String get happeningNow => 'Nu bezig';

  @override
  String get upcomingAdventures => 'Aankomende avonturen';

  @override
  String get viewAll => 'Bekijk alles';

  @override
  String dayOf(int current, int total) {
    return 'Dag $current van $total';
  }

  @override
  String get inProgress => 'Bezig';

  @override
  String get manage => 'Beheren';

  @override
  String get guest => 'Gast';

  @override
  String get tbd => 'Nog te bepalen';

  @override
  String get home => 'Home';

  @override
  String get explore => 'Ontdekken';

  @override
  String get chat => 'Chat';

  @override
  String get profile => 'Profiel';

  @override
  String get createTrip => 'Reis aanmaken';

  @override
  String get letsplanYourJourney => 'Laten we je reis plannen';

  @override
  String get hostCanEditLater =>
      'Als organisator kun je deze gegevens later altijd nog aanpassen.';

  @override
  String get cancel => 'Annuleren';

  @override
  String get save => 'Opslaan';

  @override
  String get basicInfo => 'Basisinformatie';

  @override
  String get required => 'Verplicht';

  @override
  String get tripName => 'Reisnaam';

  @override
  String get tripNameHint => 'bijv. Zomer in Kyoto';

  @override
  String get destination => 'Bestemming';

  @override
  String get destinationHint => 'Waar ga je naartoe?';

  @override
  String get dates => 'Datums';

  @override
  String get startDate => 'Startdatum';

  @override
  String get endDate => 'Einddatum';

  @override
  String get optionalDetails => 'Optionele details';

  @override
  String get coverPhoto => 'Omslagfoto';

  @override
  String get tapToUploadCover => 'Tik om omslag te uploaden';

  @override
  String get tripGoalMemo => 'Reisdoel / Memo';

  @override
  String get tripGoalHint => 'Wat is het hoofddoel van deze reis?';

  @override
  String get nextStep => 'Volgende stap';

  @override
  String get participantManagement => 'Deelnemersbeheer';

  @override
  String get participating_count => 'Deelnemend';

  @override
  String get pendingInvites => 'Openstaande uitnodigingen';

  @override
  String get inviteNewMember => 'Nieuw lid uitnodigen';

  @override
  String get searchByNameOrEmail => 'Zoeken op naam of e-mail';

  @override
  String get hosts => 'Organisatoren';

  @override
  String get admin => 'BEHEERDER';

  @override
  String get travelers => 'Reizigers';

  @override
  String get allPermissions => 'Alle rechten';

  @override
  String get canEditSchedule => 'Kan planning bewerken';

  @override
  String get readOnly => 'Alleen lezen';

  @override
  String get pendingAcceptance => 'Wacht op acceptatie';

  @override
  String get resend => 'Opnieuw versturen';

  @override
  String get inviteLinkActivated => 'Uitnodigingslink geactiveerd';

  @override
  String get copy => 'Kopieren';

  @override
  String get allowScheduleEdit => 'Planning bewerken toestaan';

  @override
  String get allowPhotoUpload => 'Foto uploaden toestaan';

  @override
  String get removeFromTrip => 'Verwijderen uit reis';

  @override
  String joinedDaysAgo(int days) {
    return '$days dagen geleden toegetreden';
  }

  @override
  String get itinerary => 'Reisschema';

  @override
  String get organizerView => 'Organisatorweergave';

  @override
  String get draft => 'Concept';

  @override
  String days(int count) {
    return '$count dagen';
  }

  @override
  String day(int number) {
    return 'Dag $number';
  }

  @override
  String get addActivity => 'Activiteit toevoegen';

  @override
  String get schedule => 'Planning';

  @override
  String get map => 'Kaart';

  @override
  String get people => 'Mensen';

  @override
  String get settings => 'Instellingen';

  @override
  String get flight => 'Vlucht';

  @override
  String get accommodation => 'Accommodatie';

  @override
  String get rentalCar => 'Huurauto';

  @override
  String get restaurant => 'Restaurant';

  @override
  String get attraction => 'Attractie';

  @override
  String get activity => 'Activiteit';

  @override
  String get transportation => 'Vervoer';

  @override
  String get enterDetails => 'Voer gegevens in';

  @override
  String get airline => 'Luchtvaartmaatschappij';

  @override
  String get flightNumber => 'Vluchtnummer';

  @override
  String get departure => 'Vertrek';

  @override
  String get arrival => 'Aankomst';

  @override
  String get notes => 'Notities';

  @override
  String get notesHint => 'Schrijf hier belangrijke notities...';

  @override
  String get addAttachment => 'Bijlage toevoegen';

  @override
  String get eTicketOrVoucher => 'E-ticket of voucher (PDF, JPG)';

  @override
  String get reminderSettings => 'Herinneringsinstellingen';

  @override
  String get reservationConfirmed => 'Reservering bevestigd';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Gids - $members Leden';
  }

  @override
  String get guide => 'GIDS';

  @override
  String get organizer => 'ORGANISATOR';

  @override
  String get messagePlaceholder => 'Bericht...';

  @override
  String get openMap => 'Open kaart';

  @override
  String get newAnnouncement => 'Nieuwe aankondiging';

  @override
  String get toWhom => 'Aan wie?';

  @override
  String get allParticipants => 'Alle deelnemers';

  @override
  String get selectSpecific => 'Specifiek selecteren';

  @override
  String othersSelected(int count) {
    return '+ $count anderen geselecteerd';
  }

  @override
  String get messageDetails => 'Berichtdetails';

  @override
  String get nextSchedule => 'Volgende planning';

  @override
  String get urgent => 'Dringend';

  @override
  String get generalInfo => 'Algemene informatie';

  @override
  String get poll => 'Peiling';

  @override
  String get quickTemplates => 'Snelle sjablonen';

  @override
  String get templateBusLeaving => 'Bus vertrekt over 10 min';

  @override
  String get templateMeetingPoint => 'Ontmoetingspunt gewijzigd';

  @override
  String get templateWeather => 'Weerwaarschuwing';

  @override
  String get templateDinner => 'Dinerreserveringen';

  @override
  String get subject => 'Onderwerp';

  @override
  String get subjectHint => 'bijv. Verzamelen in de lobby';

  @override
  String get message => 'Bericht';

  @override
  String get messageHint => 'Schrijf hier je aankondiging...';

  @override
  String get addPhoto => 'Foto toevoegen';

  @override
  String get addLocation => 'Locatie toevoegen';

  @override
  String get pinToTopOfChat => 'Vastpinnen bovenaan chat';

  @override
  String get keepVisibleForAll => 'Zichtbaar houden voor alle deelnemers';

  @override
  String get sendAsUrgentAlert => 'Versturen als dringende melding';

  @override
  String get notifiesEvenIfMuted => 'Meldt ook als gedempt';

  @override
  String get sendNotification => 'Melding versturen';

  @override
  String get notifications => 'Meldingen';

  @override
  String get markAllAsRead => 'Alles als gelezen markeren';

  @override
  String get all => 'Alles';

  @override
  String get announcements => 'Aankondigingen';

  @override
  String get today => 'Vandaag';

  @override
  String get yesterday => 'Gisteren';

  @override
  String get announcement => 'Aankondiging';

  @override
  String get pastAnnouncement => 'Vorige aankondiging';

  @override
  String minutesAgo(int minutes) {
    return '$minutes min geleden';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours uur geleden';
  }

  @override
  String get tripDetails => 'Reisdetails';

  @override
  String nights(int count) {
    return '$count nachten';
  }

  @override
  String get hostedBy => 'Georganiseerd door';

  @override
  String get mapView => 'Kaartweergave';

  @override
  String get groupChat => 'Groepschat';

  @override
  String get savedDocs => 'Opgeslagen documenten';

  @override
  String get dontForget => 'Niet vergeten!';

  @override
  String get overview => 'Overzicht';

  @override
  String get expandAll => 'Alles uitvouwen';

  @override
  String get checkIn => 'Inchecken';

  @override
  String get checkOut => 'Uitchecken';

  @override
  String get directions => 'Routebeschrijving';

  @override
  String get reservation => 'Reservering';

  @override
  String get currentStatus => 'Huidige status';

  @override
  String tripStartsIn(int days) {
    return 'Reis begint over $days dagen';
  }

  @override
  String get accountAndPermissions => 'Account en rechten';

  @override
  String get profileVisibility => 'Profielzichtbaarheid';

  @override
  String get displaySettings => 'Weergave-instellingen';

  @override
  String get darkMode => 'Donkere modus';

  @override
  String get fontSize => 'Lettergrootte';

  @override
  String get standard => 'Standaard';

  @override
  String get notificationSettings => 'Meldingen';

  @override
  String get tripScheduleNotifications => 'Reisplanningmeldingen';

  @override
  String get importantChangesPush =>
      'Pushmeldingen voor belangrijke wijzigingen';

  @override
  String get newMessageNotifications => 'Meldingen voor nieuwe berichten';

  @override
  String get helpAndSupport => 'Help en ondersteuning';

  @override
  String get appVersion => 'App-versie';

  @override
  String get logout => 'Uitloggen';

  @override
  String get permissionRequired => 'Toestemming vereist';

  @override
  String get notificationPermissionMessage =>
      'TripSync heeft toestemming nodig voor meldingen om je belangrijke reisupdates en aankondigingen van organisatoren te sturen.';

  @override
  String get allowNotifications => 'Meldingen toestaan';

  @override
  String get later => 'Later';

  @override
  String get error => 'Fout';

  @override
  String get tryAgain => 'Opnieuw proberen';

  @override
  String get noTripsYet => 'Nog geen reizen';

  @override
  String get createYourFirstTrip =>
      'Maak je eerste reis aan of neem deel aan een reis!';

  @override
  String get noNotifications => 'Geen meldingen';

  @override
  String get youreAllCaughtUp => 'Je bent helemaal bij!';

  @override
  String get loading => 'Laden...';

  @override
  String get connectionError => 'Verbindingsfout';

  @override
  String get checkYourInternet => 'Controleer je internetverbinding';

  @override
  String get confirmDelete => 'Verwijderen bevestigen';

  @override
  String get deleteConfirmMessage =>
      'Weet je zeker dat je dit wilt verwijderen?';

  @override
  String get delete => 'Verwijderen';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get done => 'Klaar';

  @override
  String get edit => 'Bewerken';

  @override
  String get close => 'Sluiten';

  @override
  String get back => 'Terug';

  @override
  String get next => 'Volgende';

  @override
  String get search => 'Zoeken';

  @override
  String get noResults => 'Geen resultaten gevonden';

  @override
  String get selectDate => 'Selecteer datum';

  @override
  String get selectTime => 'Selecteer tijd';

  @override
  String get from => 'Van';

  @override
  String get to => 'Naar';

  @override
  String get duration => 'Duur';

  @override
  String get location => 'Locatie';

  @override
  String get address => 'Adres';

  @override
  String get phone => 'Telefoon';

  @override
  String get email => 'E-mail';

  @override
  String get website => 'Website';

  @override
  String get price => 'Prijs';

  @override
  String get viewMenu => 'Bekijk menu';

  @override
  String get recommended => 'Aanbevolen';

  @override
  String get hiking => 'Wandelen';

  @override
  String get warning => 'Waarschuwing';

  @override
  String get viewDetails => 'Details bekijken';

  @override
  String get readyForYour => 'Klaar voor je';

  @override
  String get nextJourney => 'volgende reis?';

  @override
  String get createFirstTrip =>
      'Maak je eerste reis aan of neem deel aan een reis!';

  @override
  String get language => 'Taal';

  @override
  String get changePhoto => 'Foto wijzigen';

  @override
  String get takePhoto => 'Foto maken';

  @override
  String get chooseFromGallery => 'Kiezen uit galerij';

  @override
  String get removePhoto => 'Foto verwijderen';

  @override
  String get displayName => 'Weergavenaam';

  @override
  String get enterDisplayName => 'Voer je weergavenaam in';

  @override
  String get enterPhoneNumber => 'Voer je telefoonnummer in';

  @override
  String get displayNameRequired => 'Weergavenaam is verplicht';

  @override
  String get displayNameMinLength =>
      'Weergavenaam moet minimaal 2 tekens bevatten';

  @override
  String get profileUpdated => 'Profiel succesvol bijgewerkt';

  @override
  String get failedToUpdateProfile => 'Profiel bijwerken mislukt';

  @override
  String get failedToPickImage => 'Afbeelding selecteren mislukt';

  @override
  String get logoutConfirmation => 'Weet je zeker dat je wilt uitloggen?';

  @override
  String get earlier => 'Eerder';

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
  String get deleteAccount => 'Account verwijderen';

  @override
  String get deleteAccountTitle => 'Account verwijderen';

  @override
  String get deleteAccountMessage =>
      'Weet je zeker dat je je account wilt verwijderen? Deze actie is onomkeerbaar en al je gegevens worden permanent verwijderd.';

  @override
  String get deleteAccountConfirmation =>
      'Typ \'VERWIJDEREN\' om te bevestigen';

  @override
  String get deletingAccount => 'Account verwijderen...';

  @override
  String get accountDeleted => 'Account succesvol verwijderd';

  @override
  String get deleteAccountFailed => 'Account verwijderen mislukt';

  @override
  String get deleteAccountWarning =>
      'Waarschuwing: Deze actie kan niet ongedaan worden gemaakt. Al je gegevens inclusief reizen en berichten worden permanent verwijderd.';
}
