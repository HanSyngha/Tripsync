// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'TripSync';

  @override
  String get welcomeTitle => 'Comece Sua Jornada';

  @override
  String get welcomeSubtitle =>
      'Descubra novas experiencias e crie memorias especiais';

  @override
  String get skip => 'Pular';

  @override
  String get participant => 'Participante';

  @override
  String get host => 'Anfitriao';

  @override
  String get coHost => 'Co-Anfitriao';

  @override
  String get signInWithKakao => 'Continuar com Kakao';

  @override
  String get signInWithNaver => 'Continuar com Naver';

  @override
  String get signInWithGoogle => 'Continuar com Google';

  @override
  String get signInWithApple => 'Continuar com Apple';

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Ao fazer login, voce concorda com nossos $terms e $privacy.';
  }

  @override
  String get termsOfService => 'Termos de Servico';

  @override
  String get privacyPolicy => 'Politica de Privacidade';

  @override
  String get welcomeBack => 'Bem-vindo de volta';

  @override
  String get readyForNextJourney => 'Pronto para sua proxima jornada?';

  @override
  String get allTrips => 'Todas as Viagens';

  @override
  String get hosting => 'Organizando';

  @override
  String get participating => 'Participando';

  @override
  String get happeningNow => 'Acontecendo Agora';

  @override
  String get upcomingAdventures => 'Proximas Aventuras';

  @override
  String get viewAll => 'Ver tudo';

  @override
  String dayOf(int current, int total) {
    return 'Dia $current de $total';
  }

  @override
  String get inProgress => 'Em Andamento';

  @override
  String get manage => 'Gerenciar';

  @override
  String get guest => 'Convidado';

  @override
  String get tbd => 'A definir';

  @override
  String get home => 'Inicio';

  @override
  String get explore => 'Explorar';

  @override
  String get chat => 'Chat';

  @override
  String get profile => 'Perfil';

  @override
  String get createTrip => 'Criar Viagem';

  @override
  String get letsplanYourJourney => 'Vamos planejar sua jornada';

  @override
  String get hostCanEditLater =>
      'Como anfitriao, voce pode editar esses detalhes depois a qualquer momento.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get basicInfo => 'Informacoes Basicas';

  @override
  String get required => 'Obrigatorio';

  @override
  String get tripName => 'Nome da Viagem';

  @override
  String get tripNameHint => 'ex. Verao em Kyoto';

  @override
  String get destination => 'Destino';

  @override
  String get destinationHint => 'Para onde voce vai?';

  @override
  String get dates => 'Datas';

  @override
  String get startDate => 'Data de Inicio';

  @override
  String get endDate => 'Data de Termino';

  @override
  String get optionalDetails => 'Detalhes Opcionais';

  @override
  String get coverPhoto => 'Foto de Capa';

  @override
  String get tapToUploadCover => 'Toque para enviar capa';

  @override
  String get tripGoalMemo => 'Objetivo / Notas da Viagem';

  @override
  String get tripGoalHint => 'Qual e o principal objetivo desta viagem?';

  @override
  String get nextStep => 'Proximo Passo';

  @override
  String get participantManagement => 'Gerenciamento de Participantes';

  @override
  String get participating_count => 'Participando';

  @override
  String get pendingInvites => 'Convites Pendentes';

  @override
  String get inviteNewMember => 'Convidar Novo Membro';

  @override
  String get searchByNameOrEmail => 'Buscar por nome ou email';

  @override
  String get hosts => 'Anfitrioes';

  @override
  String get admin => 'ADMIN';

  @override
  String get travelers => 'Viajantes';

  @override
  String get allPermissions => 'Todas as permissoes';

  @override
  String get canEditSchedule => 'Pode editar agenda';

  @override
  String get readOnly => 'Somente leitura';

  @override
  String get pendingAcceptance => 'Aguardando aceitacao';

  @override
  String get resend => 'Reenviar';

  @override
  String get inviteLinkActivated => 'Link de convite ativado';

  @override
  String get copy => 'Copiar';

  @override
  String get allowScheduleEdit => 'Permitir edicao da agenda';

  @override
  String get allowPhotoUpload => 'Permitir envio de fotos';

  @override
  String get removeFromTrip => 'Remover da viagem';

  @override
  String joinedDaysAgo(int days) {
    return 'Entrou ha $days dias';
  }

  @override
  String get itinerary => 'Roteiro';

  @override
  String get organizerView => 'Visao do Organizador';

  @override
  String get draft => 'Rascunho';

  @override
  String days(int count) {
    return '$count Dias';
  }

  @override
  String day(int number) {
    return 'Dia $number';
  }

  @override
  String get addActivity => 'Adicionar Atividade';

  @override
  String get schedule => 'Agenda';

  @override
  String get map => 'Mapa';

  @override
  String get people => 'Pessoas';

  @override
  String get settings => 'Configuracoes';

  @override
  String get flight => 'Voo';

  @override
  String get accommodation => 'Hospedagem';

  @override
  String get rentalCar => 'Aluguel de Carro';

  @override
  String get restaurant => 'Restaurante';

  @override
  String get attraction => 'Atracao';

  @override
  String get activity => 'Atividade';

  @override
  String get transportation => 'Transporte';

  @override
  String get enterDetails => 'Inserir Detalhes';

  @override
  String get airline => 'Companhia Aerea';

  @override
  String get flightNumber => 'Numero do Voo';

  @override
  String get departure => 'Partida';

  @override
  String get arrival => 'Chegada';

  @override
  String get notes => 'Notas';

  @override
  String get notesHint => 'Escreva notas importantes aqui...';

  @override
  String get addAttachment => 'Adicionar Anexo';

  @override
  String get eTicketOrVoucher => 'E-ticket ou voucher (PDF, JPG)';

  @override
  String get reminderSettings => 'Configuracoes de Lembrete';

  @override
  String get reservationConfirmed => 'Reserva Confirmada';

  @override
  String chatTitle(String tripName) {
    return '$tripName';
  }

  @override
  String guideAndMembers(int guides, int members) {
    return '$guides Guia - $members Membros';
  }

  @override
  String get guide => 'GUIA';

  @override
  String get organizer => 'ORGANIZADOR';

  @override
  String get messagePlaceholder => 'Mensagem...';

  @override
  String get openMap => 'Abrir Mapa';

  @override
  String get newAnnouncement => 'Novo Comunicado';

  @override
  String get toWhom => 'Para quem?';

  @override
  String get allParticipants => 'Todos os Participantes';

  @override
  String get selectSpecific => 'Selecionar Especificos';

  @override
  String othersSelected(int count) {
    return '+ $count outros selecionados';
  }

  @override
  String get messageDetails => 'Detalhes da Mensagem';

  @override
  String get nextSchedule => 'Proxima Agenda';

  @override
  String get urgent => 'Urgente';

  @override
  String get generalInfo => 'Informacoes Gerais';

  @override
  String get poll => 'Enquete';

  @override
  String get quickTemplates => 'Modelos Rapidos';

  @override
  String get templateBusLeaving => 'Onibus saindo em 10';

  @override
  String get templateMeetingPoint => 'Ponto de encontro alterado';

  @override
  String get templateWeather => 'Alerta de clima';

  @override
  String get templateDinner => 'Reservas para jantar';

  @override
  String get subject => 'Assunto';

  @override
  String get subjectHint => 'ex. Encontro no lobby';

  @override
  String get message => 'Mensagem';

  @override
  String get messageHint => 'Escreva seu comunicado aqui...';

  @override
  String get addPhoto => 'Adicionar Foto';

  @override
  String get addLocation => 'Adicionar Localizacao';

  @override
  String get pinToTopOfChat => 'Fixar no topo do chat';

  @override
  String get keepVisibleForAll => 'Manter visivel para todos os participantes';

  @override
  String get sendAsUrgentAlert => 'Enviar como Alerta Urgente';

  @override
  String get notifiesEvenIfMuted => 'Notifica mesmo se silenciado';

  @override
  String get sendNotification => 'Enviar Notificacao';

  @override
  String get notifications => 'Notificacoes';

  @override
  String get markAllAsRead => 'Marcar tudo como lido';

  @override
  String get all => 'Tudo';

  @override
  String get announcements => 'Comunicados';

  @override
  String get today => 'Hoje';

  @override
  String get yesterday => 'Ontem';

  @override
  String get announcement => 'Comunicado';

  @override
  String get pastAnnouncement => 'Comunicado Anterior';

  @override
  String minutesAgo(int minutes) {
    return '$minutes min atras';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours horas atras';
  }

  @override
  String get tripDetails => 'Detalhes da Viagem';

  @override
  String nights(int count) {
    return '$count Noites';
  }

  @override
  String get hostedBy => 'Organizado por';

  @override
  String get mapView => 'Ver Mapa';

  @override
  String get groupChat => 'Chat em Grupo';

  @override
  String get savedDocs => 'Documentos Salvos';

  @override
  String get dontForget => 'Nao esqueca!';

  @override
  String get overview => 'Visao Geral';

  @override
  String get expandAll => 'Expandir Tudo';

  @override
  String get checkIn => 'Check-in';

  @override
  String get checkOut => 'Check-out';

  @override
  String get directions => 'Direcoes';

  @override
  String get reservation => 'Reserva';

  @override
  String get currentStatus => 'Status Atual';

  @override
  String tripStartsIn(int days) {
    return 'A viagem comeca em $days dias';
  }

  @override
  String get accountAndPermissions => 'Conta e Permissoes';

  @override
  String get profileVisibility => 'Visibilidade do Perfil';

  @override
  String get displaySettings => 'Configuracoes de Exibicao';

  @override
  String get darkMode => 'Modo Escuro';

  @override
  String get fontSize => 'Tamanho da Fonte';

  @override
  String get standard => 'Padrao';

  @override
  String get notificationSettings => 'Notificacoes';

  @override
  String get tripScheduleNotifications => 'Notificacoes de agenda da viagem';

  @override
  String get importantChangesPush =>
      'Notificacoes push de alteracoes importantes';

  @override
  String get newMessageNotifications => 'Notificacoes de novas mensagens';

  @override
  String get helpAndSupport => 'Ajuda e Suporte';

  @override
  String get appVersion => 'Versao do App';

  @override
  String get logout => 'Sair';

  @override
  String get permissionRequired => 'Permissao Necessaria';

  @override
  String get notificationPermissionMessage =>
      'TripSync precisa de permissao para notificacoes para enviar atualizacoes importantes da viagem e comunicados dos organizadores.';

  @override
  String get allowNotifications => 'Permitir Notificacoes';

  @override
  String get later => 'Depois';

  @override
  String get error => 'Erro';

  @override
  String get tryAgain => 'Tentar Novamente';

  @override
  String get noTripsYet => 'Nenhuma viagem ainda';

  @override
  String get createYourFirstTrip =>
      'Crie sua primeira viagem ou participe de uma!';

  @override
  String get noNotifications => 'Sem notificacoes';

  @override
  String get youreAllCaughtUp => 'Voce esta em dia!';

  @override
  String get loading => 'Carregando...';

  @override
  String get connectionError => 'Erro de conexao';

  @override
  String get checkYourInternet =>
      'Por favor, verifique sua conexao com a internet';

  @override
  String get confirmDelete => 'Confirmar Exclusao';

  @override
  String get deleteConfirmMessage => 'Tem certeza de que deseja excluir isso?';

  @override
  String get delete => 'Excluir';

  @override
  String get confirm => 'Confirmar';

  @override
  String get done => 'Concluido';

  @override
  String get edit => 'Editar';

  @override
  String get close => 'Fechar';

  @override
  String get back => 'Voltar';

  @override
  String get next => 'Proximo';

  @override
  String get search => 'Buscar';

  @override
  String get noResults => 'Nenhum resultado encontrado';

  @override
  String get selectDate => 'Selecionar Data';

  @override
  String get selectTime => 'Selecionar Hora';

  @override
  String get from => 'De';

  @override
  String get to => 'Para';

  @override
  String get duration => 'Duracao';

  @override
  String get location => 'Localizacao';

  @override
  String get address => 'Endereco';

  @override
  String get phone => 'Telefone';

  @override
  String get email => 'Email';

  @override
  String get website => 'Site';

  @override
  String get price => 'Preco';

  @override
  String get viewMenu => 'Ver Cardapio';

  @override
  String get recommended => 'Recomendado';

  @override
  String get hiking => 'Trilha';

  @override
  String get warning => 'Aviso';

  @override
  String get viewDetails => 'Ver Detalhes';

  @override
  String get readyForYour => 'Pronto para sua';

  @override
  String get nextJourney => 'proxima jornada?';

  @override
  String get createFirstTrip => 'Crie sua primeira viagem ou participe de uma!';

  @override
  String get language => 'Idioma';

  @override
  String get changePhoto => 'Alterar foto';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get chooseFromGallery => 'Escolher da galeria';

  @override
  String get removePhoto => 'Remover foto';

  @override
  String get displayName => 'Nome de exibicao';

  @override
  String get enterDisplayName => 'Digite seu nome de exibicao';

  @override
  String get enterPhoneNumber => 'Digite seu numero de telefone';

  @override
  String get displayNameRequired => 'Nome de exibicao e obrigatorio';

  @override
  String get displayNameMinLength =>
      'Nome de exibicao deve ter pelo menos 2 caracteres';

  @override
  String get profileUpdated => 'Perfil atualizado com sucesso';

  @override
  String get failedToUpdateProfile => 'Falha ao atualizar perfil';

  @override
  String get failedToPickImage => 'Falha ao selecionar imagem';

  @override
  String get logoutConfirmation => 'Tem certeza de que deseja sair?';

  @override
  String get earlier => 'Anteriores';

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
  String get account => 'Conta';

  @override
  String get deleteAccount => 'Excluir Conta';

  @override
  String get deleteAccountTitle => 'Excluir Conta';

  @override
  String get deleteAccountMessage =>
      'Tem certeza de que deseja excluir sua conta? Esta acao e irreversivel e todos os seus dados serao permanentemente removidos.';

  @override
  String get deleteAccountConfirmation => 'Digite \'EXCLUIR\' para confirmar';

  @override
  String get deletingAccount => 'Excluindo conta...';

  @override
  String get accountDeleted => 'Conta excluida com sucesso';

  @override
  String get deleteAccountFailed => 'Falha ao excluir conta';

  @override
  String get deleteAccountWarning =>
      'Aviso: Esta acao nao pode ser desfeita. Todos os seus dados, incluindo viagens e mensagens, serao permanentemente excluidos.';
}
