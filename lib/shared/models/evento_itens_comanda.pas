unit evento_itens_comanda;

interface

uses
  evento, uDWJSONObject;

type
{$TYPEINFO ON}
  TEventoItensComanda = class(TEvento)
  protected
    function rtfGet(var Params: TDWParams): String; override;
    function rtfPost(var Params: TDWParams): String; override;
  end;

implementation

uses
  uConexaoFiredac, FireDAC.Comp.Client, utils, System.SysUtils, System.JSON,
  System.Classes, imprime_comanda, FireDAC.Stan.Param,
  System.Generics.Collections, System.Threading, webservice_repository;

{ TEventoItensComanda }

function TEventoItensComanda.rtfGet(var Params: TDWParams): String;
var
  Query: TFDQuery;
begin
  try

    Query := TConexaoFiredac.getInstancia.prepareStatement
      (' select * from SP_SFM_ITENS_CONTA_CLIENTE(:ICODIGO, :ICODEMP, :PAGE) ');
    Query.ParamByName('ICODIGO').AsInteger := Params.ItemsString['codigo']
      .AsInteger;
    Query.ParamByName('ICODEMP').AsInteger := Params.ItemsString['codemp']
      .AsInteger;
    Query.ParamByName('PAGE').AsString := Params.ItemsString['page'].AsString;
    Query.Open;

    Result := Query.FieldByName('RESULT').AsString;

    if Assigned(Query) then
      TConexaoFiredac.getInstancia.closeConnection(Query);

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível buscar itens da comanda.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      raise Exception.Create
        ('Não foi possível buscar itens da comanda, mensagem retornada: ' +
        E.message);

    end;
  end;
end;

function TEventoItensComanda.rtfPost(var Params: TDWParams): String;
var
  Query, QueryAdicional: TFDQuery;
  JSON, JSONItem, JSONItemAdicional: TJSONObject;
  JSONArray, JSONArrayAdicionais: TJSONArray;
  I, Y: Integer;
  CodigoVendedor, codigo, CodigoEmpresa: Integer;
  impressao: TImprimeComanda;
  TaskImpressao: ITask;
