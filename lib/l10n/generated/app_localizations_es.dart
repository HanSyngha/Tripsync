// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Comienza tu viaje';

  @override
  String get welcomeSubtitle =>
      'Descubre nuevas experiencias y crea recuerdos especiales';

  @override
  String get skip => 'Omitir';

  @override
  String get participant => 'Participante';

  @override
  String get host => 'Organizador';

  @override
  String get coHost => 'Co-organizador';

  @override
  String get signInWithKakao => 'Continuar con Kakao';

  @override
  String get signInWithNaver => 'Continuar con Naver';

  @override
  String get signInWithGoogle => 'Continuar con Google';

  @override
  String get signInWithApple => 'Continuar con Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Al iniciar sesion, aceptas nuestros $terms y $privacy.';
  }

  @override
  String get termsOfService => 'Terminos de servicio';

  @override
  String get privacyPolicy => 'Politica de privacidad';

  @override
  String get welcomeBack => 'Bienvenido de nuevo';

  @override
  String get readyForNextJourney => 'Listo para tu proximo viaje?';

  @override
  String get allTrips => 'Todos los viajes';

  @override
  String get hosting => 'Organizando';

  @override
  String get participating => 'Participando';

  @override
  String get happeningNow => 'En progreso';

  @override
  String get upcomingAdventures => 'Proximas aventuras';

  @override
  String get viewAll => 'Ver todo';

  @override
  String dayOf(int current, int total) {
    return 'Dia $current de $total';
  }

  @override
  String get inProgress => 'En progreso';

  @override
  String get manage => 'Gestionar';

  @override
  String get guest => 'Invitado';

  @override
  String get tbd => 'Por definir';

  @override
  String get home => 'Inicio';

  @override
  String get explore => 'Explorar';

  @override
  String get chat => 'Chat';

  @override
  String get profile => 'Perfil';

  @override
  String get createTrip => 'Crear viaje';

  @override
  String get letsplanYourJourney => 'Planifiquemos tu viaje';

  @override
  String get hostCanEditLater =>
      'Como organizador, puedes editar estos detalles mas tarde.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get basicInfo => 'Informacion basica';

  @override
  String get required => 'Obligatorio';

  @override
  String get tripName => 'Nombre del viaje';

  @override
  String get tripNameHint => 'Ej: Verano en Kioto';

  @override
  String get destination => 'Destino';

  @override
  String get destinationHint => 'Adonde vas?';

  @override
  String get dates => 'Fechas';

  @override
  String get startDate => 'Fecha de inicio';

  @override
  String get endDate => 'Fecha de fin';

  @override
  String get optionalDetails => 'Detalles opcionales';

  @override
  String get coverPhoto => 'Foto de portada';

  @override
  String get tapToUploadCover => 'Toca para subir portada';

  @override
  String get tripGoalMemo => 'Objetivo del viaje / Notas';

  @override
  String get tripGoalHint => 'Cual es el objetivo principal de este viaje?';

  @override
  String get nextStep => 'Siguiente paso';

  @override
  String get participantManagement => 'Gestion de participantes';

  @override
  String get participating_count => 'Participando';

  @override
  String get pendingInvites => 'Invitaciones pendientes';

  @override
  String get inviteNewMember => 'Invitar nuevo miembro';

  @override
  String get searchByNameOrEmail => 'Buscar por nombre o email';

  @override
  String get hosts => 'Organizadores';

  @override
  String get admin => 'ADMIN';

  @override
  String get travelers => 'Viajeros';

  @override
  String get allPermissions => 'Todos los permisos';

  @override
  String get canEditSchedule => 'Puede editar horario';

  @override
  String get readOnly => 'Solo lectura';

  @override
  String get pendingAcceptance => 'Pendiente de aceptacion';

  @override
  String get resend => 'Reenviar';

  @override
  String get inviteLinkActivated => 'Enlace de invitacion activado';

  @override
  String get copy => 'Copiar';

  @override
  String get allowScheduleEdit => 'Permitir editar horario';

  @override
  String get allowPhotoUpload => 'Permitir subir fotos';

  @override
  String get removeFromTrip => 'Eliminar del viaje';

  @override
  String joinedDaysAgo(int days) {
    return 'Se unio hace $days dias';
  }

  @override
  String get itinerary => 'Itinerario';

  @override
  String get organizerView => 'Vista de organizador';

  @override
  String get draft => 'Borrador';

  @override
  String days(int count) {
    return '$count dias';
  }

  @override
  String day(int number) {
    return 'Dia $number';
  }

  @override
  String get addActivity => 'Agregar actividad';

  @override
  String get schedule => 'Horario';

  @override
  String get map => 'Mapa';

  @override
  String get people => 'Personas';

  @override
  String get settings => 'Configuracion';

  @override
  String get flight => 'Vuelo';

  @override
  String get accommodation => 'Alojamiento';

  @override
  String get rentalCar => 'Auto de alquiler';

  @override
  String get restaurant => 'Restaurante';

  @override
  String get attraction => 'Atraccion';

  @override
  String get activity => 'Actividad';

  @override
  String get transportation => 'Transporte';

  @override
  String get enterDetails => 'Ingresar detalles';

  @override
  String get airline => 'Aerolinea';

  @override
  String get flightNumber => 'Numero de vuelo';

  @override
  String get departure => 'Salida';

  @override
  String get arrival => 'Llegada';

  @override
  String get notes => 'Notas';

  @override
  String get notesHint => 'Escribe notas importantes aqui...';

  @override
  String get addAttachment => 'Agregar archivo adjunto';

  @override
  String get eTicketOrVoucher => 'E-ticket o voucher (PDF, JPG)';

  @override
  String get reminderSettings => 'Configuracion de recordatorios';

  @override
  String get reservationConfirmed => 'Reserva confirmada';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides guia - $members miembros';
  }

  @override
  String get guide => 'GUIA';

  @override
  String get organizer => 'ORGANIZADOR';

  @override
  String get messagePlaceholder => 'Mensaje...';

  @override
  String get openMap => 'Abrir mapa';

  @override
  String get newAnnouncement => 'Nuevo anuncio';

  @override
  String get toWhom => 'Para quien?';

  @override
  String get allParticipants => 'Todos los participantes';

  @override
  String get selectSpecific => 'Seleccionar especificos';

  @override
  String othersSelected(int count) {
    return '+ $count otros seleccionados';
  }

  @override
  String get messageDetails => 'Detalles del mensaje';

  @override
  String get nextSchedule => 'Proximo horario';

  @override
  String get urgent => 'Urgente';

  @override
  String get generalInfo => 'Informacion general';

  @override
  String get poll => 'Encuesta';

  @override
  String get quickTemplates => 'Plantillas rapidas';

  @override
  String get templateBusLeaving => 'Bus sale en 10';

  @override
  String get templateMeetingPoint => 'Punto de encuentro cambiado';

  @override
  String get templateWeather => 'Alerta del clima';

  @override
  String get templateDinner => 'Reservas de cena';

  @override
  String get subject => 'Asunto';

  @override
  String get subjectHint => 'Ej: Reunion en el lobby';

  @override
  String get message => 'Mensaje';

  @override
  String get messageHint => 'Escribe tu anuncio aqui...';

  @override
  String get addPhoto => 'Agregar foto';

  @override
  String get addLocation => 'Agregar ubicacion';

  @override
  String get pinToTopOfChat => 'Fijar en la parte superior';

  @override
  String get keepVisibleForAll => 'Mantener visible para todos';

  @override
  String get sendAsUrgentAlert => 'Enviar como alerta urgente';

  @override
  String get notifiesEvenIfMuted => 'Notifica aunque este silenciado';

  @override
  String get sendNotification => 'Enviar notificacion';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get markAllAsRead => 'Marcar todo como leido';

  @override
  String get all => 'Todo';

  @override
  String get announcements => 'Anuncios';

  @override
  String get today => 'Hoy';

  @override
  String get yesterday => 'Ayer';

  @override
  String get announcement => 'Anuncio';

  @override
  String get pastAnnouncement => 'Anuncio anterior';

  @override
  String minutesAgo(int minutes) {
    return 'Hace $minutes min';
  }

  @override
  String hoursAgo(int hours) {
    return 'Hace $hours horas';
  }

  @override
  String get tripDetails => 'Detalles del viaje';

  @override
  String nights(int count) {
    return '$count noches';
  }

  @override
  String get hostedBy => 'Organizado por';

  @override
  String get mapView => 'Vista de mapa';

  @override
  String get groupChat => 'Chat grupal';

  @override
  String get savedDocs => 'Documentos guardados';

  @override
  String get dontForget => 'No olvides!';

  @override
  String get overview => 'Resumen';

  @override
  String get expandAll => 'Expandir todo';

  @override
  String get checkIn => 'Check-in';

  @override
  String get checkOut => 'Check-out';

  @override
  String get directions => 'Direcciones';

  @override
  String get reservation => 'Reserva';

  @override
  String get currentStatus => 'Estado actual';

  @override
  String tripStartsIn(int days) {
    return 'El viaje comienza en $days dias';
  }

  @override
  String get accountAndPermissions => 'Cuenta y permisos';

  @override
  String get profileVisibility => 'Visibilidad del perfil';

  @override
  String get displaySettings => 'Configuracion de pantalla';

  @override
  String get darkMode => 'Modo oscuro';

  @override
  String get fontSize => 'Tamano de fuente';

  @override
  String get standard => 'Estandar';

  @override
  String get notificationSettings => 'Notificaciones';

  @override
  String get tripScheduleNotifications => 'Notificaciones de itinerario';

  @override
  String get importantChangesPush =>
      'Notificaciones push de cambios importantes';

  @override
  String get newMessageNotifications => 'Notificaciones de nuevos mensajes';

  @override
  String get helpAndSupport => 'Ayuda y soporte';

  @override
  String get appVersion => 'Version de la app';

  @override
  String get logout => 'Cerrar sesion';

  @override
  String get permissionRequired => 'Permiso requerido';

  @override
  String get notificationPermissionMessage =>
      'TripSync necesita permiso de notificaciones para enviarte actualizaciones importantes y anuncios de los organizadores.';

  @override
  String get allowNotifications => 'Permitir notificaciones';

  @override
  String get later => 'Mas tarde';

  @override
  String get error => 'Error';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get noTripsYet => 'Aun no hay viajes';

  @override
  String get createYourFirstTrip => 'Crea tu primer viaje o unete a uno!';

  @override
  String get noNotifications => 'Sin notificaciones';

  @override
  String get youreAllCaughtUp => 'Estas al dia!';

  @override
  String get loading => 'Cargando...';

  @override
  String get connectionError => 'Error de conexion';

  @override
  String get checkYourInternet => 'Por favor verifica tu conexion a internet';

  @override
  String get confirmDelete => 'Confirmar eliminacion';

  @override
  String get deleteConfirmMessage =>
      'Estas seguro de que quieres eliminar esto?';

  @override
  String get delete => 'Eliminar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get done => 'Hecho';

  @override
  String get edit => 'Editar';

  @override
  String get close => 'Cerrar';

  @override
  String get back => 'Atras';

  @override
  String get next => 'Siguiente';

  @override
  String get search => 'Buscar';

  @override
  String get noResults => 'No se encontraron resultados';

  @override
  String get selectDate => 'Seleccionar fecha';

  @override
  String get selectTime => 'Seleccionar hora';

  @override
  String get from => 'Desde';

  @override
  String get to => 'Hasta';

  @override
  String get duration => 'Duracion';

  @override
  String get location => 'Ubicacion';

  @override
  String get address => 'Direccion';

  @override
  String get phone => 'Telefono';

  @override
  String get email => 'Email';

  @override
  String get website => 'Sitio web';

  @override
  String get price => 'Precio';

  @override
  String get viewMenu => 'Ver menu';

  @override
  String get recommended => 'Recomendado';

  @override
  String get hiking => 'Senderismo';

  @override
  String get warning => 'Advertencia';

  @override
  String get viewDetails => 'Ver detalles';

  @override
  String get readyForYour => 'Listo para tu';

  @override
  String get nextJourney => 'proximo viaje?';

  @override
  String get createFirstTrip => 'Crea tu primer viaje o unete a uno!';

  @override
  String get language => 'Idioma';

  @override
  String get changePhoto => 'Cambiar foto';

  @override
  String get takePhoto => 'Tomar foto';

  @override
  String get chooseFromGallery => 'Elegir de galeria';

  @override
  String get removePhoto => 'Eliminar foto';

  @override
  String get displayName => 'Nombre visible';

  @override
  String get enterDisplayName => 'Ingresa tu nombre visible';

  @override
  String get enterPhoneNumber => 'Ingresa tu numero de telefono';

  @override
  String get displayNameRequired => 'El nombre visible es requerido';

  @override
  String get displayNameMinLength =>
      'El nombre debe tener al menos 2 caracteres';

  @override
  String get profileUpdated => 'Perfil actualizado exitosamente';

  @override
  String get failedToUpdateProfile => 'Error al actualizar perfil';

  @override
  String get failedToPickImage => 'Error al seleccionar imagen';

  @override
  String get logoutConfirmation => 'Estas seguro de que quieres cerrar sesion?';

  @override
  String get earlier => 'Anterior';

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
  String get account => 'Cuenta';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String get deleteAccountTitle => '¿Eliminar cuenta?';

  @override
  String get deleteAccountMessage =>
      'Esta acción no se puede deshacer. Todos tus datos, incluyendo viajes, mensajes e información de perfil, se eliminarán permanentemente.';

  @override
  String get deleteAccountConfirmation => 'Escribe DELETE para confirmar';

  @override
  String get deletingAccount => 'Eliminando cuenta...';

  @override
  String get accountDeleted => 'Cuenta eliminada exitosamente';

  @override
  String get deleteAccountFailed => 'Error al eliminar la cuenta';

  @override
  String get deleteAccountWarning =>
      'Advertencia: Esto eliminará permanentemente tu cuenta y todos los datos asociados.';
}
