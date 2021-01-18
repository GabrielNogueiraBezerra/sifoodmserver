object dashboard_module_page: Tdashboard_module_page
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Webservice Restaurante'
  ClientHeight = 580
  ClientWidth = 600
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 580
    Align = alClient
    BevelOuter = bvNone
    Color = 4473924
    ParentBackground = False
    TabOrder = 0
    object pnLogs: TPanel
      Left = 0
      Top = 77
      Width = 600
      Height = 503
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      OnMouseDown = paTopoMouseDown
      object Panel6: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 260
        Width = 580
        Height = 230
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alTop
        BevelOuter = bvNone
        Color = 3487029
        ParentBackground = False
        TabOrder = 0
        object mmRequest: TMemo
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 560
          Height = 210
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 3487029
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object Panel7: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 580
        Height = 230
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alTop
        BevelOuter = bvNone
        Color = 3487029
        ParentBackground = False
        TabOrder = 1
        object mmResponse: TMemo
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 560
          Height = 210
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 3487029
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object pnConfiguracoes: TPanel
      Left = 0
      Top = 77
      Width = 600
      Height = 503
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      OnMouseDown = paTopoMouseDown
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 580
        Height = 112
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        Color = 3487029
        ParentBackground = False
        TabOrder = 0
        object Panel4: TPanel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 560
          Height = 92
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          BevelOuter = bvNone
          Color = 5263440
          ParentBackground = False
          TabOrder = 0
          object Panel5: TPanel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 558
            Height = 90
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            BevelOuter = bvNone
            Color = 3487029
            ParentBackground = False
            TabOrder = 0
            object Label1: TLabel
              Left = 12
              Top = 9
              Width = 150
              Height = 16
              Caption = 'Configura'#231#245'es do Servidor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 12
              Top = 35
              Width = 31
              Height = 16
              Caption = 'Porta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 346
              Top = 9
              Width = 188
              Height = 32
              Caption = '* Libere a Porta no Firewall'#13#10'* Libere a Porta 8761 no Firewall'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lIpServidor: TLabel
              Left = 113
              Top = 35
              Width = 21
              Height = 16
              Caption = 'IP'#39's'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object EdtPorta: TEdit
              Left = 12
              Top = 55
              Width = 80
              Height = 24
              Alignment = taCenter
              BevelInner = bvNone
              BevelOuter = bvNone
              CharCase = ecLowerCase
              Color = 3487029
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              MaxLength = 4
              NumbersOnly = True
              ParentFont = False
              TabOrder = 0
              Text = '8082'
              OnChange = EdtPortaChange
            end
            object cbIps: TComboBox
              Left = 113
              Top = 55
              Width = 202
              Height = 22
              Style = csDropDownList
              TabOrder = 1
              OnChange = cbEmpresasChange
            end
          end
        end
      end
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 132
        Width = 580
        Height = 169
        Margins.Left = 10
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        Color = 3487029
        ParentBackground = False
        TabOrder = 1
        object Panel10: TPanel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 560
          Height = 149
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          BevelOuter = bvNone
          Color = 5263440
          ParentBackground = False
          TabOrder = 0
          object Panel11: TPanel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 558
            Height = 147
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            BevelOuter = bvNone
            Color = 3487029
            ParentBackground = False
            TabOrder = 0
            object Label3: TLabel
              Left = 12
              Top = 9
              Width = 200
              Height = 16
              Caption = 'Configura'#231#245'es do Banco de Dados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 12
              Top = 36
              Width = 69
              Height = 16
              Caption = 'IP ou HOST'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 12
              Top = 92
              Width = 169
              Height = 16
              Caption = 'Caminho do Banco de Dados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 136
              Top = 36
              Width = 31
              Height = 16
              Caption = 'Porta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object edBanco: TEdit
              Left = 12
              Top = 111
              Width = 532
              Height = 25
              BevelInner = bvNone
              BevelOuter = bvNone
              Color = 3487029
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = 'C:\Repositorio\BancoSIAFComercio\Banco.fdb'
            end
            object EdtHost: TEdit
              Left = 12
              Top = 58
              Width = 100
              Height = 25
              BevelInner = bvNone
              BevelOuter = bvNone
              Color = 3487029
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = 'localhost'
            end
            object edPortaBD: TEdit
              Left = 136
              Top = 58
              Width = 45
              Height = 25
              BevelInner = bvNone
              BevelOuter = bvNone
              Color = 3487029
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Text = '3050'
            end
          end
        end
      end
      object Panel9: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 311
        Width = 580
        Height = 92
        Margins.Left = 10
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        Color = 3487029
        ParentBackground = False
        TabOrder = 2
        object Panel12: TPanel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 560
          Height = 72
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          BevelOuter = bvNone
          Color = 5263440
          ParentBackground = False
          TabOrder = 0
          object Panel13: TPanel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 558
            Height = 70
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            BevelOuter = bvNone
            Color = 3487029
            ParentBackground = False
            TabOrder = 0
            object Label5: TLabel
              Left = 12
              Top = 9
              Width = 213
              Height = 16
              Caption = 'Configura'#231#245'es Locais do Webservice'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lCaixa: TLabel
              Left = 497
              Top = 9
              Width = 48
              Height = 16
              Caption = 'Caixa: 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lblImprimeDescricaoItem: TLabel
              Left = 34
              Top = 43
              Width = 242
              Height = 14
              Cursor = crHandPoint
              Caption = 'Imprimir descri'#231#227'o do item com uma linha e fonte B'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              OnClick = lblImprimeDescricaoItemClick
            end
            object cbImprimeDescricaoItem: TCheckBox
              Left = 12
              Top = 41
              Width = 17
              Height = 17
              TabOrder = 0
            end
          end
        end
      end
      object Panel14: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 447
        Width = 580
        Height = 46
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alBottom
        BevelOuter = bvNone
        Color = 3487029
        ParentBackground = False
        TabOrder = 3
        object pnIniciar: TPanel
          Left = 99
          Top = 9
          Width = 383
          Height = 28
          BevelOuter = bvNone
          Color = 2105123
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object pnColorIniciar: TPanel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 381
            Height = 26
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            BevelOuter = bvNone
            Color = 2105123
            ParentBackground = False
            TabOrder = 0
            object btnIniciar: TSpeedButton
              Left = 0
              Top = 0
              Width = 381
              Height = 26
              Cursor = crHandPoint
              Hint = 'Iniciar/Parar Servi'#231'o'
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Iniciar Servidor'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btnIniciarClick
              ExplicitLeft = -1
              ExplicitTop = 1
              ExplicitHeight = 30
            end
          end
        end
      end
    end
    object pnChave: TPanel
      Left = 0
      Top = 77
      Width = 600
      Height = 503
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      OnMouseDown = paTopoMouseDown
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 580
        Height = 192
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        Color = 3487029
        ParentBackground = False
        TabOrder = 0
        object Panel15: TPanel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 560
          Height = 172
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          BevelOuter = bvNone
          Color = 5263440
          ParentBackground = False
          TabOrder = 0
          object Panel16: TPanel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 558
            Height = 170
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            BevelOuter = bvNone
            Color = 3487029
            ParentBackground = False
            TabOrder = 0
            object Label9: TLabel
              Left = 12
              Top = 63
              Width = 223
              Height = 16
              Caption = 'Informe a chave de licen'#231'a do software'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 12
              Top = 9
              Width = 122
              Height = 16
              Caption = 'Selecione a empresa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lMensagemChave: TLabel
              Left = 12
              Top = 136
              Width = 81
              Height = 16
              Caption = 'Chave inv'#225'lida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object EdtChave: TMaskEdit
              Left = 12
              Top = 83
              Width = 533
              Height = 25
              Alignment = taCenter
              BevelInner = bvNone
              BevelOuter = bvNone
              CharCase = ecUpperCase
              Color = 3487029
              EditMask = 
                'AAAA-AAAA-AAAA-AAAA-AAAA-AAAA-AAAA-AAAA-AAAA-AAAA-AAAA-AAAA-AAAA' +
                ';1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 64
              ParentFont = False
              TabOrder = 0
              Text = '    -    -    -    -    -    -    -    -    -    -    -    -    '
            end
            object cbEmpresas: TComboBox
              Left = 12
              Top = 31
              Width = 533
              Height = 22
              Style = csDropDownList
              TabOrder = 1
              OnChange = cbEmpresasChange
            end
            object Panel17: TPanel
              Left = 325
              Top = 129
              Width = 220
              Height = 29
              BevelOuter = bvNone
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
              object Panel18: TPanel
                AlignWithMargins = True
                Left = 1
                Top = 1
                Width = 218
                Height = 27
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Align = alClient
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object btnInserirChave: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 218
                  Height = 27
                  Cursor = crHandPoint
                  Hint = 'Inserir Chave'
                  Margins.Left = 0
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alClient
                  Caption = 'Inserir Chave'
                  Flat = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btnInserirChaveClick
                  ExplicitLeft = -1
                  ExplicitTop = 1
                  ExplicitWidth = 381
                  ExplicitHeight = 30
                end
              end
            end
          end
        end
      end
      object Panel19: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 217
        Width = 580
        Height = 186
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        Color = 3487029
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object Panel20: TPanel
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 560
          Height = 166
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          BevelOuter = bvNone
          Color = 5263440
          ParentBackground = False
          TabOrder = 0
          object Panel21: TPanel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 558
            Height = 164
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            BevelOuter = bvNone
            Color = 3487029
            ParentBackground = False
            TabOrder = 0
            object Image1: TImage
              Left = 405
              Top = 13
              Width = 138
              Height = 138
              Center = True
              Picture.Data = {
                0B54504E4747726170686963C6290100424DC629010000000000360000002800
                00008A0000008A00000001002000000000009029010000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF03FFFFFF030000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF0CFFFFFF31FFFF
                FF08FFFFFF26FFFFFF0900000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF08FFFF
                FF07FFFFFF040000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF2EFFFF
                FF8DFFFFFFC8FFFFFFDEFFFFFFE0FFFFFFD3FFFFFFA2FFFFFF4A000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF06FFFFFF3EFFFF
                FF38FFFFFF0CFFFFFF01FFFFFF0AFFFFFF4FFFFFFF2CFFFFFF01000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF01FFFFFF20FFFFFF13FFFF
                FF2AFFFFFF4CFFFFFF24FFFFFF3CFFFFFF2DFFFFFF15FFFFFF20000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF11FFFFFF5EFFFF
                FF93FFFFFF87FFFFFF46FFFFFF1BFFFFFF06FFFFFF03FFFFFF13FFFFFF36FFFF
                FF75FFFFFF9CFFFFFF72FFFFFF27000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF04FFFFFF24FFFF
                FF36FFFFFF090000000000000000000000000000000000000000FFFFFF16FFFF
                FF38FFFFFF1DFFFFFF0100000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF11FFFF
                FF2400000000FFFFFF01000000000000000000000000FFFFFF01FFFFFF02FFFF
                FF2DFFFFFF0A0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF35FFFF
                FFCCFFFFFF4FFFFFFF0E00000000000000000000000000000000000000000000
                00000000000000000000FFFFFF08FFFFFF30FFFFFFB6FFFFFF69FFFFFF020000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF0CFFFFFF1F000000000000000000000000FFFFFF0FFFFFFF27FFFFFF100000
                00000000000000000000FFFFFF20FFFFFF040000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF0DFFFFFF4CFFFFFF02FFFFFF01FFFFFF1DFFFFFF3EFFFFFF4EFFFFFF3FFFFF
                FF1900000000FFFFFF05FFFFFF41FFFFFF0D0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF3CFFFFFF9BFFFFFF1B00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF04FFFF
                FF82FFFFFF69FFFFFF0600000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF3CFFFFFF0200000000FFFFFF14FFFFFF88FFFFFFBBFFFF
                FFB4FFFFFFBDFFFFFFA6FFFFFF2D00000000FFFFFF0BFFFFFF47000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF08FFFFFF420000000000000000FFFFFF40FFFFFF86FFFFFF68FFFF
                FF81FFFFFF59FFFFFF88FFFFFF2F0000000000000000FFFFFF55FFFFFF020000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF3CFFFFFFAFFFFFFF19000000000000000000000000FFFFFF14FFFF
                FF38FFFFFF27FFFFFF19FFFFFF4AFFFFFF22FFFFFF48FFFFFF3CFFFFFF070000
                000000000000FFFFFF09FFFFFF7FFFFFFF79FFFFFF0200000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF3FFFFFFF1400000000FFFFFF06FFFFFF9EFFFF
                FFA2FFFFFFADFFFFFF71FFFFFFA7FFFFFF9BFFFFFF50FFFFFF0200000000FFFF
                FF25FFFFFF270000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF13FFFFFF0D00000000FFFFFF32FFFFFF7CFFFF
                FF84FFFFFFB3FFFFFF7CFFFFFF95FFFFFF85FFFFFF89FFFFFF1E00000000FFFF
                FF0AFFFFFF140000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF16FFFFFFA7FFFFFF150000000000000000FFFFFF08FFFF
                FF1DFFFFFF45FFFFFF8AFFFFFF68FFFFFF4DFFFFFFA7FFFFFF5FFFFFFFA2FFFF
                FF8FFFFFFF2CFFFFFF1EFFFFFF070000000000000000FFFFFF92FFFFFF3B0000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF38FFFFFF0300000000FFFF
                FF2AFFFFFFB7FFFFFFB8FFFFFF84FFFFFFC2FFFFFFCCFFFFFFCAFFFFFF550000
                000000000000FFFFFF07FFFFFF27000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF14FFFFFF0CFFFFFF06FFFF
                FF88FFFFFF55FFFFFF51FFFFFF98FFFFFF3CFFFFFF7DFFFFFF51FFFFFF5CFFFF
                FF8A00000000FFFFFF0AFFFFFF14000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF64FFFFFF5200000000000000000000
                0000FFFFFF49FFFFFFD7FFFFFFE2FFFFFFECFFFFFFE7FFFFFFE3FFFFFFF1FFFF
                FFE6FFFFFFF0FFFFFFEDFFFFFFDEFFFFFFDBFFFFFF440000000000000000FFFF
                FF27FFFFFF930000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF5F0000
                000000000000FFFFFF3CFFFFFF8DFFFFFFD7FFFFFF3CFFFFFF40FFFFFFBEFFFF
                FF16FFFFFF9AFFFFFF050000000000000000FFFFFF4600000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF4AFFFF
                FF08FFFFFF18FFFFFF98FFFFFF99FFFFFF63FFFFFF9BFFFFFF34FFFFFF96FFFF
                FF6FFFFFFF8BFFFFFFA0FFFFFF0EFFFFFF10FFFFFF3D00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF0BFFFFFFB2FFFFFF0E0000
                000000000000FFFFFF01FFFFFF5BFFFFFFFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57FFFF
                FF020000000000000000FFFFFF87FFFFFF490000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF270000000000000000FFFFFF38FFFFFF94FFFFFFC2FFFFFF56FFFF
                FF1DFFFFFFD900000000FFFFFF9DFFFFFF090000000000000000FFFFFF180000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF24FFFFFF06FFFFFF15FFFFFF80FFFFFF6CFFFFFF62FFFFFFA4FFFF
                FF51FFFFFF9CFFFFFF6AFFFFFF5AFFFFFF92FFFFFF0BFFFFFF09FFFFFF1E0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF65FFFF
                FF6D000000000000000000000000FFFFFF45FFFFFFB0FFFFFFFCFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFADFFFFFF65FFFFFF0500000000FFFFFF25FFFFFFB9FFFFFF020000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF450000000000000000FFFFFF1AFFFFFFBDFFFF
                FF76FFFFFFC1FFFFFF8EFFFFFFF5FFFFFF1DFFFFFFA2FFFFFF06000000000000
                0000FFFFFF370000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF27FFFFFF0CFFFFFF02FFFFFF92FFFFFF73FFFF
                FF3AFFFFFF84FFFFFF0EFFFFFF67FFFFFF36FFFFFF88FFFFFF8700000000FFFF
                FF10FFFFFF240000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFFBBFFFFFF1800000000000000000000000000000000FFFFFF58FFFF
                FFFAFFFFFFFAFFFFFFEFFFFFFFF8FFFFFFFFFFFFFFF5FFFFFFF0FFFFFFF0FFFF
                FFF1FFFFFFFFFFFFFFFFFFFFFF5200000000000000000000000000000000FFFF
                FFB0FFFFFF1F0000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF1CFFFFFF41000000000000
                0000FFFFFF6FFFFFFFC5FFFFFF5FFFFFFF65FFFFFF46FFFFFFCCFFFFFF6B0000
                000000000000FFFFFF66FFFFFF09000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF19FFFFFF1800000000FFFF
                FF2DFFFFFF78FFFFFF82FFFFFF95FFFFFF63FFFFFF6EFFFFFF8AFFFFFF79FFFF
                FF1D00000000FFFFFF1FFFFFFF16000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF2BFFFFFFBB00000000000000000000000000000000FFFF
                FF43FFFFFFADFFFFFFFCFFFFFFD9FFFFFF18FFFFFF47FFFFFF92FFFFFF2FFFFF
                FF4CFFFFFF33FFFFFF42FFFFFFFFFFFFFFFFFFFFFFABFFFFFF62FFFFFF050000
                000000000000FFFFFF79FFFFFF40FFFFFF070000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF28FFFFFF0700000000FFFFFF02FFFFFF6BFFFFFFA9FFFFFFA1FFFFFFABFFFF
                FF7AFFFFFF0900000000FFFFFF17FFFFFF1E0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF04FFFF
                FF260000000000000000FFFFFF22FFFFFFA0FFFFFF86FFFFFF90FFFFFF92FFFF
                FF96FFFFFF1E00000000FFFFFF06FFFFFF1DFFFFFF0300000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF15FFFFFF0BFFFFFF04FFFFFFE1FFFFFFB600000000000000000000
                000000000000FFFFFF20FFFFFF83FFFFFFFBFFFFFFF8FFFFFF3BFFFFFF07FFFF
                FF1EFFFFFF03FFFFFF94FFFFFF2FFFFFFF40FFFFFFFFFFFFFFFFFFFFFF7FFFFF
                FF30FFFFFF020000000000000000FFFFFF58FFFFFF7AFFFFFFD9FFFFFF73FFFF
                FF03000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF14FFFFFF100000000000000000FFFFFF01FFFFFF0CFFFF
                FF12FFFFFF0E000000000000000000000000FFFFFF18FFFFFF09000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF2AFFFFFF24FFFFFF0900000000FFFFFF08FFFFFF40FFFF
                FF5DFFFFFF39FFFFFF0400000000FFFFFF08FFFFFF37FFFFFF17000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF07FFFF
                FF0DFFFFFF04FFFFFF85FFFFFFF9FFFFFF4A00000000FFFFFF7EFFFFFFA20000
                0000000000000000000000000000FFFFFF43FFFFFFADFFFFFFFCFFFFFFFEFFFF
                FF9FFFFFFF0DFFFFFF3BFFFFFF15FFFFFFC8FFFFFF2EFFFFFF40FFFFFFFFFFFF
                FFFFFFFFFFA9FFFFFF61FFFFFF050000000000000000FFFFFF51FFFFFF7FFFFF
                FFADFFFFFF74FFFFFF02FFFFFF54FFFFFF81FFFFFF1F00000000000000000000
                000000000000000000000000000000000000FFFFFF2FFFFFFF33FFFFFF170000
                000000000000000000000000000000000000FFFFFF19FFFFFF47FFFFFF1A0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF14FFFFFF1DFFFFFF130000
                000000000000000000000000000000000000FFFFFF15FFFFFF1DFFFFFF130000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF28FFFFFFC5FFFFFF8C00000000FFFFFF36FFFFFF36FFFFFF0E00000000FFFF
                FF1BFFFFFFA200000000000000000000000000000000FFFFFF5AFFFFFFCAFFFF
                FFFDFFFFFFFFFFFFFFF3FFFFFF1FFFFFFF01FFFFFF38FFFFFFEFFFFFFF26FFFF
                FF40FFFFFFFFFFFFFFFFFFFFFFC7FFFFFF83FFFFFF070000000000000000FFFF
                FF62FFFFFF4AFFFFFF02FFFFFF0600000000FFFFFF57FFFFFFD8FFFFFF34FFFF
                FF02FFFFFF72FFFFFF150000000000000000000000000000000000000000FFFF
                FF05FFFFFF15FFFFFF41FFFFFF29FFFFFF65FFFFFF3DFFFFFF29FFFFFF150000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF08FFFFFF52FFFFFF2DFFFFFF08FFFFFF1AFFFFFF18FFFFFF2EFFFFFF4F0000
                0000000000000000000000000000000000000000000000000000FFFFFF19FFFF
                FF5EFFFFFF18FFFFFF0BFFFFFFB9FFFFFF5A0000000000000000000000000000
                000000000000FFFFFF0AFFFFFFBDFFFFFF05000000000000000000000000FFFF
                FF1AFFFFFF7CFFFFFFFBFFFFFFFFFFFFFFFFFFFFFF88FFFFFF3EFFFFFF9FFFFF
                FFFAFFFFFF54FFFFFF68FFFFFFFFFFFFFFFFFFFFFF77FFFFFF27FFFFFF010000
                000000000000FFFFFF8CFFFFFF3300000000000000000000000000000000FFFF
                FF0100000000FFFFFF2FFFFFFFE1FFFFFFA500000000FFFFFF0BFFFFFF010000
                00000000000000000000000000000000000000000000FFFFFF06000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF0DFFFFFF04FFFFFF1AFFFFFF0CFFFF
                FF0A000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF77FFFFFFF2FFFFFF4F00000000FFFFFF0800000000000000000000
                000000000000000000000000000000000000FFFFFF9AFFFFFF38000000000000
                000000000000FFFFFF42FFFFFFADFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFF9FFFF
                FFF5FFFFFFFCFFFFFFFEFFFFFFF4FFFFFFF5FFFFFFFFFFFFFFFFFFFFFFAAFFFF
                FF61FFFFFF0500000000FFFFFF05FFFFFFC8FFFFFF0F00000000000000000000
                0000000000000000000000000000FFFFFF04FFFFFF2CFFFFFF25FFFFFF03FFFF
                FF81FFFFFF99FFFFFF1A00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF01FFFF
                FF38FFFFFF87FFFFFF07FFFFFF1EFFFFFF160000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF3EFFFF
                FF92FFFFFF01000000000000000000000000FFFFFF5BFFFFFFFAFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF55000000000000000000000000FFFFFF48FFFFFF94000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF03FFFFFF79FFFFFFE5FFFFFF1CFFFFFF07FFFFFF0F000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF01FFFFFF06FFFFFFC2FFFFFFA4FFFFFF080000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF03FFFFFF9BFFFFFF23000000000000000000000000FFFFFF57FFFF
                FFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFEFFFFFF500000000000000000FFFFFF0AFFFFFF9BFFFF
                FF20000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF1C00000000FFFFFF7BFFFF
                FFC1FFFFFF330000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF03FFFFFF61FFFFFFA6FFFFFF03FFFFFF050000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF3DFFFFFF77FFFFFF01000000000000
                0000FFFFFF06FFFFFF1DFFFFFF45FFFFFF89FFFFFF68FFFFFF4DFFFFFFA7FFFF
                FF5EFFFFFFA1FFFFFF8FFFFFFF2CFFFFFF1DFFFFFF040000000000000000FFFF
                FF42FFFFFF740000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF18FFFFFFA5FFFFFF2AFFFFFF02FFFFFF0700000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF18FFFFFFBEFFFFFF85FFFFFF0C00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF09FFFFFF88FFFF
                FF5BFFFFFF01000000000000000000000000FFFFFF18FFFFFF44FFFFFF2FFFFF
                FF1EFFFFFF58FFFFFF28FFFFFF54FFFFFF48FFFFFF0900000000000000000000
                0000FFFFFF29FFFFFFA0FFFFFF1D000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF01FFFFFF01FFFFFF50FFFFFFBBFFFF
                FF3C000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF3CFFFFFF5400000000FFFFFF0AFFFFFF03000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF07FFFFFFACFFFFFF43000000000000000000000000000000000000
                00000000000000000000FFFFFF0100000000FFFFFF0100000000000000000000
                000000000000FFFFFF1BFFFFFFC3FFFFFF250000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF1CFFFFFFC2FFFFFF3300000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF04FFFFFF1BFFFFFF2EFFFFFF35FFFFFF32FFFF
                FF22FFFFFF0A0000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF08FFFFFFCEFFFFFFADFFFFFF02FFFFFF01FFFF
                FF10FFFFFF2AFFFFFF19FFFFFF2BFFFFFF4DFFFFFF22FFFFFF23FFFFFF080000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF10FFFFFF92FFFFFF62FFFFFF110000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF06FFFFFF41FFFFFF97FFFFFF3000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF0500000000FFFFFF45FFFFFF94FFFFFF180000
                000000000000000000000000000000000000FFFFFF0EFFFFFF26FFFFFF34FFFF
                FF35FFFFFF2CFFFFFF16FFFFFF01000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF07FFFFFF64FFFFFFBAFFFFFFA6FFFFFF83FFFF
                FF73FFFFFF7BFFFFFF97FFFFFFBAFFFFFF8BFFFFFF2400000000000000000000
                0000000000000000000000000000FFFFFF1800000000FFFFFF2AFFFFFF100000
                0000FFFFFF2FFFFFFF2CFFFFFF0C000000000000000000000000FFFFFF05FFFF
                FF0EFFFFFF38FFFFFF1200000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF0EFFFF
                FF5EFFFFFFADFFFFFF43FFFFFF01000000000000000000000000000000000000
                00000000000000000000FFFFFF1EFFFFFF9BFFFFFF89FFFFFF1C000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF4BFFFF
                FFFBFFFFFF56000000000000000000000000FFFFFF2DFFFFFF97FFFFFFBCFFFF
                FF92FFFFFF78FFFFFF75FFFFFF86FFFFFFADFFFFFFB3FFFFFF55FFFFFF070000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF11FFFFFF62FFFFFFA6FFFFFF68FFFFFF130000
                000000000000000000000000000000000000FFFFFF08FFFFFF45FFFFFF98FFFF
                FF82FFFFFF29FFFFFF0100000000FFFFFF05FFFFFF94FFFFFFC2FFFFFF080000
                0000FFFFFF01FFFFFF28FFFFFF1B000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF3FFFFFFF1600000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF1FFFFFFF86FFFFFF9CFFFFFF72FFFFFF56FFFF
                FF48FFFFFF46FFFFFF50FFFFFF68FFFFFF90FFFFFFA1FFFFFF3AFFFFFF010000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF2CFFFFFF03FFFFFF22FFFFFF4EFFFFFF8DFFFFFF95FFFF
                FF39FFFFFF010000000000000000000000000000000000000000FFFFFF1EFFFF
                FF74FFFFFF9DFFFFFF57FFFFFF0C000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF29FFFFFFB5FFFFFF58FFFFFF100000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF06FFFFFF32FFFFFF9BFFFFFF4E00000000FFFFFF04FFFFFF73FFFF
                FF54FFFFFF0100000000FFFFFF4AFFFFFF1AFFFFFF0100000000000000000000
                00000000000000000000FFFFFF060000000000000000FFFFFF02FFFFFF2AFFFF
                FF1D000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF12FFFF
                FF2CFFFFFF3DFFFFFF4BFFFFFF4EFFFFFF42FFFFFF32FFFFFF1AFFFFFF020000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF07FFFFFFC5FFFFFFA0FFFF
                FF2BFFFFFF020000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF17FFFFFF64FFFFFF95FFFFFF09000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF1DFFFFFFA2FFFFFF240000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF11FFFFFFA8FFFFFF92FFFF
                FF1B000000000000000000000000FFFFFF06FFFFFF150000000000000000FFFF
                FF02FFFFFF03FFFFFF03FFFFFF03FFFFFF04FFFFFF9CFFFFFF27FFFFFF020000
                0000FFFFFF04FFFFFF1200000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF72FFFF
                FF8AFFFFFF040000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF54FFFF
                FFAFFFFFFF180000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF18FFFFFFB4FFFF
                FF35000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF27FFFFFFE7FFFFFF66000000000000000000000000FFFFFF15FFFFFF1D0000
                0000FFFFFF06FFFFFFA2FFFFFFA6FFFFFFA6FFFFFFA6FFFFFFA8FFFFFFF6FFFF
                FFD1FFFFFF72FFFFFF02FFFFFF03FFFFFF2F0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF59FFFFFF7BFFFFFF0400000000000000000000000000000000FFFFFF0BFFFF
                FF44FFFFFF6BFFFFFF6FFFFFFF56FFFFFF1C0000000000000000000000000000
                000000000000FFFFFF44FFFFFF88000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF02FFFF
                FF86FFFFFF3D000000000000000000000000FFFFFF05FFFFFF06FFFFFF06FFFF
                FF06FFFFFF06FFFFFF06FFFFFF06FFFFFF06FFFFFF06FFFFFF06FFFFFF06FFFF
                FF010000000000000000FFFFFF21FFFFFF9AFFFFFF030000000000000000FFFF
                FF22FFFFFF1100000000FFFFFF0BFFFFFFFCFFFFFFF6FFFFFFF6FFFFFFF6FFFF
                FFF6FFFFFFF6FFFFFFF7FFFFFFB4FFFFFF0500000000FFFFFF3D000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF28FFFFFFDAFFFFFF09000000000000000000000000FFFFFF06FFFF
                FF56FFFFFFE1FFFFFFC9FFFFFFE1FFFFFFA0FFFFFFB0FFFFFFECFFFFFF8BFFFF
                FF10000000000000000000000000FFFFFF01FFFFFF79FFFFFF59000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF21FFFFFF85000000000000000000000000FFFFFF0FFFFFFF99FFFF
                FFB3FFFFFFB3FFFFFFB3FFFFFFB3FFFFFFB3FFFFFFB3FFFFFFB3FFFFFFB3FFFF
                FFB3FFFFFFABFFFFFF29000000000000000000000000FFFFFF60FFFFFF760000
                000000000000FFFFFF17FFFFFF0B00000000FFFFFF0BFFFFFFEFFFFFFFA2FFFF
                FF9BFFFFFF9BFFFFFF9BFFFFFF9BFFFFFFAAFFFFFFB4FFFFFF0500000000FFFF
                FF2C000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF05FFFFFF86FFFFFF2A000000000000000000000000FFFF
                FF13FFFFFF81FFFFFF85FFFFFF95FFFFFF52FFFFFF85FFFFFF40FFFFFF71FFFF
                FF65FFFFFF8EFFFFFF84FFFFFF36000000000000000000000000FFFFFF12FFFF
                FFC9FFFFFF200000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF81FFFFFF9DFFFFFFB9FFFFFFB9FFFFFFB9FFFF
                FFB2FFFFFFD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFE9FFFFFFBAFFFFFFB9FFFFFFB9FFFFFFB9FFFF
                FF8AFFFFFFE7FFFFFF1400000000FFFFFF34FFFFFF1A00000000FFFFFF0BFFFF
                FFFBFFFFFFF0FFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFF1FFFFFFB4FFFF
                FF0500000000FFFFFF6600000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000B6
                FF2A00C0FF6D00BFFF4C0000000000BFFF4C00C1FFB800BFFF780000000000C3
                FF1E00BEFF5200BFFF1C0000FF01000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF19FFFFFF8300000000000000000000
                0000FFFFFF07FFFFFFB3FFFFFF2DFFFFFFA8FFFFFF92FFFFFFDDFFFFFFDBFFFF
                FFD6FFFFFFF2FFFFFFA8FFFFFFDEFFFFFF23FFFFFFADFFFFFF18000000000000
                000000000000FFFFFF3DFFFFFF7A000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF0CFFFFFFC5FFFFFF4FFFFFFFFDFFFF
                FFFFFFFFFFFFFFFFFFFEFFFFFFD6FFFFFFE1FFFFFFEAFFFFFFFDFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFFFE3FFFFFFDBFFFFFFF5FFFFFFFFFFFF
                FFFFFFFFFFFDFFFFFF81FFFFFF69FFFFFF5100000000FFFFFF03FFFFFF340000
                0000FFFFFF0BFFFFFFF6FFFFFFD2FFFFFFCFFFFFFFCFFFFFFFCFFFFFFFCFFFFF
                FFD6FFFFFFB4FFFFFF05FFFFFF0BFFFFFF190000000000000000000000000000
                000000000000000000000000000000FFFF020000000000BFFF3C00C0FFAE00BF
                FF7C0000000000BEFF5A00C0FFCE00C0FF710000000000BFFF4400C0FFAD00BF
                FF700000000000BEFF4A00BFFFDC00C0FFAA00B3FF0A00BDFF2300C0FF7E00BF
                FF4C00D5FF060000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF56FFFFFF560000
                00000000000000000000FFFFFF51FFFFFF89FFFFFF91FFFFFF96FFFFFF31FFFF
                FF8FFFFFFF0100000000FFFFFFC8FFFFFF26FFFFFF66FFFFFFBFFFFFFF7BFFFF
                FF9EFFFFFF09000000000000000000000000FFFFFF8BFFFFFF0B000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF3FFFFFFF95FFFF
                FF04FFFFFF4AFFFFFFA6FFFFFFF3FFFFFFFFFFFFFFFDFFFFFFEBFFFFFF92FFFF
                FF57FFFFFFE3FFFFFFFFFFFFFFFBFFFFFF7CFFFFFF68FFFFFFD2FFFFFFF9FFFF
                FFFEFFFFFFFBFFFFFFC8FFFFFF6DFFFFFF13FFFFFF0AFFFFFF7B000000000000
                0000FFFFFF1BFFFFFF01FFFFFF03FFFFFF7BFFFFFF81FFFFFF81FFFFFF81FFFF
                FF81FFFFFF81FFFFFF81FFFFFF56FFFFFF01FFFFFF08FFFFFF0D000000000000
                000000000000000000000000000000B7FF2000C1FF9300BFFF880000000000C0
                FF3500C0FFA700BEFF4B0000000000B6FF0700B8FF1200BFFF080000000000AA
                FF0300BFFF0800CCFF050000000000B6FF0700C2FF1500B8FF120000000000BF
                FF3400C0FFDF00C1FFBC00D5FF0600B9FF0B00C2FF3600000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF9CFFFFFF29000000000000000000000000FFFFFFAFFFFFFF91FFFFFF56FFFF
                FF41FFFFFF03FFFFFF830000000000000000FFFFFFAAFFFFFF16FFFFFF01FFFF
                FF95FFFFFF62FFFFFFDCFFFFFF30000000000000000000000000FFFFFF7CFFFF
                FF17000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF68FFFFFF5D000000000000000000000000FFFFFF20FFFFFFEAFFFFFFF3FFFF
                FF2800000000FFFFFF04FFFFFF91FFFFFFFFFFFFFFC7FFFFFF07000000000000
                0000FFFFFFAAFFFFFFFFFFFFFF77FFFFFF01000000000000000000000000FFFF
                FF81FFFFFF0400000000FFFFFF03FFFFFF55FFFFFF0300000000000000000000
                00000000000000000000000000000000000000000000FFFFFF04FFFFFF5BFFFF
                FF01000000000000000000CCFF0500C1FF1D00FFFF0100C0FF5100C0FFCE00C0
                FF8600AAFF060000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000080FF0200BCFF170000000000C0FF4500C0FFEE00BE
                FF96000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFFCAFFFFFF0D0000000000000000FFFFFF06FFFFFFC4FFFF
                FF4EFFFFFF8DFFFFFF80FFFFFF72FFFFFFBAFFFFFF7DFFFFFF7EFFFFFFCAFFFF
                FF83FFFFFF67FFFFFFA1FFFFFF53FFFFFF94FFFFFF5300000000000000000000
                0000FFFFFF71FFFFFF2200000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF7CFFFFFF40000000000000000000000000FFFFFF72FFFF
                FFF7FFFFFFFAFFFFFF7700000000FFFFFF2BFFFFFFE7FFFFFFFFFFFFFFF8FFFF
                FF7F00000000FFFFFF18FFFFFFE2FFFFFFFFFFFFFFB5FFFFFF10000000000000
                000000000000FFFFFF7FFFFFFF060000000000000000FFFFFF0FFFFFFF410000
                0000000000000000000000000000000000000000000000000000FFFFFF18FFFF
                FF38FFFFFF04000000000000000000BDFF2300BFFFB700C0FFBB00C3FF1100CC
                FF0A00BAFF1A00FFFF0200000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000C4
                FF0D00BFFF4000BDFF360000000000BFFF6700BFFF5700BFFF04000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF04FFFFFFD3FFFFFF030000000000000000FFFF
                FF25FFFFFFC4FFFFFF4FFFFFFF8FFFFFFF40FFFFFF25FFFFFF87FFFFFF10FFFF
                FF10FFFFFF92FFFFFF3FFFFFFF21FFFFFF7BFFFFFF5BFFFFFF88FFFFFF700000
                00000000000000000000FFFFFF68FFFFFF2F0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF7CFFFFFF400000000000000000FFFF
                FF1EFFFFFFE6FFFFFFFFFFFFFFFFFFFFFFD3FFFFFF16FFFFFF97FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFEFFFFFFF1DFFFFFF9AFFFFFFFFFFFFFFFFFFFFFFF0FFFF
                FF42000000000000000000000000FFFFFF7FFFFFFF0600000000000000000000
                000000000000FFFFFF46FFFFFF22FFFFFF1AFFFFFF14FFFFFF05FFFFFF18FFFF
                FF3BFFFFFF2E000000000000000000BCFF1700AAFF0300BCFF1300C0FFC700C1
                FF5E00BFFF040000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000CCFF0500C0FFAF00C0FFE600BD
                FF42000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF04FFFFFFD3FFFFFF030000
                000000000000FFFFFF25FFFFFFC5FFFFFF51FFFFFF90FFFFFF41FFFFFF26FFFF
                FF88FFFFFF12FFFFFF11FFFFFF93FFFFFF40FFFFFF22FFFFFF7CFFFFFF5DFFFF
                FF8AFFFFFF70000000000000000000000000FFFFFF68FFFFFF2F000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF68FFFFFF5E0000
                000000000000FFFFFF2CFFFFFFF4FFFFFFFFFFFFFFFFFFFFFFDFFFFFFF31FFFF
                FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57FFFFFFBEFFFFFFFFFFFF
                FFFFFFFFFFFBFFFFFF52000000000000000000000000FFFFFF81FFFFFF040000
                000000000000000000000000000000000000FFFFFF0CFFFFFF21FFFFFF1AFFFF
                FF07FFFFFF1DFFFFFF03000000000000000000BDFF3600BFFFC400C0FF610000
                000000B1FF0D0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000B6
                FF0700BDFF3600B9FF0B00C3FF1100BDFF490000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FFC9FFFFFF0E0000000000000000FFFFFF06FFFFFFC4FFFFFF4DFFFFFF8CFFFF
                FF7FFFFFFF70FFFFFFB9FFFFFF7CFFFFFF7CFFFFFFC9FFFFFF82FFFFFF66FFFF
                FFA1FFFFFF52FFFFFF95FFFFFF53000000000000000000000000FFFFFF71FFFF
                FF21000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF3EFFFFFF960000000000000000FFFFFF1BFFFFFFF2FFFFFFFFFFFFFFFFFFFF
                FFDDFFFFFF1EFFFFFFC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFF
                FFA2FFFFFFFFFFFFFFFFFFFFFFFDFFFFFF4D0000000000000000FFFFFF0AFFFF
                FF7B000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000C1FF6600C0
                FFC600BDFF230000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000BFFF4800C1FFF500C1FF8F00BF
                FF04000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF9BFFFFFF2A000000000000000000000000FFFFFFAEFFFF
                FF94FFFFFF55FFFFFF41FFFFFF03FFFFFF830000000000000000FFFFFFABFFFF
                FF16FFFFFF01FFFFFF96FFFFFF65FFFFFFDCFFFFFF3000000000000000000000
                0000FFFFFF7DFFFFFF1700000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF0BFFFFFFC5FFFFFF0D00000000FFFFFF07FFFFFFACFFFF
                FFFEFFFFFFFFFFFFFFBFFFFFFF0CFFFFFFBCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF3EFFFFFF51FFFFFFF1FFFFFFFFFFFFFFE5FFFFFF30000000000000
                0000FFFFFF6BFFFFFF5100000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000080FF0400C0FF5900C3
                FF1100D5FF0600B6FF0E00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000BFFF0800C1
                FF6600C1FF5600FFFF010000FF01000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF56FFFFFF5700000000000000000000
                0000FFFFFF50FFFFFF89FFFFFF90FFFFFF97FFFFFF33FFFFFF90FFFFFF01FFFF
                FF01FFFFFFC9FFFFFF28FFFFFF69FFFFFFBEFFFFFF7AFFFFFF9DFFFFFF080000
                00000000000000000000FFFFFF8BFFFFFF0B0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF7FFFFFFF43000000000000
                000000000000FFFFFF6AFFFFFF7DFFFFFF1100000000FFFFFF6FFFFFFFFCFFFF
                FFFFFFFFFFFFFFFFFFF9FFFFFF1100000000FFFFFF3CFFFFFF8BFFFFFF360000
                000000000000FFFFFF03FFFFFFE9FFFFFF130000000000000000000000000000
                00000000000000000000000000000000000000000000000000000099FF0500C0
                FFA700C0FFF800BFFF4800000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000BFFF1000C1FFC500C1FF1D000000000000
                00000000000000000000000000000000000000000000FFFFFF19FFFFFF830000
                00000000000000000000FFFFFF07FFFFFFB3FFFFFF2EFFFFFFA7FFFFFF90FFFF
                FFDBFFFFFFDEFFFFFFD9FFFFFFF1FFFFFFA4FFFFFFDDFFFFFF23FFFFFFADFFFF
                FF16000000000000000000000000FFFFFF3EFFFFFF7900000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF21FFFF
                FF8600000000000000000000000000000000000000000000000000000000FFFF
                FF07FFFFFF64FFFFFFADFFFFFF99FFFFFF330000000000000000000000000000
                00000000000000000000FFFFFF01FFFFFF62FFFFFF7400000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000FFFF0100BFFF5400C1FF5E0099FF050000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000C2FF2A00C0FFD100C0
                FF9B00000000000000000000000000000000000000000000000000000000FFFF
                FF05FFFFFF86FFFFFF2B000000000000000000000000FFFFFF11FFFFFF80FFFF
                FF86FFFFFF96FFFFFF52FFFFFF85FFFFFF3FFFFFFF6FFFFFFF67FFFFFF8FFFFF
                FF84FFFFFF35000000000000000000000000FFFFFF13FFFFFFC9FFFFFF200000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF02FFFFFF85FFFFFF40000000000000000000000000000000000000
                00000000000000000000FFFFFF01FFFFFF05FFFFFF0300000000000000000000
                000000000000000000000000000000000000FFFFFF12FFFFFF9AFFFFFF030000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000C0FF7D00C2FF15000000000000FF0100000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000C8FF0E00B7FF2000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF27FFFFFFDBFFFFFF0900000000000000000000
                0000FFFFFF05FFFFFF53FFFFFFDFFFFFFFCCFFFFFFE2FFFFFFA2FFFFFFB3FFFF
                FFECFFFFFF87FFFFFF0F000000000000000000000000FFFFFF01FFFFFF7BFFFF
                FF57000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF17FFFFFFB4FFFFFF36000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF13FFFFFF93FFFF
                FF46000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000BFFF5B00C0FFF700BFFF5C000000000000000000BF
                FF0400BEFF4300C0FF8900C0FFAB00C1FFB400C0FFA900BFFF9000C2FF7000BF
                FF5000BFFF3400BCFF1300000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000B6FF0E00C1FF4E00C1FF8800C0FF9900BFFF7700C2
                FF2E0000000000000000000000000000000000BDFF3200BEFF7E00C6FF090000
                00000000000000000000000000000000000000000000FFFFFF56FFFFFF7CFFFF
                FF0500000000000000000000000000000000FFFFFF0AFFFFFF41FFFFFF68FFFF
                FF6DFFFFFF53FFFFFF1A0000000000000000000000000000000000000000FFFF
                FF46FFFFFF860000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF1CFFFF
                FFA2FFFFFF260000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF12FFFF
                FFA3FFFFFF4FFFFFFF0300000000000000000000000000000000000000000000
                00000000000000000000000000000000000000BCFF2A00BFFF7400D5FF060000
                000000AAFF0300C1FF8300C0FFEF00C0FFFE00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFE00C0FFF700C0FFE900C0FFD300C0FF8600BDFF1B000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000CCFF0500C0FF9D00C0FFF600C1FFFE00C0
                FFFF00C0FFFD00C0FFE600BFFF5800000000000000000000000000C2FF3200C0
                FFEF00C1FF620000000000000000000000000000000000000000000000000000
                0000FFFFFF71FFFFFF8DFFFFFF04000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF57FFFFFFADFFFFFF16000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF27FFFFFFB5FFFFFF5AFFFFFF1100000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF07FFFF
                FF34FFFFFF9CFFFFFF4C00000000000000000000000000000000000000000000
                00000000000000000000000000000000000000C2FF1500C1FF2900FFFF020000
                0000000000000000000000BEFF3B00C0FFEB00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00BF
                FFF700C0FF9900BDFF3600C4FF0D000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000BEFF6E00C0FFFE00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFE400BFFF2C000000000000
                00000000000000C0FF4900BBFF0F000000000000000000000000000000000000
                00000000000000000000FFFFFF03FFFFFF75FFFFFF92FFFFFF2CFFFFFF030000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF01FFFFFF18FFFFFF65FFFFFF93FFFFFF090000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF0DFFFFFF56FFFFFFAEFFFF
                FF75FFFFFF170000000000000000000000000000000000000000FFFFFF0AFFFF
                FF4EFFFFFFA5FFFFFF7AFFFFFF20FFFFFF010000000000000000000000000000
                0000000000000000000000000000000000000000000000AAFF0600C1FF9500C0
                FFDC00BFFF1800000000000000000000000000C0FF7E00C0FFFE00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFF300C0FFC100C1FF4E0000FF010000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000AAFF0C00BF
                FFF000C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFD00C3
                FF72000000000000000000000000000000000000000000C0FF4100C2FF150000
                0000000000000000000000000000000000000000000000000000FFFFFF2DFFFF
                FF8AFFFFFFA3FFFFFF41FFFFFF02000000000000000000000000000000000000
                0000FFFFFF24FFFFFF80FFFFFFA1FFFFFF49FFFFFF0900000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF06FFFFFF68FFFFFFDEFFFFFFB6FFFFFF86FFFFFF76FFFFFF7FFFFF
                FF9AFFFFFFBBFFFFFF87FFFFFF22000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000C3
                FF1100C0FFA900BFFF6F0000000000000000000000000000000000BFFFA400C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00BFFFA800C3FF220000FF01000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000C1FF2500C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FF950000000000000000000000000000000000BFFF1800C1
                FFED00C0FF710000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF2AFFFFFF94FFFFFFBEFFFFFF95FFFFFF7CFFFF
                FF79FFFFFF89FFFFFFB0FFFFFFB0FFFFFF51FFFFFF07FFFFFF2CFFFFFF160000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF06FFFFFF3CFFFFFF33FFFFFF2CFFFF
                FF35FFFFFF30FFFFFF21FFFFFF09000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000BFFF0C00BFFF040000000000000000000000000000
                000000BFFF8800C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFE00C1FFD900C1FF6200CCFF05000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000BDFF2300C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00BFFF930000000000000000000000000000
                00000000000000BDFF6500BFFF67000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF0CFFFF
                FF24FFFFFF32FFFFFF34FFFFFF2AFFFFFF15FFFFFF0100000000FFFFFF01FFFF
                FFCFFFFFFF750000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF09FFFFFF050000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000C2FF4B00BEFF7D00AAFF0900000000000000000000
                0000000000000000000000C0FF4500C0FFF400C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFA00BF
                FF7800BFFF040000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000BCFF2200C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FF92000000000000
                0000000000000000000000000000000000000000000000FFFF02000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF71FFFFFF5E000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FFB4FFFFFF680000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000B9FF0B00BFFFB400BFFFC200B6FF0E0000
                00000000000000000000000000000000000000B1FF0D00C1FF9500C1FFFD00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFC00C0FF9500C6FF120000000000000000000000000000
                000000000000000000000000000000000000000000000000000000BCFF2200C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FF9200000000000000000000000000000000000000000000000000BBFF1E00C0
                FF8D00C1FF250000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF03FFFFFFD5FFFFFF43000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000FFFF0100BFFF3800C1
                FF3A0000000000000000000000000000000000000000000000000000000000CC
                FF0500BFFF5C00C0FFE700C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFC00C1FF8F000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000BCFF2200C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FF9200000000000000000000000000000000000000000000
                000000B9FF0B00C0FFF100BEFF6E000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF0EFFFFFF99FFFF
                FF56000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF03FFFFFF29FFFFFF22FFFF
                FF41FFFFFF1CFFFFFF19FFFFFF2EFFFFFF0D0000000000000000000000000000
                0000000000000000000000000000FFFFFF01FFFFFF0100000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000B8
                FF120000FF010000000000000000000000000000000000000000000000000000
                00000000000000000000000000000099FF0500BCFF1300BDFF1F00BDFF1B00BF
                FF3400C0FF5900C0FF8E00C0FFC200C0FFF600C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFC00C0FF8900BFFF0800000000000000000000000000000000000000000000
                0000000000000000000000BCFF2200C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FF920000000000000000000000000000
                000000000000000000000000000000BFFF5000C1FF2D00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF0CFFFFFFC1FFFFFF9A00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF06FFFFFF46FFFF
                FF0BFFFFFF05FFFFFF010000000000000000FFFFFF0BFFFFFF3AFFFFFF3A0000
                000000000000000000000000000000000000FFFFFF56FFFFFF4BFFFFFF030000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000080FF0400C0FFD500C0FF4D000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000080FF0200C8FF0E00BFFF3400C0FFB900C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFA00BEFF620000000000000000000000000000
                00000000000000000000000000000000000000BCFF2200C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FF92000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF01FFFFFF1BFFFFFF130000000000000000000000000000
                00000000000000000000FFFFFF05FFFFFF3BFFFFFF1AFFFFFF37FFFFFF5EFFFF
                FF34FFFFFF2D0000000000000000000000000000000000000000FFFFFF14FFFF
                FF410000000000000000FFFFFF1EFFFFFF0BFFFFFF1AFFFFFF12FFFFFF0B0000
                0000FFFFFF0BFFFFFF2E000000000000000000000000FFFFFF04FFFFFFC5FFFF
                FFBDFFFFFF040000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000BEFF3F00C0FFE100BEFF3700000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000FFFF0100BFFF5400C0FFD200C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFE300BCFF220000
                000000000000000000000000000000000000000000000000000000BCFF2200C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FF920000000000000000000000000000000000000000000000000000000000B6
                FF0700BFFF8300C0FF9A00000000000000000000000000000000000000000000
                00000000000000000000FFFFFF10FFFFFF0AFFFFFF0900000000000000000000
                000000000000000000000000000000000000FFFFFF08FFFFFF23FFFFFF0A0000
                0000000000000000000000000000FFFFFF15FFFFFF36FFFFFF18000000000000
                000000000000FFFFFF05FFFFFF23FFFFFF2AFFFFFF080000000000000000FFFF
                FF11FFFFFF32FFFFFF03FFFFFF2DFFFFFF63FFFFFFABFFFFFF7DFFFFFFA0FFFF
                FF8FFFFFFF7DFFFFFF27FFFFFF01FFFFFF21FFFFFF360000000000000000FFFF
                FF03FFFFFF4BFFFFFF4C00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000BFFF1000BEFF2F00B3FF0A0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000BFFF2000C1FFA800C0FFFE00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFD000BFFF0C00000000000000000000000000000000000000000000
                000000BBFF2900C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00BEFF9A00000000000000000000000000000000000000000000
                00000000000000FFFF0100C1FF9700C0FFE100B6FF1500000000000000000000
                00000000000000000000FFFFFF2DFFFFFF23FFFFFF40FFFFFF24FFFFFF2CFFFF
                FF43FFFFFF050000000000000000000000000000000000000000FFFFFF33FFFF
                FFD3FFFFFF41000000000000000000000000FFFFFF34FFFFFF1FFFFFFF060000
                00000000000000000000000000000000000000000000FFFFFF08FFFFFF41FFFF
                FF2800000000FFFFFF14FFFFFF0DFFFFFF01FFFFFF8CFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CFFFFFF06FFFFFF01FFFFFF28FFFF
                FF0400000000FFFFFF02FFFFFF06000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000BFFF0400C3FF1100BF
                FF04000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000CC
                FF0500C0FF9A00C0FFFC00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00BFFF6B0000FF0100000000000000000000
                0000000000000000000000BEFF2B00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FF9D0000000000000000000000000000
                00000000000000000000000000000000000000C1FF2500BFFF2C00FFFF020000
                00000000000000000000FFFFFF13FFFFFF5F0000000000000000000000000000
                00000000000000000000FFFFFF1CFFFFFF41FFFFFF0400000000000000000000
                0000FFFFFF1AFFFFFFD7FFFFFF4D0000000000000000FFFFFF13FFFFFF130000
                0000FFFFFF09FFFFFF1BFFFFFF1BFFFFFF1BFFFFFF1BFFFFFF1BFFFFFF1BFFFF
                FF0700000000FFFFFF13FFFFFF0BFFFFFF3BFFFFFF03FFFFFF04FFFFFFA2FFFF
                FFFBFFFFFFEEFFFFFFFEFFFFFFE7FFFFFFE7FFFFFFFDFFFFFF96FFFFFF170000
                0000FFFFFF22FFFFFF1600000000FFFFFF35FFFFFFB1FFFFFF25000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000BC
                FF2E00C0FFBE00C1FF4200000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000BFFF1000C1FFA000C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFCB00C3FF110000
                00000000000000000000000000000000000000CCFF0A00BFFFEC00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFC00C0FF6E000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF04FFFFFF3BFFFFFF01000000000000
                00000000000000000000000000000000000000000000FFFFFF10FFFFFF3F0000
                00000000000000000000FFFFFF01FFFFFF14FFFFFF0400000000FFFFFF01FFFF
                FF23FFFFFF6FFFFFFF67FFFFFF84FFFFFFD9FFFFFFDDFFFFFFDDFFFFFFDDFFFF
                FFDDFFFFFFDDFFFFFF78FFFFFF67FFFFFF60FFFFFF19FFFFFF3800000000FFFF
                FF09FFFFFFC8FFFFFFF9FFFFFF31FFFFFF63FFFFFF26FFFFFF1CFFFFFFF7FFFF
                FFC1FFFFFF3200000000FFFFFF04FFFFFF2200000000FFFFFF4CFFFFFFEAFFFF
                FF1C000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000BDFF4600C0FFE800BEFF2B0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000BFFFC400C0
                FFFE00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFE00BFFF5000000000000000000000000000000000000000000000000000BF
                FF6300C0FFF900C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFDB00BF
                FF28000000000000000000000000000000000000000000000000000000000000
                00000000000000BFFFB000C1FF8000000000FFFFFF0AFFFFFF45000000000000
                00000000000000000000FFFFFF2CFFFFFF4EFFFFFF0300000000000000000000
                0000FFFFFF01FFFFFF3D000000000000000000000000FFFFFF24FFFFFF270000
                0000FFFFFF1AFFFFFF49FFFFFFBEFFFFFFF2FFFFFFF5FFFFFFD2FFFFFFDFFFFF
                FFFAFFFFFFF8FFFFFFDBFFFFFFD0FFFFFFF7FFFFFFEEFFFFFF9EFFFFFF66FFFF
                FF2C00000000FFFFFF04FFFFFFA7FFFFFFFFFFFFFF5AFFFFFF1AFFFFFF6EFFFF
                FF23FFFFFFF7FFFFFF9BFFFFFF1900000000FFFFFF03FFFFFF1C00000000FFFF
                FF13FFFFFF3EFFFFFF0400000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000C3FF1100C1FF420099FF05000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000BFFF3800C0FFED00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00BFFFCF00BFFF040000000000000000000000000000
                00000000000000BFFF0400C0FF7D00C0FFF300C0FFFF00C0FFFF00C1FFFD00C1
                FFC900BEFF430000000000000000000000000000000000000000000000000000
                000000000000000000000000000000C0FFA600BFFFA700000000FFFFFF1FFFFF
                FF1100000000000000000000000000000000FFFFFFD4FFFFFFFBFFFFFF2B0000
                0000000000000000000000000000FFFFFF27FFFFFF090000000000000000FFFF
                FFACFFFFFFA400000000FFFFFF1FFFFFFF0BFFFFFF11FFFFFF55FFFFFFF0FFFF
                FF67FFFFFF23FFFFFFD9FFFFFFC8FFFFFF24FFFFFF90FFFFFFD8FFFFFF3DFFFF
                FF09FFFFFF32FFFFFF7800000000FFFFFF09FFFFFFC6FFFFFFFFFFFFFF9DFFFF
                FF04FFFFFFC3FFFFFF21FFFFFFF7FFFFFFBEFFFFFF3100000000FFFFFF12FFFF
                FF45000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000BFFF7400C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FF3D000000000000
                0000000000000000000000000000000000000000000000CCFF0F00C0FF6A00BF
                FF8700BFFF4C0099FF0500000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000BFFF1400AAFF0C0000
                0000FFFFFF36FFFFFF040000000000000000FFFFFF06FFFFFF08FFFFFF64FFFF
                FFA7FFFFFF04FFFFFF2AFFFFFF010000000000000000FFFFFF23FFFFFF1C0000
                000000000000FFFFFF5BFFFFFF6600000000FFFFFF19FFFFFF0700000000FFFF
                FF8EFFFFFFFFFFFFFF80FFFFFF44FFFFFFFFFFFFFFF6FFFFFF41FFFFFFDBFFFF
                FFF7FFFFFF2A00000000FFFFFF2AFFFFFF1BFFFFFF0FFFFFFF05FFFFFFAAFFFF
                FFFFFFFFFFFAFFFFFFF0FFFFFFFCFFFFFFEEFFFFFFFEFFFFFF9EFFFFFF1C0000
                0000FFFFFF36FFFFFF0500000000FFFFFF71FFFFFFB300000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000BE
                FF7500C0FF790000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000099FF0500C0FFC700C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FF8E000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000080FF0200000000FFFFFF270000000000000000FFFFFF01FFFFFF40FFFF
                FFC2FFFFFF81FFFFFF78FFFFFFBAFFFFFF8AFFFFFF250000000000000000FFFF
                FF15FFFFFF1B0000000000000000000000000000000000000000FFFFFF21FFFF
                FF12FFFFFF01FFFFFFB9FFFFFFFFFFFFFFACFFFFFF9BFFFFFFFFFFFFFFFCFFFF
                FF87FFFFFFF2FFFFFFFFFFFFFF5200000000FFFFFF3EFFFFFF0AFFFFFF100000
                0000FFFFFF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF710000000000000000FFFFFF320000000000000000FFFFFF80FFFFFFBC0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000BFFFAB00BEFF9E000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000C0FF5500C0FFFA00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFC500B1FF0D000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000BBFF3800C0FFD300000000FFFFFF060000000000000000FFFF
                FF57FFFFFFC2FFFFFF32FFFFFF65FFFFFF6EFFFFFF29FFFFFF8EFFFFFFD40000
                000000000000FFFFFF04FFFFFF050000000000000000FFFFFF45FFFFFF8A0000
                0000FFFFFF03FFFFFF1C00000000FFFFFF6DFFFFFFFDFFFFFF7CFFFFFF7CFFFF
                FFFFFFFFFFFBFFFFFF67FFFFFFBFFFFFFFF5FFFFFF28FFFFFF04FFFFFF10FFFF
                FF02FFFFFF3EFFFFFF03FFFFFF07FFFFFF15FFFFFF6EFFFFFF35FFFFFF61FFFF
                FF4CFFFFFF35FFFFFF05FFFFFF01FFFFFF3A0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000BFFF3000BFFF2C00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000BFFF2400C0FFDC00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFE100BBFF1E00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000BEFF3700C1FFED00000000FFFFFF32FFFF
                FF01FFFFFF2DFFFFFF6BFFFFFF92FFFFFFC2FFFFFFACFFFFFFA7FFFFFFC2FFFF
                FFA8FFFFFF66FFFFFF86FFFFFF08FFFFFF1EFFFFFF1A0000000000000000FFFF
                FF61FFFFFFCC0000000000000000FFFFFF50FFFFFF0500000000FFFFFF1DFFFF
                FF06FFFFFF1CFFFFFFA7FFFFFFA8FFFFFF1EFFFFFF04FFFFFF1BFFFFFF01FFFF
                FF1BFFFFFF2500000000FFFFFF04FFFFFF50FFFFFF1900000000FFFFFF08FFFF
                FF02FFFFFF07FFFFFF05FFFFFF0300000000FFFFFF5EFFFFFF17000000000000
                000000000000FFFFFF2BFFFFFF3B000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000BFFF0400C1FFB800C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFF700BCFF2E0000
                0000000000000000000000000000000000000000000000000000FFFFFF05FFFF
                FF13FFFFFF020000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000C1FF3100C0FFE00000
                0000FFFFFF2BFFFFFF05FFFFFF1CFFFFFFBCFFFFFFC8FFFFFF77FFFFFF46FFFF
                FF42FFFFFF63FFFFFFB1FFFFFFDFFFFFFF3DFFFFFF01FFFFFF22FFFFFF0D0000
                000000000000FFFFFF11FFFFFF27000000000000000000000000FFFFFF4FFFFF
                FF01000000000000000000000000FFFFFF09FFFFFF0700000000000000000000
                000000000000FFFFFF56FFFFFF04000000000000000000000000FFFFFF2FFFFF
                FF2BFFFFFF16FFFFFF0AFFFFFF16FFFFFF1DFFFFFF19FFFFFF39000000000000
                0000000000000000000000000000FFFFFF8EFFFFFFC200000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000BF
                FF7700C0FF6A0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000BF
                FF7C00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00BFFF570000000000000000000000000000000000000000FFFFFF25FFFF
                FF9AFFFFFFEEFFFFFFFEFFFFFFE7FFFFFF79FFFFFF1500000000000000000000
                00000000000000000000000000000000000000000000000000000000000000C1
                FF3A00C0FFED00000000FFFFFF1FFFFFFF1A00000000FFFFFF04FFFFFF67FFFF
                FFBDFFFFFFD4FFFFFFD5FFFFFFC9FFFFFF87FFFFFF1200000000FFFFFF0AFFFF
                FF2EFFFFFF050000000000000000FFFFFF4BFFFFFF9300000000000000000000
                0000FFFFFF0DFFFFFF2EFFFFFF02000000000000000000000000000000000000
                000000000000FFFFFF0AFFFFFF34000000000000000000000000000000000000
                000000000000FFFFFF04FFFFFF1BFFFFFF0FFFFFFF23FFFFFF24FFFFFF0BFFFF
                FF020000000000000000000000000000000000000000FFFFFF4DFFFFFF6C0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000C0FFA300C0FFA5000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000C1FF4A00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C1FF7B00000000000000000000000000000000FFFF
                FF13FFFFFFCCFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFB3FFFF
                FF14000000000000000000000000000000000000000000000000000000000000
                00000000000000C2FF1500BFFF540000000000000000FFFFFF45FFFFFF0A0000
                000000000000FFFFFF08FFFFFF1BFFFFFF1CFFFFFF0D00000000000000000000
                0000FFFFFF42FFFFFF0B000000000000000000000000FFFFFF72FFFFFFC60000
                00000000000000000000FFFFFF01FFFFFF18FFFFFF33FFFFFF1FFFFFFF120000
                000000000000FFFFFF0EFFFFFF2DFFFFFF35FFFFFF0F00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000BDFF3600BCFF3500000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000C4FF2B00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C1FF9100000000000000000000
                000000000000FFFFFF9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFAFFFFFF6100000000000000000000000000000000000000000000
                000000000000000000000000000000FFFF010000000000000000000000000000
                0000FFFFFF3BFFFFFF19FFFFFF05000000000000000000000000000000000000
                0000FFFFFF09FFFFFF40FFFFFF0D00000000000000000000000000000000FFFF
                FF06FFFFFF10000000000000000000000000000000000000000000000000FFFF
                FF0FFFFFFF52FFFFFF50FFFFFF20FFFFFF3CFFFFFF0200000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF3BFFFFFF99000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000C3FF1E00C1FFFE00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00BFFF970000
                00000000000000000000FFFFFF0BFFFFFFF6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA30000000000000000000000000000
                0000000000000000000000000000000000000000000000C1FF6200C0FF690000
                00000000000000000000FFFFFF03FFFFFF12FFFFFF35FFFFFF3AFFFFFF09FFFF
                FF13FFFFFF26FFFFFF2AFFFFFF3DFFFFFF050000000000000000000000000000
                000000000000FFFFFF1FFFFFFF14000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF59FFFFFFF5FFFFFF0D000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000BD
                FF3600C0FFBD00BBFF0F00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000B6
                FF0E00C0FFFE00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00BFFFA0000000000000000000000000FFFFFF16FFFFFFFEFFFFFFFFFFFF
                FFFFFFFFFFFEFFFFFFFAFFFFFFB4FFFFFF8AFFFFFFE1FFFFFF44000000000000
                00000000000000000000000000000000000000000000000000000000000000BF
                FFBC00BEFF9A000000000000000000000000000000000000000000000000FFFF
                FF0EFFFFFF0EFFFFFF2DFFFFFF12FFFFFF030000000000000000000000000000
                0000000000000000000000000000FFFFFFBCFFFFFF9D00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF21FFFFFF58FFFF
                FF09000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000BCFF4100C0FFEF00C2FF430000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000FFFF0100C0FFFC00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00BFFFBF000000000000000000000000FFFFFF04FFFF
                FFE1FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFCCFFFFFFACFFFFFF7BFFFFFFC9FFFF
                FF0E000000000000000000000000000000000000000000000000000000000000
                00000000000000BEFF6200C2FF43000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF96FFFFFF690000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000BCFF1300BEFF4700C4FF0D000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000BFFFE400C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFF000CCFF05000000000000
                000000000000FFFFFF5BFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF7AFFFFFF5BFFFF
                FFE3FFFFFF430000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF05FFFFFF040000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF16FFFFFFA5FFFFFF640000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000080
                FF0200FFFF010000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000C0FFB300C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C1
                FF5E000000000000000000000000FFFFFF05FFFFFF90FFFFFFF7FFFFFFFEFFFF
                FFC9FFFFFFADFFFFFF4A00000000000000000000000000000000000000000000
                00000000000000000000000000000000000000C1FF4E00BFFF6C00C6FF090000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF16FFFFFF51FFFFFF15000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF0CFFFFFFD5FFFFFFA2000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000BFFF4800C0FFB900BDFF23000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000BFFF7000C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFC900C9FF13000000000000000000000000FFFFFF07FFFF
                FF2CFFFFFF87FFFFFF31FFFFFF06000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000AAFF0600C0FFB300C0
                FFD300CCFF050000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF57FFFFFFEBFFFFFF3600000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF17FFFF
                FF03000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000C2FF2A00C0FFEE00C2FF4300000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000BFFF3000C0FFF200C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFF800BFFF7300000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000AA
                FF0600C1FF5600C0FF5D00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF38FFFFFF89FFFFFF160000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF07FFFFFF34FFFFFF0C000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000C3FF4800C6FF120000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000C6FF1200C0FFC500C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFF100BF
                FF6B00FFFF010000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF34FFFFFFF0FFFFFF42FFFFFF21FFFFFF2BFFFF
                FF2FFFFFFF2DFFFFFF26FFFFFF17FFFFFF050000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000C4FF0D00B9FF0B00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000C0
                FF7E00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFF800BFFF8400C2FF1900AAFF0300000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000FFFF0100C0FF9A00BFFF4C00000000000000000000
                00000000000000000000000000000000000000000000FFFFFF08FFFFFF1AFFFF
                FF27FFFFFF2DFFFFFF2EFFFFFF2AFFFFFF1FFFFFFF0FFFFFFF0100000000FFFF
                FF11FFFFFF95FFFFFF3F00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF01FFFFFF38FFFFFFF2FFFFFFA0FFFF
                FF75FFFFFF66FFFFFF60FFFFFF63FFFFFF6FFFFFFF85FFFFFF9AFFFFFF56FFFF
                FF09000000000000000000000000000000000000000000000000000000000000
                00000000000000BBFF0F00BFFF9B00BFFF800000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000BDFF1B00C1FFE900C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFD00C0FFD200BFFF9400C0
                FF5900BFFF3400C4FF2700B6FF0E000000000000000000000000000000000000
                00000000000000000000000000000000000000C2FF2E00C0FFEF00C1FF4E0000
                00000000000000000000000000000000000000000000FFFFFF0CFFFFFF63FFFF
                FF95FFFFFF80FFFFFF6CFFFFFF62FFFFFF61FFFFFF66FFFFFF79FFFFFF93FFFF
                FF81FFFFFF24FFFFFF23FFFFFFE9FFFFFF3A0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF13FFFFFF88FFFFFFA8FFFF
                FF2D00000000000000000000000000000000000000000000000000000000FFFF
                FF09FFFFFF7CFFFFFFB2FFFFFF30FFFFFF030000000000000000000000000000
                000000000000000000000000000000FFFF0100C0FF9100C1FFCC00C2FF190000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000C0FF4D00C1FFF900C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00BFFFEC00C1FF6600B9FF0B0000
                00000000000000000000000000000000000000000000000000000000000000BE
                FF3300C8FF0E00000000000000000000000000000000FFFFFF04FFFFFF45FFFF
                FFC3FFFFFF69FFFFFF0A00000000000000000000000000000000000000000000
                000000000000FFFFFF3AFFFFFFBBFFFFFF7AFFFFFF2CFFFFFF02000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF43FFFFFF9FFFFF
                FF49FFFFFF050000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF28FFFFFF88FFFFFF69000000000000
                000000000000000000000000000000000000000000000000000000BDFF1B00C3
                FF260000FF010000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000BFFF0400C0
                FFA600C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFD00BFFFA700C2FF15000000000000000000000000000000000000000000B9
                FF1D00C2FF150000000000000000000000000000000000000000FFFFFF12FFFF
                FF8DFFFFFF7AFFFFFF1900000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF08FFFFFF55FFFFFF96FFFF
                FF26000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF22FFFF
                FFABFFFFFF080000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF04FFFF
                FF8CFFFFFF830000000000000000000000000000000000000000000000000000
                0000000000000000000000BEFF3300C4FF0D0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000BFFF1800C0FFEF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFC00C2FF650000000000000000000000000000
                00000000000000C0FFB600BFFFBA000000000000000000000000000000000000
                0000FFFFFF95FFFFFF4E00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF25FFFFFFD4FFFFFF23000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF25FFFFFFB5FFFFFF250000000000000000000000000000000000000000FFFF
                FF02FFFFFF1BFFFFFF2FFFFFFF2DFFFFFF18FFFFFF0100000000000000000000
                000000000000FFFFFF05FFFFFF85FFFFFF580000000000000000000000000000
                000000000000000000000000000000C3FF1100C0FFC100C0FFB700BFFF0C0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000C3FF2200C0FFC900C0FFFE00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFA6000000000000
                0000000000000000000000C2FF1500C0FFB900BFFF4000000000000000000000
                0000FFFFFF01FFFFFF72FFFFFF6AFFFFFF020000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF2FFFFFFF90FFFFFF06000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF06FFFFFF90FFFFFF24000000000000000000000000000000000000
                0000FFFFFF2DFFFFFFB4FFFFFFE5FFFFFFECFFFFFFECFFFFFFE6FFFFFFADFFFF
                FF2700000000000000000000000000000000FFFFFF0FFFFFFF9AFFFFFF050000
                000000000000000000000000000000000000000000000000FF0100BFFF5800C1
                FF9400B6FF070000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000000000C1
                FF2500C0FFD300C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFB1000000000000000000000000000000000000000000BFFF0C00AAFF030000
                00000000000000000000FFFFFF40FFFFFFB3FFFFFF76FFFFFF8AFFFFFF8AFFFF
                FF8AFFFFFF8AFFFFFF8AFFFFFF8AFFFFFF8AFFFFFF8AFFFFFF8AFFFFFF8AFFFF
                FF8AFFFFFF8AFFFFFF8AFFFFFF8AFFFFFF8AFFFFFF8AFFFFFF86FFFFFF8DFFFF
                FF83000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF2BFFFFFF7D0000000000000000000000000000
                000000000000FFFFFF5AFFFFFFECFFFFFFD3FFFFFF9CFFFFFF75FFFFFF7AFFFF
                FFA7FFFFFFD9FFFFFFF7FFFFFF7CFFFFFF0D000000000000000000000000FFFF
                FF4FFFFFFF920000000000000000000000000000000000000000000000000000
                0000000000000000000000B3FF0A00BDFF1F0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000C4FF0D00C0FF9500C0FFEF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFE00C0FF85000000000000000000B9FF0B00BFFF8C00BEFF2B0000
                0000000000000000000000000000FFFFFF07FFFFFF8FFFFFFF14FFFFFF5CFFFF
                FFC5FFFFFFB0FFFFFFB0FFFFFFB0FFFFFFB0FFFFFFA6FFFFFF63FFFFFF55FFFF
                FF55FFFFFF55FFFFFF8FFFFFFFB0FFFFFFB0FFFFFFB0FFFFFFB0FFFFFFBDFFFF
                FF85FFFFFF17FFFFFFC7FFFFFF2B000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF91FFFFFF38000000000000
                00000000000000000000FFFFFF53FFFFFFF1FFFFFF8CFFFFFF48FFFFFF62FFFF
                FF24FFFFFF1CFFFFFF68FFFFFF55FFFFFF8AFFFFFFCCFFFFFF67000000000000
                000000000000FFFFFF05FFFFFFC8FFFFFF210000000000000000000000000000
                000000000000000000000000000000FFFF0100C2FF7900C1FFDD00C5FF1F0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000CCFF0500C3FF2F00C1
                FFAD00C0FFFA00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0FFFF00C0
                FFFF00C0FFFF00C0FFFF00C0FFE900C0FF35000000000000000000C0FF7D00BF
                FFE000C1FF2500000000000000000000000000000000FFFFFF20FFFFFF7D0000
                0000FFFFFF06FFFFFF4CFFFFFF73FFFFFF68FFFFFF68FFFFFF68FFFFFF67FFFF
                FF5EFFFFFF5AFFFFFF5AFFFFFF5AFFFFFF65FFFFFF68FFFFFF68FFFFFF68FFFF
                FF69FFFFFF4AFFFFFF0900000000FFFFFF28FFFFFF82FFFFFF01000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF0FFFFFFFCAFFFF
                FF06000000000000000000000000FFFFFF13FFFFFFD3FFFFFFCBFFFFFF8AFFFF
                FFFCFFFFFFEBFFFFFFF4FFFFFFDDFFFFFFFEFFFFFFF8FFFFFFABFFFFFF180000
                000000000000000000000000000000000000FFFFFF56FFFFFF5A000000000000
                000000000000000000000000000000000000000000000000000000BFFF3000C0
                FFD600C1FF5B0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000080FF0200BFFF3800BFFF9C00C0FFD000C0FFEA00C0FFFA00C0
                FFFE00C0FFFF00C0FFFF00C0FFFC00C0FFDD00BEFF5E000000000000FF010099
                FF0500AAFF0300C2FF360000FF0100000000000000000000000000000000FFFF
                FF63FFFFFF4E000000000000000000000000FFFFFF88FFFFFFB0FFFFFFAFFFFF
                FFAFFFFFFFAFFFFFFFAFFFFFFFAFFFFFFFAFFFFFFFAFFFFFFFAFFFFFFFAFFFFF
                FFAFFFFFFFAFFFFFFF9CFFFFFF12000000000000000000000000FFFFFF88FFFF
                FF0D000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF47FFFFFF8A00000000000000000000000000000000FFFFFF43FFFFFFF0FFFF
                FF85FFFFFFDEFFFFFFDFFFFFFF41FFFFFF79FFFFFFFFFFFFFFFBFFFFFF6FFFFF
                FFF0FFFFFFA3FFFFFF0B00000000000000000000000000000000FFFFFF09FFFF
                FF7DFFFFFF010000000000000000000000000000000000000000000000000000
                00000000000000BFFF240080FF0400BFFF0C00BFFF1000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000FF0100C5FF1600C0
                FF3500C1FF4E00BEFF6A00BEFF8100BFFF8800BFFF6800C1FF250000000000FF
                FF0100C0FF7600BEFF6E00000000000000000000000000000000000000000000
                000000000000FFFFFFA5FFFFFF24000000000000000000000000FFFFFFC8FFFF
                FF86FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFF
                FF99FFFFFF99FFFFFF99FFFFFF6DFFFFFFE5FFFFFF2500000000000000000000
                0000FFFFFF7BFFFFFF1800000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF6DFFFFFF5700000000000000000000000000000000FFFF
                FF60FFFFFFFBFFFFFF52FFFFFFF4FFFFFFBB00000000FFFFFF0BFFFFFFDBFFFF
                FFFFFFFFFF22FFFFFF6CFFFFFFEEFFFFFF370000000000000000000000000000
                000000000000FFFFFF81FFFFFF04000000000000000000000000000000000000
                00000000000000000000000000000000000000B6FF0700C1FFB400C0FFB500C6
                FF12000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000BEFF5300C0FFF700BFFF840000000000000000000000000000
                0000000000000000000000000000FFFFFFD1FFFFFF0900000000000000000000
                0000FFFFFFC1FFFFFF94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFFFFFFE5FFFFFF250000
                00000000000000000000FFFFFF6EFFFFFF240000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF7DFFFFFF3E00000000000000000000
                000000000000FFFFFF6EFFFFFFFBFFFFFF3CFFFFFFF6FFFFFFC1FFFFFF01FFFF
                FF05FFFFFFACFFFFFFFFFFFFFF41FFFFFF06FFFFFFDEFFFFFF77000000000000
                0000000000000000000000000000FFFFFF80FFFFFF0600000000000000000000
                000000000000000000000000000000000000000000000000000000FFFF0100C1
                FF4A00BFFFBC00BCFF2A00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000B4FF1100BFFF0800C6FF0900BEFF5A00AAFF0C000000000000
                000000000000000000000000000000000000FFFFFF04FFFFFFD2FFFFFF030000
                00000000000000000000FFFFFFC1FFFFFF94FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFFFF
                FFE5FFFFFF25000000000000000000000000FFFFFF67FFFFFF30000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF7AFFFFFF420000
                0000000000000000000000000000FFFFFF67FFFFFFFBFFFFFF3AFFFFFFEBFFFF
                FFD7FFFFFF10FFFFFF01FFFFFF8DFFFFFFFFFFFFFF6500000000FFFFFFAFFFFF
                FFA30000000000000000000000000000000000000000FFFFFF80FFFFFF050000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000BDFF1B00BFFF3400FFFF020000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000C2FF1900C0FFCE00C0FF990080FF02000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF02FFFF
                FFD4FFFFFF04000000000000000000000000FFFFFFC1FFFFFF94FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF6FFFFFFFE5FFFFFF25000000000000000000000000FFFFFF68FFFF
                FF2F000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF61FFFFFF6600000000000000000000000000000000FFFFFF4EFFFFFFF5FFFF
                FF50FFFFFFCFFFFFFFEDFFFFFF3DFFFFFF01FFFFFF8AFFFFFFFFFFFFFF850000
                0000FFFFFFB5FFFFFFA10000000000000000000000000000000000000000FFFF
                FF81FFFFFF030000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000C0FF6900C1
                FFE900C1FF4E0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000BEFF3B00C0FFB300C1FF4200FF
                FF01000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFFC4FFFFFF11000000000000000000000000FFFFFFC1FFFF
                FF94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFF6FFFFFFFE5FFFFFF2500000000000000000000
                0000FFFFFF72FFFFFF2000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF37FFFFFFA100000000000000000000000000000000FFFF
                FF27FFFFFFE2FFFFFF9CFFFFFF76FFFFFFFEFFFFFFBBFFFFFF34FFFFFFCDFFFF
                FFFFFFFFFFA1FFFFFF05FFFFFFE6FFFFFF7C0000000000000000000000000000
                0000FFFFFF14FFFFFF780000000000000000000000000000000000000000FFFF
                FF03FFFFFF29FFFFFF27FFFFFF43FFFFFF79FFFFFF2CFFFFFF19000000000000
                000000AAFF0600BFFF5C00B9FF0B0000000000BEFF3700000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000BFFF1C00BFFF9B00BDFF1B00FFFF0100AA
                FF06000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF92FFFFFF3000000000000000000000
                0000FFFFFFC1FFFFFF94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFFFFFFE5FFFFFF250000
                00000000000000000000FFFFFF7FFFFFFF150000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF06FFFFFFC3FFFFFF12000000000000
                000000000000FFFFFF02FFFFFF99FFFFFFE8FFFFFF46FFFFFF9BFFFFFFEDFFFF
                FFFAFFFFFFCAFFFFFFDFFFFFFFA5FFFFFF81FFFFFFF0FFFFFF3B000000000000
                00000000000000000000FFFFFF7EFFFFFF480000000000000000000000000000
                0000FFFFFF1AFFFFFF2CFFFFFF1E000000000000000000000000FFFFFF0BFFFF
                FF23FFFFFF2AFFFFFF0A00000000000000000000000000BFFF2C00C0FFF700BF
                FF9F00B9FF0B0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000D5FF0600AAFF0600BFFF0800C1FFCC00C1FFC400BE
                FF2B000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF4AFFFFFF5F0000
                00000000000000000000FFFFFFC1FFFFFF94FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFFFF
                FFE5FFFFFF250000000000000000FFFFFF05FFFFFF8BFFFFFF08000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF6DFFFF
                FF4F00000000000000000000000000000000FFFFFF10FFFFFFCEFFFFFFE4FFFF
                FF68FFFFFF2FFFFFFF33FFFFFF17FFFFFF1FFFFFFF8AFFFFFFF3FFFFFFABFFFF
                FF0A000000000000000000000000FFFFFF10FFFFFFE0FFFFFF0C000000000000
                000000000000FFFFFF32FFFFFF2AFFFFFF050000000000000000000000000000
                00000000000000000000FFFFFF09FFFFFF50FFFFFF1D000000000000000000AA
                FF0900BEFF3700BFFF6800CCFF0500BEFF2B00C0FF5D00B9FF0B000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000C5FF3500C0FFB300C1FF660000000000BD
                FF1F00BFFF140000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF17FFFFFF86000000000000000000000000FFFFFFC1FFFFFF94FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF70FFFFFFE5FFFFFF250000000000000000FFFFFF5AFFFFFF6A0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF16FFFFFF8DFFFFFF0200000000000000000000000000000000FFFF
                FF22FFFFFFBAFFFFFFF6FFFFFFDFFFFFFFB4FFFFFFB4FFFFFFE2FFFFFFF1FFFF
                FFAAFFFFFF12000000000000000000000000FFFFFF02FFFFFF70FFFFFF5C0000
                00000000000000000000FFFFFF25FFFFFF29FFFFFF4AFFFFFF4AFFFFFF4AFFFF
                FF43FFFFFF39FFFFFF39FFFFFF46FFFFFF4AFFFFFF4AFFFFFF4BFFFFFF20FFFF
                FF0F000000000000000000000000000000000000000000BEFF5A00C0FFE100BF
                FFA70080FF0200B9FF1600C2FF3200BCFF130000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000BCFF1300C1FF4A00BFFF4C0000000000C2FF4700C0FFBF00BE
                FF5E000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF03FFFFFF80FFFFFF3C0000000000000000FFFFFFC5FFFF
                FF95FFFFFF90FFFFFF90FFFFFF90FFFFFF90FFFFFF90FFFFFF90FFFFFF90FFFF
                FF90FFFFFF90FFFFFF90FFFFFF82FFFFFFE2FFFFFF2200000000FFFFFF1BFFFF
                FFD1FFFFFF150000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF02FFFFFF6DFFFFFF6B00000000000000000000
                00000000000000000000FFFFFF13FFFFFF45FFFFFF87FFFFFFAEFFFFFFACFFFF
                FF89FFFFFF41FFFFFF0900000000000000000000000000000000FFFFFF21FFFF
                FF90FFFFFF030000000000000000FFFFFF01FFFFFF1CFFFFFF22FFFFFF8AFFFF
                FF8AFFFFFF8AFFFFFF7BFFFFFF58FFFFFF58FFFFFF83FFFFFF8AFFFFFF8DFFFF
                FF64FFFFFF12FFFFFF0C000000000000000000000000000000000000000000BF
                FF0800BFFF2800BCFF220000000000C1FF7B00C0FFE700C0FF7A0000000000BF
                FF3C00C0FF7100C1FF310000000000BAFF1A00BFFF3800C1FF210000000000BE
                FF3300BEFF8900C1FF6700AAFF0300BEFF4300C1FFF100BFFFA700B6FF0700BF
                FF0400BBFF0F0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF1BFFFFFFCFFFFFFF1C0000
                0000FFFFFF34FFFFFF48FFFFFF48FFFFFF48FFFFFF48FFFFFF48FFFFFF48FFFF
                FF48FFFFFF48FFFFFF48FFFFFF48FFFFFF48FFFFFF48FFFFFF3DFFFFFF06FFFF
                FF05FFFFFF88FFFFFF3C00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF07FFFFFFB2FFFF
                FF47FFFFFF010000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF19FFFFFFAEFFFFFF34000000000000000000000000FFFFFF20FFFFFF340000
                0000FFFFFF3FFFFFFFA3FFFFFFA3FFFFFFA3FFFFFFA3FFFFFFA3FFFFFFA3FFFF
                FFA3FFFFFF84FFFFFF0EFFFFFF07FFFFFF490000000000000000000000000000
                0000000000000000000000000000000000000000000000C4FF0D00BDFF5500C2
                FF360000000000C0FF7A00C0FFE200C1FF6F0000000000BEFF7200BFFFF000C1
                FF880000000000C1FF5A00C0FFDD00BFFF9400B6FF0700B6FF0E00BAFF1A0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF30FFFFFF8EFFFFFF0C00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF04FFFFFF56FFFFFF7C000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF14FFFFFF8FFFFFFF55FFFFFF010000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF29FFFFFF9DFFFFFF3E00000000000000000000000000000000FFFF
                FF1BFFFFFF0E00000000FFFFFF60FFFFFFA1FFFFFFDAFFFFFFDAFFFFFFDAFFFF
                FFDAFFFFFFDAFFFFFFDAFFFFFF85FFFFFF1600000000FFFFFF33000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000AFFF1000C3FF2600B6FF150000000000BF
                FF2000C0FF4100C3FF260000000000C4FF0D00C6FF1B009FFF08000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF59FFFFFF9FFFFFFF1B00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF06FFFFFF75FFFFFF89FFFFFF1100000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF0BFFFFFFACFFFFFF87FFFFFF11FFFF
                FF01000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF06FFFFFF48FFFFFFC6FFFFFF71FFFFFF0600000000000000000000
                000000000000FFFFFF19FFFFFF0C00000000FFFFFF60FFFFFFA4FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DFFFFFF1600000000FFFF
                FF37000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF38FFFFFFBBFFFF
                FF30FFFFFF050000000000000000000000000000000000000000000000000000
                000000000000FFFFFF02FFFFFF12FFFFFF96FFFFFF7400000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF01FFFF
                FF54FFFFFF8CFFFFFF7DFFFFFF42FFFFFF17FFFFFF020000000000000000FFFF
                FF0DFFFFFF32FFFFFF6AFFFFFF8CFFFFFF74FFFFFF3AFFFFFFDBFFFFFF96FFFF
                FF03000000000000000000000000FFFFFF22FFFFFF1100000000FFFFFF60FFFF
                FFA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DFFFF
                FF1600000000FFFFFF3F00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF28FFFFFFCAFFFFFFACFFFFFF64FFFFFF2AFFFFFF09000000000000
                0000FFFFFF02FFFFFF1DFFFFFF4CFFFFFF80FFFFFF8DFFFFFF48FFFFFF040000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF19FFFFFF85FFFFFFD5FFFFFFECFFFF
                FFE0FFFFFFE9FFFFFFE7FFFFFFA3FFFFFF3B000000000000000000000000FFFF
                FF46FFFFFF2400000000000000000000000000000000FFFFFF01FFFFFF0C0000
                0000FFFFFF60FFFFFFA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF7DFFFFFF16FFFFFF02FFFFFF040000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF7EFFFFFF9BFFFFFF4FFFFFFFB2FFFF
                FFE9FFFFFFE6FFFFFFE2FFFFFFF0FFFFFFC9FFFFFF73FFFFFF12000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF08FFFFFF10FFFFFF0CFFFFFF010000000000000000000000000000
                00000000000000000000FFFFFF01FFFFFF4DFFFFFFA0FFFFFF1700000000FFFF
                FF03FFFFFF43FFFFFF03FFFFFF5DFFFFFFADFFFFFFD0FFFFFFD0FFFFFFD0FFFF
                FFD0FFFFFFD0FFFFFFD0FFFFFF90FFFFFF15FFFFFF11FFFFFF20000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF08FFFFFF68FFFFFF2900000000FFFFFF040000
                000000000000FFFFFF03FFFFFF0DFFFFFF0FFFFFFF0600000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF49FFFFFFFCFFFF
                FF530000000000000000FFFFFF04FFFFFF69FFFFFF0DFFFFFF26FFFFFF23FFFF
                FF23FFFFFF23FFFFFF23FFFFFF23FFFFFF23FFFFFF1FFFFFFF02FFFFFF75FFFF
                FF01000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF66FFFFFFF7FFFFFF78FFFF
                FF01000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF36FFFFFF02FFFFFF26FFFFFF29FFFFFF01FFFFFF0CFFFFFF25FFFF
                FF01000000000000000000000000000000000000000000000000FFFFFF0BFFFF
                FF26FFFFFF030000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF07FFFFFF19FFFFFF23FFFFFF25FFFFFF1DFFFFFF0C0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF13FFFFFF0AFFFFFF1AFFFF
                FF73FFFFFF040000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF06FFFFFFBCFFFFFFD3FFFFFF22FFFF
                FF02FFFFFF12FFFFFF44FFFFFF1EFFFFFF040000000000000000FFFFFF06FFFF
                FF3CFFFFFF33FFFFFF0D00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF1EFFFFFF7EFFFFFFB2FFFFFF99FFFFFF85FFFFFF82FFFF
                FF92FFFFFFAEFFFFFF95FFFFFF3CFFFFFF020000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF15FFFFFFB1FFFF
                FFA5FFFFFF010000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF12FFFF
                FF77FFFFFF0DFFFFFF0EFFFFFF0E00000000FFFFFF16FFFFFF4DFFFFFF40FFFF
                FF10FFFFFF41FFFFFF0400000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF01FFFFFF28FFFFFF82FFFFFFACFFFFFF4CFFFFFF06000000000000
                00000000000000000000FFFFFF01FFFFFF32FFFFFF93FFFFFF9BFFFFFF3EFFFF
                FF07000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF03FFFFFF04FFFF
                FF19FFFFFFB0FFFFFF3A00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF98FFFFFFB3FFFFFF18000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF02FFFFFF64FFFFFF9BFFFFFF3AFFFFFF04000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF24FFFFFF7BFFFFFF8CFFFFFF0B000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF0BFFFF
                FF8AFFFFFF63FFFFFF01FFFFFF0B000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF41FFFFFFB9FFFF
                FF07FFFFFF09FFFFFF0900000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF02FFFFFF52FFFFFF8C00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF58FFFFFF8EFFFFFF09000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF03FFFF
                FF03FFFFFF2FFFFFFFE6FFFFFF73000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF09FFFFFF05FFFFFF85FFFFFFAEFFFFFF2E00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF01FFFFFF5AFFFFFF95FFFFFF0F0000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF04FFFFFF62FFFF
                FF8BFFFFFF0A0000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF21FFFFFF8FFFFFFF5A00000000FFFFFF27FFFFFF0300000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF18FFFFFF32FFFFFF8FFFFFFF41FFFFFF30FFFFFF2CFFFF
                FF04000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF3FFFFFFFE2FFFFFF300000
                0000FFFFFF060000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF22FFFFFFA20000
                000000000000000000000000000000000000FFFFFFA5FFFFFFD3FFFFFFD3FFFF
                FFD3FFFFFFD3FFFFFFD3FFFFFFD3FFFFFFC8FFFFFF1900000000000000000000
                000000000000FFFFFF73FFFFFF4C000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF55FFFFFFF5FFFFFF6FFFFFFF0200000000000000000000
                0000FFFFFF02FFFFFF48FFFFFF48FFFFFF2EFFFFFF5CFFFFFF27FFFFFF220000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF09FFFFFF2DFFFFFF1EFFFFFF0A00000000000000000000
                0000FFFFFF19FFFFFF2AFFFFFF21000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF0800000000FFFFFF43FFFFFFE0FFFFFF500000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF7AFFFFFF3F0000000000000000000000000000000000000000FFFFFFF5FFFF
                FFDFFFFFFFCEFFFFFF8DFFFFFF85FFFFFFBEFFFFFFDEFFFFFFEFFFFFFF5D0000
                0000000000000000000000000000FFFFFF18FFFFFF9DFFFFFF08000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF5BFFFFFFBCFFFFFF1DFFFFFF0AFFFFFF1A00000000000000000000
                000000000000FFFFFF17FFFFFF26FFFFFF2A000000000000000000000000FFFF
                FF06FFFFFF24FFFFFF3800000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF20FFFFFF5DFFFFFF0300000000000000000000
                0000000000000000000000000000FFFFFF01FFFFFF22FFFFFF3B000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF06FFFFFF6AFFFFFF1FFFFFFF09FFFF
                FF7DFFFFFF2D0000000000000000000000000000000000000000000000000000
                0000FFFFFF17FFFFFFB2FFFFFF06000000000000000000000000000000000000
                0000FFFFFFBCFFFFFF67FFFFFF72FFFFFF72FFFFFF72FFFFFF72FFFFFF6DFFFF
                FF97FFFFFF5E0000000000000000000000000000000000000000FFFFFF6FFFFF
                FF6500000000000000000000000000000000000000000000000000000000FFFF
                FF12FFFFFF4900000000FFFFFF5FFFFFFFA1FFFFFF0800000000000000000000
                00000000000000000000FFFFFF66FFFFFF07FFFFFF0200000000000000000000
                0000000000000000000000000000FFFFFF04FFFFFF3EFFFFFF25000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF0EFFFFFF1BFFFFFF10FFFFFF60FFFF
                FF6EFFFFFF6DFFFFFF62FFFFFF5BFFFFFF6CFFFFFF6EFFFFFF6EFFFFFF32FFFF
                FF11FFFFFF2C0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF1FFFFFFFB4FFFFFFCCFFFFFF11FFFFFF14FFFFFF30FFFFFF040000
                00000000000000000000FFFFFF78FFFFFF5B0000000000000000000000000000
                00000000000000000000FFFFFFB9FFFFFFD9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF3FFFFFFA6FFFFFF5E000000000000000000000000000000000000
                0000FFFFFF18FFFFFFC1FFFFFF060000000000000000FFFFFF01FFFFFF1DFFFF
                FF08FFFFFF1CFFFFFFD7FFFFFFBBFFFFFF1000000000FFFFFF01000000000000
                0000000000000000000000000000FFFFFF1AFFFFFF150000000000000000FFFF
                FF6AFFFFFF91FFFFFF6CFFFFFF7EFFFFFF94FFFFFF2A00000000FFFFFF01FFFF
                FF2D000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF09FFFFFF0BFFFF
                FF23FFFFFFE6FFFFFFFDFFFFFFACFFFFFF44FFFFFF51FFFFFF6FFFFFFFF7FFFF
                FFFFFFFFFF7EFFFFFF05FFFFFF19000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF01FFFFFF13FFFFFF2100000000FFFFFF82FFFF
                FFE7FFFFFF4C00000000FFFFFF16FFFFFF02FFFFFFC0FFFFFF0F000000000000
                000000000000000000000000000000000000FFFFFFB9FFFFFFD9FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFFFA6FFFFFF5E00000000000000000000
                0000000000000000000000000000FFFFFFA4FFFFFF26FFFFFF0300000000FFFF
                FF82FFFFFFDDFFFFFF40FFFFFF06FFFFFF37FFFFFF1BFFFFFF02000000000000
                00000000000000000000000000000000000000000000FFFFFF0FFFFFFF070000
                000000000000FFFFFFC9FFFFFF88FFFFFF85FFFFFF8EFFFFFF94FFFFFF580000
                000000000000FFFFFF15FFFFFF01000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF4BFFFFFF07FFFFFF23FFFFFFE7FFFFFFE2FFFFFF6EFFFFFFFCFFFFFFFCFFFF
                FF96FFFFFF7BFFFFFFFCFFFFFF7F00000000FFFFFF30FFFFFF20000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF18FFFFFF71FFFFFF0CFFFFFF14FFFFFFDFFFFFFFC9FFFFFFC00000
                0000000000000000000000000000000000000000000000000000FFFFFFB9FFFF
                FFD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFFFA6FFFFFF5E0000
                00000000000000000000000000000000000000000000FFFFFF79FFFFFFD6FFFF
                FFC0FFFFFF01FFFFFF4DFFFFFF8CFFFFFF230000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF0DFFFF
                FF4B000000000000000000000000FFFFFFC9FFFFFFCAFFFFFFFFFFFFFFFFFFFF
                FF9EFFFFFF58000000000000000000000000FFFFFF7000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF3F00000000FFFFFF23FFFFFFE7FFFFFF99FFFFFFB2FFFF
                FFFFFFFFFFFEFFFFFFB6FFFFFF72FFFFFFECFFFFFF7F00000000FFFFFF0BFFFF
                FF24000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF07FFFFFF36FFFF
                FF6DFFFFFF9F0000000000000000000000000000000000000000000000000000
                0000FFFFFFB9FFFFFFD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFF
                FFA6FFFFFF5E000000000000000000000000000000000000000000000000FFFF
                FF5AFFFFFFA4FFFFFF41FFFFFF01FFFFFF010000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF32FFFFFF0F000000000000000000000000FFFFFFC9FFFFFFCAFFFF
                FFFFFFFFFFFFFFFFFF9EFFFFFF58000000000000000000000000FFFFFF3FFFFF
                FF08000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF3100000000FFFFFF23FFFFFFE7FFFF
                FFB0FFFFFF9EFFFFFFF6FFFFFFE0FFFFFF9BFFFFFF69FFFFFFF2FFFFFF7F0000
                0000FFFFFF09FFFFFF2000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF23FFFFFF96000000000000000000000000000000000000
                00000000000000000000FFFFFFB9FFFFFFD9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF3FFFFFFA6FFFFFF5E000000000000000000000000000000000000
                000000000000FFFFFF52FFFFFF51000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF29FFFFFF09000000000000000000000000FFFF
                FFC9FFFFFFCAFFFFFFFFFFFFFFFFFFFFFF9EFFFFFF5800000000000000000000
                0000FFFFFF34FFFFFF0900000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF4800000000FFFF
                FF23FFFFFFE7FFFFFFF3FFFFFF70FFFFFF8EFFFFFF81FFFFFF56FFFFFFA2FFFF
                FFE7FFFFFF7E00000000FFFFFF0FFFFFFF2B0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF18FFFFFFA800000000000000000000
                000000000000000000000000000000000000FFFFFFB9FFFFFFD9FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFFFA6FFFFFF5E00000000000000000000
                0000000000000000000000000000FFFFFF6AFFFFFF4600000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF2BFFFFFF1C000000000000
                000000000000FFFFFFC9FFFFFFCAFFFFFFFFFFFFFFFFFFFFFF9EFFFFFF580000
                00000000000000000000FFFFFF57FFFFFF020000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF09FFFFFF05FFFFFF22FFFFFFDDFFFFFFF6FFFFFFF2FFFFFF99FFFFFF89FFFF
                FFE4FFFFFF8CFFFFFF5FFFFFFF7200000000FFFFFF1000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF04FFFFFFC5FFFF
                FF06000000000000000000000000000000000000000000000000FFFFFFB9FFFF
                FFD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFFFA6FFFFFF5E0000
                00000000000000000000000000000000000000000000FFFFFF97FFFFFF2D0000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF13000000000000000000000000FFFFFFC9FFFFFFCAFFFFFFFFFFFFFFFFFFFF
                FF9EFFFFFF580000000000000000FFFFFF03FFFFFF0C00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF1AFFFFFF15FFFFFF05FFFFFF29FFFFFF3EFFFFFFB0FFFF
                FFC4FFFFFFC4FFFFFFC8FFFFFF7DFFFFFF32FFFFFF12FFFFFF02FFFFFF45FFFF
                FF02000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000FFFFFF89FFFFFF4900000000000000000000000000000000000000000000
                0000FFFFFFB9FFFFFFD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFF
                FFA6FFFFFF5E0000000000000000000000000000000000000000FFFFFF0EFFFF
                FFC5FFFFFF0A0000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF3DFFFFFF020000000000000000FFFFFFC8FFFFFFA7FFFF
                FFC8FFFFFFC8FFFFFF99FFFFFF570000000000000000FFFFFF19FFFFFF2C0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF02FFFFFF7100000000000000000000
                0000FFFFFF13FFFFFF23FFFFFF23FFFFFF23FFFFFF050000000000000000FFFF
                FF6AFFFFFF020000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF28FFFFFFA7FFFFFF0100000000000000000000
                00000000000000000000FFFFFFB9FFFFFFD9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF3FFFFFFA6FFFFFF5E000000000000000000000000000000000000
                0000FFFFFF5CFFFFFF7D00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000FFFFFF20FFFFFF3D0000000000000000FFFF
                FF34FFFFFF54FFFFFF55FFFFFF55FFFFFF54FFFFFF1100000000FFFFFF14FFFF
                FF49000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF01FFFF
                FF2CFFFFFF0F0000000000000000000000000000000000000000000000000000
                0000FFFFFF2EFFFFFF0D00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF89FFFFFF330000
                000000000000000000000000000000000000FFFFFFBDFFFFFF9CFFFFFFB2FFFF
                FFB2FFFFFFB2FFFFFFB2FFFFFFAAFFFFFFA1FFFFFF5E00000000000000000000
                000000000000FFFFFF12FFFFFF9FFFFFFF0F0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF08FFFF
                FF4000000000000000000000000000000000000000000000000000000000FFFF
                FF0BFFFFFF39FFFFFF0100000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF06FFFFFF3AFFFFFF3FFFFFFF070000000000000000FFFF
                FF04FFFFFF20FFFFFF49FFFFFF0AFFFFFF010000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF30FFFFFF8E0000000000000000000000000000000000000000FFFFFFC7FFFF
                FFDEFFFFFFDEFFFFFFDEFFFFFFDEFFFFFFDEFFFFFFDEFFFFFFE0FFFFFF2D0000
                0000000000000000000000000000FFFFFF5BFFFFFF5F00000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF11FFFFFF5400000000FFFFFF070000000000000000FFFF
                FF0AFFFFFF37FFFFFF29FFFFFF0A000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF02FFFFFF37FFFF
                FF10FFFFFF3CFFFFFF4BFFFFFF13000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000FFFFFF02FFFFFF78FFFFFF76FFFFFF0700000000000000000000
                0000FFFFFF01FFFFFF02FFFFFF02FFFFFF02FFFFFF02FFFFFF02FFFFFF02FFFF
                FF01000000000000000000000000FFFFFF01FFFFFF3FFFFFFF9FFFFFFF120000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF08FFFFFF33FFFF
                FF4EFFFFFF2CFFFFFF3E00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000FFFFFF08FFFFFF77FFFFFF6B0000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF3CFFFFFFA1FFFF
                FF19000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000000000FFFF
                FF05FFFFFF88FFFFFF84FFFFFF1B000000000000000000000000000000000000
                00000000000000000000000000000000000000000000FFFFFF0FFFFFFF55FFFF
                FFA8FFFFFF140000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF05FFFFFF3EFFFFFF94FFFFFF89FFFFFF2DFFFF
                FF010000000000000000000000000000000000000000FFFFFF18FFFFFF6BFFFF
                FF9FFFFFFF5AFFFFFF1000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000FFFFFF01FFFF
                FF42FFFFFFB0FFFFFFB9FFFFFF87FFFFFF68FFFFFF64FFFFFF7CFFFFFFA8FFFF
                FFC1FFFFFF69FFFFFF0A00000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000FFFFFF01FFFFFF19FFFFFF34FFFFFF40FFFFFF42FFFF
                FF3AFFFFFF23FFFFFF0500000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000}
            end
            object Label12: TLabel
              Left = 14
              Top = 34
              Width = 265
              Height = 16
              Caption = #169' SI Inform'#225'tica. Todos os direitos reservados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lStatusLicenca: TLabel
              Left = 14
              Top = 66
              Width = 268
              Height = 32
              Caption = 
                'Esta licen'#231'a est'#225' no plano DEMONSTRA'#199#194'O'#13#10'6 dispositivos autoriza' +
                'dos.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object lVencimento: TLabel
              Left = 14
              Top = 115
              Width = 144
              Height = 16
              Caption = '7 dias para o vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9474192
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
      object Panel22: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 447
        Width = 580
        Height = 46
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alBottom
        BevelOuter = bvNone
        Color = 3487029
        ParentBackground = False
        TabOrder = 2
        object Panel23: TPanel
          Left = 99
          Top = 9
          Width = 383
          Height = 28
          BevelOuter = bvNone
          Color = 2105123
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object Panel24: TPanel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 381
            Height = 26
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object btnBaixarChaves: TSpeedButton
              Left = 0
              Top = 0
              Width = 381
              Height = 26
              Cursor = crHandPoint
              Hint = 'Iniciar/Parar Servi'#231'o'
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Baixar chaves'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btnBaixarChavesClick
              ExplicitLeft = -1
              ExplicitTop = 1
              ExplicitHeight = 30
            end
          end
        end
      end
    end
    object pnTop: TPanel
      Left = 0
      Top = 0
      Width = 600
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Webservice Restaurante 1.0.0.0'
      Color = 3487029
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnMouseDown = paTopoMouseDown
      object btnClose: TImage
        Left = 564
        Top = 0
        Width = 36
        Height = 36
        Cursor = crHandPoint
        Align = alRight
        Center = True
        Picture.Data = {
          0B54504E47477261706869637E030000424D7E03000000000000360000002800
          00000F0000000E00000001002000000000004803000000000000000000000000
          000000000000FFFFFF30FFFFFF30000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF30FFFFFF300000
          0000FFFFFFD0FFFFFFF0FFFFFF30000000000000000000000000000000000000
          0000000000000000000000000000FFFFFF30FFFFFFF0FFFFFFE000000000FFFF
          FF10FFFFFFCFFFFFFFF0FFFFFF30000000000000000000000000000000000000
          000000000000FFFFFF30FFFFFFF0FFFFFFCFFFFFFF300000000000000000FFFF
          FF10FFFFFFCFFFFFFFF0FFFFFF4000000000000000000000000000000000FFFF
          FF30FFFFFFF0FFFFFFCFFFFFFF1000000000000000000000000000000000FFFF
          FF10FFFFFFCFFFFFFFFFFFFFFF600000000000000000FFFFFF50FFFFFFF0FFFF
          FFCFFFFFFF10000000000000000000000000000000000000000000000000FFFF
          FF10FFFFFFCFFFFFFFFFFFFFFF60FFFFFF60FFFFFFFFFFFFFFCFFFFFFF100000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF10FFFFFFCFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFF1000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF70FFFFFFFFFFFFFFFFFFFFFF70000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF60FFFFFFFFFFFF
          FFBFFFFFFF9FFFFFFFFFFFFFFF60000000000000000000000000000000000000
          0000000000000000000000000000FFFFFF60FFFFFFFFFFFFFF9F000000000000
          0000FFFFFFA0FFFFFFFFFFFFFF60000000000000000000000000000000000000
          000000000000FFFFFF60FFFFFFFFFFFFFF9F0000000000000000000000000000
          0000FFFFFFA0FFFFFFFFFFFFFFA000000000000000000000000000000000FFFF
          FFA0FFFFFFFFFFFFFF9F00000000000000000000000000000000000000000000
          0000FFFFFFA0FFFFFFFFFFFFFFA00000000000000000FFFFFFA0FFFFFFFFFFFF
          FF9F000000000000000000000000000000000000000000000000000000000000
          0000FFFFFFA0FFFFFFFFFFFFFFA000000000FFFFFF60FFFFFF9F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000FFFFFFA0FFFFFF6000000000}
        OnClick = btnCloseClick
      end
    end
    object pnMenus: TPanel
      Left = 0
      Top = 36
      Width = 600
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      OnMouseDown = paTopoMouseDown
      ExplicitLeft = -10
      ExplicitTop = 60
      object Panel25: TPanel
        Left = 0
        Top = 0
        Width = 102
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object lConfiguracoes: TLabel
          Left = 10
          Top = 13
          Width = 82
          Height = 16
          Cursor = crHandPoint
          Caption = 'Configura'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = lConfiguracoesClick
        end
      end
      object Panel26: TPanel
        Left = 102
        Top = 0
        Width = 53
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object lLogs: TLabel
          Left = 16
          Top = 13
          Width = 21
          Height = 16
          Cursor = crHandPoint
          Caption = 'Log'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2960685
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          OnClick = lLogsClick
        end
      end
      object Panel27: TPanel
        Left = 155
        Top = 0
        Width = 47
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object lChave: TLabel
          Left = 6
          Top = 13
          Width = 35
          Height = 16
          Cursor = crHandPoint
          Caption = 'Chave'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2960685
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          OnClick = lChaveClick
        end
        object pnMenuSel: TPanel
          AlignWithMargins = True
          Left = 12
          Top = 33
          Width = 23
          Height = 3
          Margins.Left = 12
          Margins.Top = 0
          Margins.Right = 12
          Margins.Bottom = 5
          Align = alBottom
          BevelOuter = bvNone
          Color = 2960685
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
  end
  object FDManager: TFDManager
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 100
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Left = 552
    Top = 518
  end
end
