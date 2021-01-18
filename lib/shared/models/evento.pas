unit evento;

interface

uses
  uDWConsts, uDWJSONObject;

type
{$TYPEINFO ON}
  TEvento = class
  protected
    function rtfGet(var Params: TDWParams): String; dynamic; abstract;
    function rtfPost(var Params: TDWParams): String; dynamic; abstract;
    function rtfPut(var Params: TDWParams): String; dynamic; abstract;
    function rtfPatch(var Params: TDWParams): String; dynamic; abstract;
    function rtfDelete(var Params: TDWParams): String; dynamic; abstract;

    function messageError(value: String): String;
  public
    function rtfEvento(RequestType: TRequestType;
      var Params: TDWParams): String;

  end;

implementation

uses
  System.SysUtils;

{ TEvento }

function TEvento.messageError(value: String): String;
begin
  Result := '{"status":1,"mensagem":"' + value + '"}';
end;

function TEvento.rtfEvento(RequestType: TRequestType;
  var Params: TDWParams): String;
begin
  try
    case RequestType of
      rtGet:
        Result := rtfGet(Params);
      rtPost:
        Result := rtfPost(Params);
      rtPut:
        Result := rtfPut(Params);
      rtPatch:
        Result := rtfPatch(Params);
      rtDelete:
        Result := rtfDelete(Params);
    end;
  except
    on E: Exception do
    begin
      raise Exception.create
        ('Não foi possível realizar ação, mensagem retornada: ' + E.message);
    end;
  end;

end;

end.