begin

  try

    if Params.ItemsString['data'] <> nil then
    begin

      Query := TConexaoFiredac.getInstancia.prepareStatement
        ('select CC.STATUS ' +
        'from CONTA_CLIENTE CC where CC.CODIGO = :CODIGO');
      Query.ParamByName('CODIGO').AsInteger := Params.ItemsString['codigo']
        .AsInteger;

      Query.Open;

      if Query.FieldByName('STATUS').AsInteger <> 0 then
      begin
        if Query.FieldByName('STATUS').AsInteger = 1 then
          Result := messageError('Essa comanda foi encerrada.');

        if Query.FieldByName('STATUS').AsInteger = 2 then
          Result := messageError('Essa comanda foi cancelada.');
        exit;
      end;

      JSON := TJSONObject.ParseJSONValue
        (TEncoding.ASCII.GetBytes('{"itens" : ' + Params.ItemsString['data']
        .AsString + '}'), 0) as TJSONObject;

      if JSON <> nil then
      begin

        JSONArray := JSON.getValue<TJSONArray>('itens');

        Result := '';

        { VERIFICA SE A EMPRESA TRABALHA COM ESTOQUE NEGATIVO
          E SE A EMPRESA CONTROLA ESTOQUE NA MESA }
        Query := TConexaoFiredac.getInstancia.prepareStatement
          ('select P.SAIDAS_ESTOQUE_NEGATIVO, P2.SAIDA_ESTOQUE_CONTA_CLIENTE ' +
          'from PARAMETROS P inner join PARAMETROS2 P2 on P2.COD_EMP = :ICODEMP '
          + 'where P.COD_EMP = :ICODEMP   ');
        Query.ParamByName('ICODEMP').AsInteger := Params.ItemsString['codemp']
          .AsInteger;
        Query.Open;

        if (Query.FieldByName('SAIDAS_ESTOQUE_NEGATIVO').AsString = 'N') and
          (Query.FieldByName('SAIDA_ESTOQUE_CONTA_CLIENTE').AsString = 'S') then
        begin

          for I := 0 to Pred(JSONArray.count) do
          begin
            JSONItem := JSONArray.Items[I].getValue<TJSONObject>;

            Query := TConexaoFiredac.getInstancia.prepareStatement
              ('select OK, OK2, MENSAGEM ' +
              'from SP_SFM_VERIFICA_ESTOQUE(:ICODEMP, :ICODPRO, :IQUANT)');
            Query.ParamByName('ICODEMP').AsInteger := Params.ItemsString
              ['codemp'].AsInteger;
            Query.ParamByName('ICODPRO').AsInteger :=
              JSONItem.getValue<Integer>('cod_pro');
            Query.ParamByName('IQUANT').AsCurrency :=
              JSONItem.getValue<Currency>('quant');
            Query.Open;

            if Query.FieldByName('OK').AsString = 'N' then
            begin
              Result := messageError(Query.FieldByName('mensagem').AsString);
              break;
            end;

          end;

          { se houve algum problema de estoque }
          if Result <> '' then
            exit;
        end;

        for I := 0 to JSONArray.count - 1 do
        begin
          JSONItem := JSONArray.Items[I].getValue<TJSONObject>;

          Query := TConexaoFiredac.getInstancia.prepareStatement
            ('select * ' +
            'from SP_SFM_INSERT_ITEM_COMANDA(:ICODIGO, :ICODPRO, ' +
            ':ICODVEND, :IVALOR, :ICODEMP, :IQUANT, :IOBSERVACAO, :IHASHITEM, null, :ICONTA, '
            + ' :ICODCAI, :IDESCMESA, :ICODSETOR, :ITOTALPESSOAS)  ');

          Query.ParamByName('ICODIGO').AsInteger := Params.ItemsString['codigo']
            .AsInteger;

          Query.ParamByName('ICODPRO').AsInteger :=
            JSONItem.getValue<Integer>('cod_pro');

          Query.ParamByName('ICODVEND').AsInteger := Params.ItemsString
            ['codvend'].AsInteger;

          Query.ParamByName('IVALOR').AsCurrency :=
            JSONItem.getValue<Currency>('valor');

          Query.ParamByName('ICODEMP').AsInteger := Params.ItemsString['codemp']
            .AsInteger;

          Query.ParamByName('IQUANT').AsCurrency :=
            JSONItem.getValue<Currency>('quant');

          Query.ParamByName('IOBSERVACAO').AsString :=
            JSONItem.getValue<String>('observacao');

          Query.ParamByName('IHASHITEM').AsString :=
            JSONItem.getValue<String>('hash_produto');

          Query.ParamByName('ICONTA').AsInteger := Params.ItemsString['conta']
            .AsInteger;

          Query.ParamByName('ICODCAI').AsInteger :=
            strtoint(readArqIni('ConfiguracaoLocal', 'caixa', '1'));

          Query.ParamByName('IDESCMESA').AsString := Params.ItemsString
            ['descmesa'].AsString;

          Query.ParamByName('ICODSETOR').AsInteger := Params.ItemsString
            ['codsetor'].AsInteger;

          Query.ParamByName('ITOTALPESSOAS').AsInteger := Params.ItemsString
            ['totalpessoas'].AsInteger;

          Query.Open;

          if JSONItem.get('adicionais') <> nil then
          begin
            JSONArrayAdicionais := JSONItem.getValue<TJSONArray>('adicionais');

            for Y := 0 to JSONArrayAdicionais.count - 1 do
            begin
              JSONItemAdicional := JSONArrayAdicionais.Items[Y]
                .getValue<TJSONObject>;

              QueryAdicional := TConexaoFiredac.getInstancia.prepareStatement
                ('select * ' +
                'from SP_SFM_INSERT_ITEM_COMANDA(:ICODIGO, :ICODPRO, ' +
                ':ICODVEND, :IVALOR, :ICODEMP, :IQUANT, :IOBSERVACAO, :IHASHITEM, '
                + ':IORDEMITEMPRINCIPAL, null, null, null, null, null)  ');

              QueryAdicional.ParamByName('ICODIGO').AsInteger :=
                Params.ItemsString['codigo'].AsInteger;

              QueryAdicional.ParamByName('ICODPRO').AsInteger :=
                JSONItemAdicional.getValue<Integer>('cod_pro');

              QueryAdicional.ParamByName('ICODVEND').AsInteger :=
                Params.ItemsString['codvend'].AsInteger;

              QueryAdicional.ParamByName('IVALOR').AsCurrency :=
                JSONItemAdicional.getValue<Currency>('valor');

              QueryAdicional.ParamByName('ICODEMP').AsInteger :=
                Params.ItemsString['codemp'].AsInteger;

              QueryAdicional.ParamByName('IQUANT').AsCurrency :=
                JSONItemAdicional.getValue<Currency>('quant');

              QueryAdicional.ParamByName('IOBSERVACAO').AsString :=
                JSONItemAdicional.getValue<String>('observacao');

              QueryAdicional.ParamByName('IHASHITEM').AsString :=
                JSONItemAdicional.getValue<String>('hash_produto');

              QueryAdicional.ParamByName('IORDEMITEMPRINCIPAL').AsInteger :=
                Query.FieldByName('ORDEM').AsInteger;

              QueryAdicional.Open;

              if Assigned(QueryAdicional) then
                TConexaoFiredac.getInstancia.closeConnection(QueryAdicional);
            end;
          end;

          if Assigned(Query) then
            TConexaoFiredac.getInstancia.closeConnection(Query);
        end;

        CodigoVendedor := Params.ItemsString['codvend'].AsInteger;
        codigo := Params.ItemsString['codigo'].AsInteger;
        CodigoEmpresa := Params.ItemsString['codemp'].AsInteger;

        TaskImpressao := TTask.Create(
          procedure
          begin
            try
              impressao := TImprimeComanda.Create(codigo, CodigoEmpresa,
                CodigoVendedor);

              impressao.execute;
            except
              on E: Exception do
              begin
                webservice_repository_dm.addResponse
                  ('Não foi possível imprimir comanda. Mensagem retornada: ' +
                  E.message);
              end;
            end;

          end);

        TaskImpressao.Start;

      end;

      Result := '{"status":0}';
    end;

  except
    on E: Exception do
    begin
      Result := messageError('Não foi possível inserir itens da comanda.');

      if Assigned(Query) then
        TConexaoFiredac.getInstancia.closeConnection(Query);

      if Assigned(QueryAdicional) then
        TConexaoFiredac.getInstancia.closeConnection(QueryAdicional);

      raise Exception.Create
        ('Não foi possível inserir itens da comanda, mensagem retornada: ' +
        E.message);

    end;
  end;

end;

initialization

TEventoItensComanda.ClassName;

end.
