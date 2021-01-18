object dashboard_repository_dm: Tdashboard_repository_dm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 191
  Width = 157
  object IdUDPServer: TIdUDPServer
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 8761
    ThreadedEvent = True
    OnUDPRead = IdUDPServerUDPRead
    Left = 89
    Top = 8
  end
  object pmMenu: TPopupMenu
    Left = 26
    Top = 64
    object pmiRestauraApp: TMenuItem
      Caption = 'Restaurar Aplica'#231#227'o'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmiSairAPP: TMenuItem
      Caption = 'Sair da Aplica'#231#227'o'
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 31
    Top = 8
  end
  object TrayIcon: TTrayIcon
    PopupMenu = pmMenu
    Left = 26
    Top = 110
  end
  object Timer: TTimer
    Enabled = False
    Interval = 5000
    Left = 85
    Top = 60
  end
end
