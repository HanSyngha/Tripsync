// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Bienvenue sur TripSync';

  @override
  String get welcomeSubtitle => 'Planifiez vos voyages ensemble';

  @override
  String get skip => 'Passer';

  @override
  String get participant => 'Participant';

  @override
  String get host => 'Organisateur';

  @override
  String get coHost => 'Co-organisateur';

  @override
  String get signInWithKakao => 'Se connecter avec Kakao';

  @override
  String get signInWithNaver => 'Se connecter avec Naver';

  @override
  String get signInWithGoogle => 'Se connecter avec Google';

  @override
  String get signInWithApple => 'Se connecter avec Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'En continuant, vous acceptez nos conditions';
  }

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get welcomeBack => 'Bon retour';

  @override
  String get readyForNextJourney => 'Prêt pour votre prochaine aventure ?';

  @override
  String get allTrips => 'Tous les voyages';

  @override
  String get hosting => 'Organisateur';

  @override
  String get participating => 'Participant';

  @override
  String get happeningNow => 'En cours';

  @override
  String get upcomingAdventures => 'Prochaines aventures';

  @override
  String get viewAll => 'Voir tout';

  @override
  String dayOf(int current, int total) {
    return 'Jour J';
  }

  @override
  String get inProgress => 'En cours';

  @override
  String get manage => 'Gérer';

  @override
  String get guest => 'Invité';

  @override
  String get tbd => 'À déterminer';

  @override
  String get home => 'Accueil';

  @override
  String get explore => 'Explorer';

  @override
  String get chat => 'Discussion';

  @override
  String get profile => 'Profil';

  @override
  String get createTrip => 'Créer un voyage';

  @override
  String get letsplanYourJourney => 'Planifions votre voyage';

  @override
  String get hostCanEditLater => 'L\'organisateur peut modifier plus tard';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get basicInfo => 'Informations de base';

  @override
  String get required => 'Requis';

  @override
  String get tripName => 'Nom du voyage';

  @override
  String get tripNameHint => 'Ex: Vacances d\'été à Paris';

  @override
  String get destination => 'Destination';

  @override
  String get destinationHint => 'Où allez-vous ?';

  @override
  String get dates => 'Dates';

  @override
  String get startDate => 'Date de début';

  @override
  String get endDate => 'Date de fin';

  @override
  String get optionalDetails => 'Détails optionnels';

  @override
  String get coverPhoto => 'Photo de couverture';

  @override
  String get tapToUploadCover => 'Appuyez pour télécharger une couverture';

  @override
  String get tripGoalMemo => 'Objectif du voyage';

  @override
  String get tripGoalHint => 'Quel est le but de ce voyage ?';

  @override
  String get nextStep => 'Étape suivante';

  @override
  String get participantManagement => 'Gestion des participants';

  @override
  String get participating_count => 'Participant';

  @override
  String get pendingInvites => 'Invitations en attente';

  @override
  String get inviteNewMember => 'Inviter un nouveau membre';

  @override
  String get searchByNameOrEmail => 'Rechercher par nom ou e-mail';

  @override
  String get hosts => 'Organisateurs';

  @override
  String get admin => 'Administrateur';

  @override
  String get travelers => 'Voyageurs';

  @override
  String get allPermissions => 'Toutes les permissions';

  @override
  String get canEditSchedule => 'Peut modifier le programme';

  @override
  String get readOnly => 'Lecture seule';

  @override
  String get pendingAcceptance => 'En attente d\'acceptation';

  @override
  String get resend => 'Renvoyer';

  @override
  String get inviteLinkActivated => 'Lien d\'invitation activé';

  @override
  String get copy => 'Copier';

  @override
  String get allowScheduleEdit => 'Autoriser la modification du programme';

  @override
  String get allowPhotoUpload => 'Autoriser le téléchargement de photos';

  @override
  String get removeFromTrip => 'Retirer du voyage';

  @override
  String joinedDaysAgo(int days) {
    return 'A rejoint il y a $days jours';
  }

  @override
  String get itinerary => 'Itinéraire';

  @override
  String get organizerView => 'Vue organisateur';

  @override
  String get draft => 'Brouillon';

  @override
  String days(int count) {
    return 'jours';
  }

  @override
  String day(int number) {
    return 'Jour';
  }

  @override
  String get addActivity => 'Ajouter une activité';

  @override
  String get schedule => 'Programme';

  @override
  String get map => 'Carte';

  @override
  String get people => 'Personnes';

  @override
  String get settings => 'Paramètres';

  @override
  String get flight => 'Vol';

  @override
  String get accommodation => 'Hébergement';

  @override
  String get rentalCar => 'Voiture de location';

  @override
  String get restaurant => 'Restaurant';

  @override
  String get attraction => 'Attraction';

  @override
  String get activity => 'Activité';

  @override
  String get transportation => 'Transport';

  @override
  String get enterDetails => 'Entrer les détails';

  @override
  String get airline => 'Compagnie aérienne';

  @override
  String get flightNumber => 'Numéro de vol';

  @override
  String get departure => 'Départ';

  @override
  String get arrival => 'Arrivée';

  @override
  String get notes => 'Notes';

  @override
  String get notesHint => 'Écrivez des notes importantes ici...';

  @override
  String get addAttachment => 'Ajouter une pièce jointe';

  @override
  String get eTicketOrVoucher => 'E-billet ou bon (PDF, JPG)';

  @override
  String get reminderSettings => 'Paramètres de rappel';

  @override
  String get reservationConfirmed => 'Réservation confirmée';

  @override
  String chatTitle(String tripName) {
    return 'Discussion';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Guide - $members Membres';
  }

  @override
  String get guide => 'Guide';

  @override
  String get organizer => 'Organisateur';

  @override
  String get messagePlaceholder => 'Écrivez un message...';

  @override
  String get openMap => 'Ouvrir la carte';

  @override
  String get newAnnouncement => 'Nouvelle annonce';

  @override
  String get toWhom => 'À qui';

  @override
  String get allParticipants => 'Tous les participants';

  @override
  String get selectSpecific => 'Sélectionner des personnes';

  @override
  String othersSelected(int count) {
    return '+ $count autres sélectionnés';
  }

  @override
  String get messageDetails => 'Détails du message';

  @override
  String get nextSchedule => 'Prochain programme';

  @override
  String get urgent => 'Urgent';

  @override
  String get generalInfo => 'Information générale';

  @override
  String get poll => 'Sondage';

  @override
  String get quickTemplates => 'Modèles rapides';

  @override
  String get templateBusLeaving => 'Bus part dans 10 min';

  @override
  String get templateMeetingPoint => 'Point de rendez-vous modifié';

  @override
  String get templateWeather => 'Alerte météo';

  @override
  String get templateDinner => 'Réservation dîner';

  @override
  String get subject => 'Sujet';

  @override
  String get subjectHint => 'ex. Rendez-vous dans le hall';

  @override
  String get message => 'Message';

  @override
  String get messageHint => 'Écrivez votre annonce ici...';

  @override
  String get addPhoto => 'Ajouter une photo';

  @override
  String get addLocation => 'Ajouter un lieu';

  @override
  String get pinToTopOfChat => 'Épingler en haut de la discussion';

  @override
  String get keepVisibleForAll => 'Garder visible pour tous';

  @override
  String get sendAsUrgentAlert => 'Envoyer comme alerte urgente';

  @override
  String get notifiesEvenIfMuted => 'Notifie même si en sourdine';

  @override
  String get sendNotification => 'Envoyer une notification';

  @override
  String get notifications => 'Notifications';

  @override
  String get markAllAsRead => 'Tout marquer comme lu';

  @override
  String get all => 'Tout';

  @override
  String get announcements => 'Annonces';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get yesterday => 'Hier';

  @override
  String get announcement => 'Annonce';

  @override
  String get pastAnnouncement => 'Annonce passée';

  @override
  String minutesAgo(int minutes) {
    return 'il y a $minutes minutes';
  }

  @override
  String hoursAgo(int hours) {
    return 'il y a $hours heures';
  }

  @override
  String get tripDetails => 'Détails du voyage';

  @override
  String nights(int count) {
    return '$count nuits';
  }

  @override
  String get hostedBy => 'Organisé par';

  @override
  String get mapView => 'Vue carte';

  @override
  String get groupChat => 'Discussion de groupe';

  @override
  String get savedDocs => 'Documents enregistrés';

  @override
  String get dontForget => 'N\'oubliez pas';

  @override
  String get overview => 'Aperçu';

  @override
  String get expandAll => 'Tout développer';

  @override
  String get checkIn => 'Arrivée';

  @override
  String get checkOut => 'Départ';

  @override
  String get directions => 'Itinéraire';

  @override
  String get reservation => 'Réservation';

  @override
  String get currentStatus => 'Statut actuel';

  @override
  String tripStartsIn(int days) {
    return 'Le voyage commence dans $days jours';
  }

  @override
  String get accountAndPermissions => 'Compte et permissions';

  @override
  String get profileVisibility => 'Visibilité du profil';

  @override
  String get displaySettings => 'Paramètres d\'affichage';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get fontSize => 'Taille de police';

  @override
  String get standard => 'Standard';

  @override
  String get notificationSettings => 'Paramètres de notification';

  @override
  String get tripScheduleNotifications => 'Notifications de programme';

  @override
  String get importantChangesPush =>
      'Notifications push des changements importants';

  @override
  String get newMessageNotifications => 'Notifications de nouveaux messages';

  @override
  String get helpAndSupport => 'Aide et support';

  @override
  String get appVersion => 'Version de l\'application';

  @override
  String get logout => 'Déconnexion';

  @override
  String get permissionRequired => 'Permission requise';

  @override
  String get notificationPermissionMessage =>
      'TripSync a besoin de la permission de notification pour vous envoyer des mises à jour importantes et des annonces.';

  @override
  String get allowNotifications => 'Autoriser les notifications';

  @override
  String get later => 'Plus tard';

  @override
  String get error => 'Erreur';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get noTripsYet => 'Pas encore de voyage';

  @override
  String get createYourFirstTrip =>
      'Créez votre premier voyage ou rejoignez-en un !';

  @override
  String get noNotifications => 'Aucune notification';

  @override
  String get youreAllCaughtUp => 'Vous êtes à jour !';

  @override
  String get loading => 'Chargement...';

  @override
  String get connectionError => 'Erreur de connexion';

  @override
  String get checkYourInternet => 'Veuillez vérifier votre connexion internet';

  @override
  String get confirmDelete => 'Confirmer la suppression';

  @override
  String get deleteConfirmMessage =>
      'Êtes-vous sûr de vouloir supprimer ceci ?';

  @override
  String get delete => 'Supprimer';

  @override
  String get confirm => 'Confirmer';

  @override
  String get done => 'Terminé';

  @override
  String get edit => 'Modifier';

  @override
  String get close => 'Fermer';

  @override
  String get back => 'Retour';

  @override
  String get next => 'Suivant';

  @override
  String get search => 'Rechercher';

  @override
  String get noResults => 'Aucun résultat';

  @override
  String get noMapLocations => 'Aucun lieu à afficher sur la carte';

  @override
  String get noMapLocationsHint => 'Ajoutez des lieux à votre itinéraire pour les voir sur la carte';

  @override
  String get selectDate => 'Sélectionner une date';

  @override
  String get selectTime => 'Sélectionner une heure';

  @override
  String get from => 'De';

  @override
  String get to => 'À';

  @override
  String get duration => 'Durée';

  @override
  String get location => 'Lieu';

  @override
  String get address => 'Adresse';

  @override
  String get phone => 'Téléphone';

  @override
  String get email => 'E-mail';

  @override
  String get website => 'Site web';

  @override
  String get price => 'Prix';

  @override
  String get viewMenu => 'Voir le menu';

  @override
  String get recommended => 'Recommandé';

  @override
  String get hiking => 'Randonnée';

  @override
  String get warning => 'Avertissement';

  @override
  String get viewDetails => 'Voir les détails';

  @override
  String get readyForYour => 'Prêt pour votre';

  @override
  String get nextJourney => 'prochaine aventure ?';

  @override
  String get createFirstTrip =>
      'Créez votre premier voyage ou rejoignez-en un !';

  @override
  String get language => 'Langue';

  @override
  String get changePhoto => 'Changer la photo';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get chooseFromGallery => 'Choisir dans la galerie';

  @override
  String get removePhoto => 'Supprimer la photo';

  @override
  String get displayName => 'Nom d\'affichage';

  @override
  String get enterDisplayName => 'Entrez votre nom d\'affichage';

  @override
  String get enterPhoneNumber => 'Entrez votre numéro de téléphone';

  @override
  String get displayNameRequired => 'Le nom d\'affichage est requis';

  @override
  String get displayNameMinLength =>
      'Le nom doit contenir au moins 2 caractères';

  @override
  String get profileUpdated => 'Profil mis à jour avec succès';

  @override
  String get failedToUpdateProfile => 'Échec de la mise à jour du profil';

  @override
  String get failedToPickImage => 'Échec de la sélection de l\'image';

  @override
  String get logoutConfirmation =>
      'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get earlier => 'Plus tôt';

  @override
  String get discardTrip => 'Annuler le voyage ?';

  @override
  String get discardTripMessage =>
      'Êtes-vous sûr de vouloir annuler ce voyage ? Toutes les modifications seront perdues.';

  @override
  String get discardChanges => 'Annuler les modifications ?';

  @override
  String get discardChangesMessage =>
      'Êtes-vous sûr de vouloir annuler vos modifications ?';

  @override
  String get keepEditing => 'Continuer à modifier';

  @override
  String get discard => 'Annuler';

  @override
  String get tripCreatedSuccess => 'Voyage créé avec succès !';

  @override
  String get tripUpdatedSuccess => 'Voyage mis à jour avec succès !';

  @override
  String get tripNotFound => 'Voyage non trouvé';

  @override
  String get itinerarySaved => 'Itinéraire enregistré';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String get signOut => 'Déconnexion';

  @override
  String get retry => 'Réessayer';

  @override
  String get viewParticipants => 'Voir les participants';

  @override
  String get pinnedMessages => 'Messages épinglés';

  @override
  String get searchMessages => 'Rechercher des messages';

  @override
  String get sendAnnouncement => 'Envoyer une annonce';

  @override
  String get photo => 'Photo';

  @override
  String get camera => 'Appareil photo';

  @override
  String get sharePhotosFromGallery => 'Partager des photos de la galerie';

  @override
  String get takeNewPhoto => 'Prendre une nouvelle photo';

  @override
  String get shareCurrentLocation => 'Partager votre position actuelle';

  @override
  String get featureComingSoon => 'Fonctionnalité bientôt disponible !';

  @override
  String get activityAddedSuccess => 'Activité ajoutée avec succès';

  @override
  String get filePickerComingSoon => 'Sélecteur de fichiers bientôt disponible';

  @override
  String get pleaseEnterMessage => 'Veuillez entrer un message';

  @override
  String get announcementSentSuccess => 'Annonce envoyée avec succès !';

  @override
  String get failedToLoadParticipants => 'Échec du chargement des participants';

  @override
  String get loginRequired => 'Connexion requise';

  @override
  String get inviteSendFailed =>
      'Échec de l\'envoi de l\'invitation. Veuillez réessayer.';

  @override
  String get newInviteLinkGenerated => 'Nouveau lien d\'invitation généré';

  @override
  String get inviteLinkCopied => 'Lien d\'invitation copié';

  @override
  String get userNotFound => 'Utilisateur non trouvé';

  @override
  String get noDestination => 'Pas de destination';

  @override
  String get loginTitle => 'Bienvenue';

  @override
  String get loginSubtitle => 'Connectez-vous pour commencer votre voyage';

  @override
  String get continueWithKakao => 'Continuer avec Kakao';

  @override
  String get continueWithNaver => 'Continuer avec Naver';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get account => 'Compte';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String get deleteAccountTitle => 'Supprimer le compte ?';

  @override
  String get deleteAccountMessage =>
      'Cette action est irréversible. Toutes vos données, y compris les voyages, messages et informations de profil, seront définitivement supprimées.';

  @override
  String get deleteAccountConfirmation => 'Tapez DELETE pour confirmer';

  @override
  String get deletingAccount => 'Suppression du compte...';

  @override
  String get accountDeleted => 'Compte supprimé avec succès';

  @override
  String get deleteAccountFailed => 'Échec de la suppression du compte';

  @override
  String get deleteAccountWarning =>
      'Avertissement : Cela supprimera définitivement votre compte et toutes les données associées.';

  @override
  String get reportMessage => 'Signaler le message';

  @override
  String get reportMessageDescription =>
      'Signaler un contenu inapproprié à l\'organisateur du voyage';

  @override
  String get blockUser => 'Bloquer l\'utilisateur';

  @override
  String get blockUserDescription =>
      'Vous ne verrez plus les messages de cet utilisateur';

  @override
  String get selectReportReason => 'Sélectionnez une raison pour signaler :';

  @override
  String get additionalDetails => 'Détails supplémentaires';

  @override
  String get optionalDescription => 'Décrivez le problème (facultatif)';

  @override
  String get report => 'Signaler';

  @override
  String get block => 'Bloquer';

  @override
  String get reportTypeSpam => 'Spam';

  @override
  String get reportTypeHarassment => 'Harcèlement';

  @override
  String get reportTypeInappropriate => 'Contenu inapproprié';

  @override
  String get reportTypeHateSpeech => 'Discours haineux';

  @override
  String get reportTypeViolence => 'Violence';

  @override
  String get reportTypeOther => 'Autre';

  @override
  String get reportSubmitted =>
      'Signalement envoyé. L\'organisateur du voyage sera notifié.';

  @override
  String get reportFailed =>
      'Échec de l\'envoi du signalement. Veuillez réessayer.';

  @override
  String blockUserConfirmation(String userName) {
    return 'Êtes-vous sûr de vouloir bloquer $userName ? Vous ne verrez plus ses messages.';
  }

  @override
  String userBlocked(String userName) {
    return '$userName a été bloqué';
  }

  @override
  String get blockFailed =>
      'Échec du blocage de l\'utilisateur. Veuillez réessayer.';

  @override
  String get blockedUsers => 'Utilisateurs bloqués';

  @override
  String get noBlockedUsers => 'Aucun utilisateur bloqué';

  @override
  String get unblock => 'Débloquer';

  @override
  String userUnblocked(String userName) {
    return '$userName a été débloqué';
  }

  @override
  String get reportUser => 'Signaler l\'utilisateur';

  @override
  String get reportUserDescription =>
      'Signaler cet utilisateur à l\'organisateur du voyage';

  @override
  String get locationPermissionDenied => 'Autorisation de localisation refusee';

  @override
  String get locationPermissionDeniedForever =>
      'Autorisation de localisation refusee definitivement. Veuillez l\'activer dans les parametres.';

  @override
  String get locationServicesDisabled => 'Services de localisation desactives';

  @override
  String get gettingLocation => 'Obtention de la position...';

  @override
  String get currentLocation => 'Position actuelle';

  @override
  String get shareLocation => 'Partager la position';

  @override
  String get shareLocationConfirmation =>
      'Voulez-vous partager cette position dans le chat?';

  @override
  String get share => 'Partager';

  @override
  String get uploadFailed => 'Echec du telechargement';

  @override
  String get openInGoogleMaps => 'Ouvrir dans Google Maps';

  @override
  String get getDirections => 'Obtenir l\'itineraire';

  @override
  String get drivingDirections => 'Itineraire en voiture';

  @override
  String get walkingDirections => 'Itineraire a pied';

  @override
  String get transitDirections => 'Itineraire en transports en commun';

  @override
  String get noPinnedMessages => 'Aucun message epingle';

  @override
  String get noItineraryYet => 'Pas encore d\'itineraire';

  @override
  String get viewFullItinerary => 'Voir l\'itineraire complet';

  @override
  String get inviteParticipant => 'Inviter un participant';

  @override
  String get emailAddress => 'Adresse e-mail';

  @override
  String get enterEmailAddress => 'Entrez l\'adresse e-mail';

  @override
  String get invalidEmail => 'Adresse e-mail invalide';

  @override
  String get role => 'Role';

  @override
  String get permissions => 'Autorisations';

  @override
  String get sendInvite => 'Envoyer l\'invitation';

  @override
  String get inviteSent => 'Invitation envoyee';

  @override
  String get editItinerary => 'Modifier l\'itineraire';

  @override
  String get deleteItinerary => 'Supprimer l\'itineraire';

  @override
  String get deleteItineraryConfirm =>
      'Etes-vous sur de vouloir supprimer cet itineraire?';

  @override
  String get itineraryDeleted => 'Itineraire supprime';

  @override
  String get searchPlaces => 'Rechercher des lieux';

  @override
  String get selectLocation => 'Selectionner un emplacement';

  @override
  String get confirmLocation => 'Confirmer l\'emplacement';

  @override
  String get hotelName => 'Nom de l\'hotel';

  @override
  String get roomType => 'Type de chambre';

  @override
  String get checkInTime => 'Heure d\'arrivee';

  @override
  String get checkOutTime => 'Heure de depart';

  @override
  String get carCompany => 'Societe de location';

  @override
  String get carModel => 'Modele de voiture';

  @override
  String get pickupLocation => 'Lieu de prise en charge';

  @override
  String get dropoffLocation => 'Lieu de restitution';

  @override
  String get pickupTime => 'Heure de prise en charge';

  @override
  String get dropoffTime => 'Heure de restitution';

  @override
  String get restaurantName => 'Nom du restaurant';

  @override
  String get cuisine => 'Cuisine';

  @override
  String get priceRange => 'Gamme de prix';

  @override
  String get reservationTime => 'Heure de reservation';

  @override
  String get departureAirport => 'Aeroport de depart';

  @override
  String get arrivalAirport => 'Aeroport d\'arrivee';

  @override
  String get departureTime => 'Heure de depart';

  @override
  String get arrivalTime => 'Heure d\'arrivee';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Porte';

  @override
  String get confirmationNumber => 'Numero de confirmation';

  @override
  String get other => 'Autre';

  @override
  String get title => 'Titre';

  @override
  String get description => 'Description';

  @override
  String get itemNotFound => 'Element non trouve';

  @override
  String get selectDay => 'Selectionner le jour';

  @override
  String get selectAirline => 'Selectionner la compagnie aerienne';

  @override
  String get enterNotesHint => 'Entrez des notes supplementaires';

  @override
  String get enterHotelName => 'Entrez le nom de l\'hotel';

  @override
  String get enterRoomType => 'Ex: Suite Deluxe';

  @override
  String get enterAddress => 'Entrez l\'adresse';

  @override
  String get enterConfirmationNumber => 'Entrez le numero de confirmation';

  @override
  String get selectCarCompany => 'Selectionner la societe de location';

  @override
  String get enterCarModel => 'Ex: Toyota Corolla';

  @override
  String get enterPickupLocation => 'Entrez le lieu de prise en charge';

  @override
  String get enterDropoffLocation => 'Entrez le lieu de restitution';

  @override
  String get pickupInfo => 'Informations de prise en charge';

  @override
  String get dropoffInfo => 'Informations de restitution';

  @override
  String get enterRestaurantName => 'Entrez le nom du restaurant';

  @override
  String get cuisineType => 'Type de cuisine';

  @override
  String get selectCuisineType => 'Selectionner le type de cuisine';

  @override
  String get reservationInfo => 'Informations de reservation';

  @override
  String get enterTitle => 'Entrez le titre';

  @override
  String get enterDescription => 'Entrez la description';

  @override
  String get enterLocation => 'Entrez l\'emplacement';

  @override
  String get startTime => 'Heure de debut';

  @override
  String get endTime => 'Heure de fin';

  @override
  String get addAttachments => 'Ajouter des pieces jointes';

  @override
  String get attachmentHint =>
      'Billet electronique, confirmation de reservation, etc.';

  @override
  String get itemUpdatedSuccess => 'Element mis a jour avec succes';

  @override
  String get itemDeletedSuccess => 'Element supprime avec succes';
}
