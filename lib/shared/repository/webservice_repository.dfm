object webservice_repository_dm: Twebservice_repository_dm
  OldCreateOrder = False
  OnCreate = ServerMethodDataModuleCreate
  Encoding = esUtf8
  Height = 196
  Width = 82
  object Eventos: TDWServerEvents
    IgnoreInvalidParams = True
    Events = <
      item
        Routes = [crGet]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovString
            ParamName = 'response'
            Encoded = True
          end>
        JsonMode = jmPureJSON
        Name = 'usuarios'
        OnReplyEventByType = EventosEventsusuariosReplyEventByType
      end
      item
        Routes = [crGet]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'comandas'
        OnReplyEventByType = EventosEventscomandasReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'comanda'
        OnReplyEventByType = EventosEventscomandaReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'setores'
        OnReplyEventByType = EventosEventssetoresReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'secoes'
        OnReplyEventByType = EventosEventssecoesReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'produtos'
        OnReplyEventByType = EventosEventsprodutosReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'conferenciaDetalhada'
        OnReplyEventByType = EventosEventsconferenciaDetalhadaReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'conferenciaResumida'
        OnReplyEventByType = EventosEventsconferenciaResumidaReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'itensComanda'
        OnReplyEventByType = EventosEventsitensComandaReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'adicionais'
        OnReplyEventByType = EventosEventsadicionaisReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'imprimeComanda'
        OnReplyEventByType = EventosEventsimprimeComandaReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'consultaComanda'
        OnReplyEventByType = EventosEventsconsultaComandaReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'transfereItem'
        OnReplyEventByType = EventosEventstransfereItemReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'produto'
        OnReplyEventByType = EventosEventsprodutoReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'itensTransferencia'
        OnReplyEventByType = EventosEventsitensTransferenciaReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'quantidade_comandas'
        OnReplyEventByType = EventosEventsquantidade_comandasReplyEventByType
      end
      item
        Routes = [crAll]
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'buscaComanda'
        OnReplyEventByType = EventosEventsbuscaComandaReplyEventByType
      end>
    Left = 28
    Top = 10
  end
  object Service: TRESTServicePooler
    Active = False
    CORS = False
    CORS_CustomHeaders.Strings = (
      'Access-Control-Allow-Origin: *'
      
        'Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPT' +
        'IONS'
      
        'Access-Control-Allow-Headers: Content-Type, Origin, Accept, Auth' +
        'orization, X-CUSTOM-HEADER')
    RequestTimeout = -1
    ServicePort = 8082
    ProxyOptions.Port = 8888
    TokenOptions.Active = False
    TokenOptions.ServerRequest = 'RESTDWServer01'
    TokenOptions.TokenHash = 'RDWTS_HASH'
    TokenOptions.LifeCycle = 30
    ServerParams.HasAuthentication = False
    ServerParams.UserName = 'testserver'
    ServerParams.Password = 'testserver'
    SSLMethod = sslvSSLv2
    SSLVersions = []
    Encoding = esANSI
    ServerContext = 'restdataware'
    RootPath = '/'
    SSLVerifyMode = []
    SSLVerifyDepth = 0
    ForceWelcomeAccess = False
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    MultiCORE = False
    Left = 26
    Top = 57
  end
end
