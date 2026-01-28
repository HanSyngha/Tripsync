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
  String get noMapLocations => 'No locations to display on map';

  @override
  String get noMapLocationsHint => 'Add locations to your itinerary to see them on the map';

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
  String get discardTrip => 'Descartar viagem?';

  @override
  String get discardTripMessage =>
      'Tem certeza de que deseja descartar esta viagem? Todas as alteracoes serao perdidas.';

  @override
  String get discardChanges => 'Descartar alteracoes?';

  @override
  String get discardChangesMessage =>
      'Tem certeza de que deseja descartar suas alteracoes?';

  @override
  String get keepEditing => 'Continuar editando';

  @override
  String get discard => 'Descartar';

  @override
  String get tripCreatedSuccess => 'Viagem criada com sucesso!';

  @override
  String get tripUpdatedSuccess => 'Viagem atualizada com sucesso!';

  @override
  String get tripNotFound => 'Viagem nao encontrada';

  @override
  String get itinerarySaved => 'Roteiro salvo';

  @override
  String get comingSoon => 'Em breve';

  @override
  String get signOut => 'Sair';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get viewParticipants => 'Ver participantes';

  @override
  String get pinnedMessages => 'Mensagens fixadas';

  @override
  String get searchMessages => 'Buscar mensagens';

  @override
  String get sendAnnouncement => 'Enviar comunicado';

  @override
  String get photo => 'Foto';

  @override
  String get camera => 'Camera';

  @override
  String get sharePhotosFromGallery => 'Compartilhar fotos da galeria';

  @override
  String get takeNewPhoto => 'Tirar nova foto';

  @override
  String get shareCurrentLocation => 'Compartilhar localizacao atual';

  @override
  String get featureComingSoon => 'Funcionalidade em breve!';

  @override
  String get activityAddedSuccess => 'Atividade adicionada com sucesso';

  @override
  String get filePickerComingSoon => 'Seletor de arquivos em breve';

  @override
  String get pleaseEnterMessage => 'Por favor, insira uma mensagem';

  @override
  String get announcementSentSuccess => 'Comunicado enviado com sucesso!';

  @override
  String get failedToLoadParticipants => 'Falha ao carregar participantes';

  @override
  String get loginRequired => 'Login necessario';

  @override
  String get inviteSendFailed =>
      'Falha ao enviar convite. Por favor, tente novamente.';

  @override
  String get newInviteLinkGenerated => 'Novo link de convite gerado';

  @override
  String get inviteLinkCopied => 'Link de convite copiado';

  @override
  String get userNotFound => 'Usuario nao encontrado';

  @override
  String get noDestination => 'Sem destino';

  @override
  String get loginTitle => 'Bem-vindo';

  @override
  String get loginSubtitle => 'Entre para comecar sua jornada';

  @override
  String get continueWithKakao => 'Continuar com Kakao';

  @override
  String get continueWithNaver => 'Continuar com Naver';

  @override
  String get continueWithGoogle => 'Continuar com Google';

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

  @override
  String get reportMessage => 'Denunciar mensagem';

  @override
  String get reportMessageDescription =>
      'Denunciar conteudo inapropriado ao organizador da viagem';

  @override
  String get blockUser => 'Bloquear usuario';

  @override
  String get blockUserDescription =>
      'Voce nao vera mais mensagens deste usuario';

  @override
  String get selectReportReason => 'Selecione um motivo para a denuncia:';

  @override
  String get additionalDetails => 'Detalhes adicionais';

  @override
  String get optionalDescription => 'Descreva o problema (opcional)';

  @override
  String get report => 'Denunciar';

  @override
  String get block => 'Bloquear';

  @override
  String get reportTypeSpam => 'Spam';

  @override
  String get reportTypeHarassment => 'Assedio';

  @override
  String get reportTypeInappropriate => 'Conteudo inapropriado';

  @override
  String get reportTypeHateSpeech => 'Discurso de odio';

  @override
  String get reportTypeViolence => 'Violencia';

  @override
  String get reportTypeOther => 'Outro';

  @override
  String get reportSubmitted =>
      'Denuncia enviada. O organizador da viagem sera notificado.';

  @override
  String get reportFailed =>
      'Falha ao enviar denuncia. Por favor, tente novamente.';

  @override
  String blockUserConfirmation(String userName) {
    return 'Tem certeza de que deseja bloquear $userName? Voce nao vera mais as mensagens dessa pessoa.';
  }

  @override
  String userBlocked(String userName) {
    return '$userName foi bloqueado';
  }

  @override
  String get blockFailed =>
      'Falha ao bloquear usuario. Por favor, tente novamente.';

  @override
  String get blockedUsers => 'Usuarios bloqueados';

  @override
  String get noBlockedUsers => 'Nenhum usuario bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String userUnblocked(String userName) {
    return '$userName foi desbloqueado';
  }

  @override
  String get reportUser => 'Denunciar usuario';

  @override
  String get reportUserDescription =>
      'Denunciar este usuario ao organizador da viagem';

  @override
  String get locationPermissionDenied => 'Permissao de localizacao negada';

  @override
  String get locationPermissionDeniedForever =>
      'Permissao de localizacao negada permanentemente. Por favor, ative nas configuracoes.';

  @override
  String get locationServicesDisabled => 'Servicos de localizacao desativados';

  @override
  String get gettingLocation => 'Obtendo localizacao...';

  @override
  String get currentLocation => 'Localizacao atual';

  @override
  String get shareLocation => 'Compartilhar localizacao';

  @override
  String get shareLocationConfirmation =>
      'Deseja compartilhar esta localizacao no chat?';

  @override
  String get share => 'Compartilhar';

  @override
  String get uploadFailed => 'Falha no upload';

  @override
  String get openInGoogleMaps => 'Abrir no Google Maps';

  @override
  String get getDirections => 'Obter direcoes';

  @override
  String get drivingDirections => 'Direcoes de carro';

  @override
  String get walkingDirections => 'Direcoes a pe';

  @override
  String get transitDirections => 'Direcoes de transporte publico';

  @override
  String get noPinnedMessages => 'Nenhuma mensagem fixada';

  @override
  String get noItineraryYet => 'Nenhum roteiro ainda';

  @override
  String get viewFullItinerary => 'Ver roteiro completo';

  @override
  String get inviteParticipant => 'Convidar participante';

  @override
  String get emailAddress => 'Endereco de e-mail';

  @override
  String get enterEmailAddress => 'Digite o endereco de e-mail';

  @override
  String get invalidEmail => 'E-mail invalido';

  @override
  String get role => 'Funcao';

  @override
  String get permissions => 'Permissoes';

  @override
  String get sendInvite => 'Enviar convite';

  @override
  String get inviteSent => 'Convite enviado';

  @override
  String get editItinerary => 'Editar roteiro';

  @override
  String get deleteItinerary => 'Excluir roteiro';

  @override
  String get deleteItineraryConfirm =>
      'Tem certeza de que deseja excluir este roteiro?';

  @override
  String get itineraryDeleted => 'Roteiro excluido';

  @override
  String get searchPlaces => 'Buscar lugares';

  @override
  String get selectLocation => 'Selecionar localizacao';

  @override
  String get confirmLocation => 'Confirmar localizacao';

  @override
  String get hotelName => 'Nome do hotel';

  @override
  String get roomType => 'Tipo de quarto';

  @override
  String get checkInTime => 'Horario de check-in';

  @override
  String get checkOutTime => 'Horario de check-out';

  @override
  String get carCompany => 'Locadora de veiculos';

  @override
  String get carModel => 'Modelo do carro';

  @override
  String get pickupLocation => 'Local de retirada';

  @override
  String get dropoffLocation => 'Local de devolucao';

  @override
  String get pickupTime => 'Horario de retirada';

  @override
  String get dropoffTime => 'Horario de devolucao';

  @override
  String get restaurantName => 'Nome do restaurante';

  @override
  String get cuisine => 'Culinaria';

  @override
  String get priceRange => 'Faixa de preco';

  @override
  String get reservationTime => 'Horario da reserva';

  @override
  String get departureAirport => 'Aeroporto de partida';

  @override
  String get arrivalAirport => 'Aeroporto de chegada';

  @override
  String get departureTime => 'Horario de partida';

  @override
  String get arrivalTime => 'Horario de chegada';

  @override
  String get terminal => 'Terminal';

  @override
  String get gate => 'Portao';

  @override
  String get confirmationNumber => 'Numero de confirmacao';

  @override
  String get other => 'Outro';

  @override
  String get title => 'Titulo';

  @override
  String get description => 'Descricao';

  @override
  String get itemNotFound => 'Item nao encontrado';

  @override
  String get selectDay => 'Selecionar dia';

  @override
  String get selectAirline => 'Selecionar companhia aerea';

  @override
  String get enterNotesHint => 'Digite notas adicionais';

  @override
  String get enterHotelName => 'Digite o nome do hotel';

  @override
  String get enterRoomType => 'Ex: Suite Deluxe';

  @override
  String get enterAddress => 'Digite o endereco';

  @override
  String get enterConfirmationNumber => 'Digite o numero de confirmacao';

  @override
  String get selectCarCompany => 'Selecionar locadora';

  @override
  String get enterCarModel => 'Ex: Toyota Corolla';

  @override
  String get enterPickupLocation => 'Digite o local de retirada';

  @override
  String get enterDropoffLocation => 'Digite o local de devolucao';

  @override
  String get pickupInfo => 'Informacoes de retirada';

  @override
  String get dropoffInfo => 'Informacoes de devolucao';

  @override
  String get enterRestaurantName => 'Digite o nome do restaurante';

  @override
  String get cuisineType => 'Tipo de cozinha';

  @override
  String get selectCuisineType => 'Selecionar tipo de cozinha';

  @override
  String get reservationInfo => 'Informacoes de reserva';

  @override
  String get enterTitle => 'Digite o titulo';

  @override
  String get enterDescription => 'Digite a descricao';

  @override
  String get enterLocation => 'Digite o local';

  @override
  String get startTime => 'Hora de inicio';

  @override
  String get endTime => 'Hora de termino';

  @override
  String get addAttachments => 'Adicionar anexos';

  @override
  String get attachmentHint => 'E-ticket, confirmacao de reserva, etc.';

  @override
  String get itemUpdatedSuccess => 'Item atualizado com sucesso';

  @override
  String get itemDeletedSuccess => 'Item excluido com sucesso';
}
