unit uComercializadas;

interface

uses
  Classes;

type
  THeader = class
  private
    fId: string;
    fProjeto: string;
    fCNPJ: string;
    fData: string;
    fTotal: string; // Integer, mas pra facilitar a escrita e leitura será string
    fData2: string;
    fSUSEPE: string;
    fZeroUm: string;
    fUm: string;
    procedure setData(const Value: string);
  public
    constructor Create;
    property Id: string read fId;
    property Data: string read fData write setData;
    property Total: string read fTotal write fTotal;
  end;

  TDetalhe = class
  private
    fId: string;
    fUm: string;
    fCartela: string;
    fValor: string;
    fCartela2: string;
    fCartela3: string;
    fCartela4: string;
    fDezenas: string;
    procedure setCartela(const Value: string);
  public
    constructor Create;
    property Id: string read fId;
    property Um: string read fUm;
    property Cartela: string read fCartela write setCartela;
    property Valor: string read fValor write fValor;
    property Dezenas: string read fDezenas write fDezenas;
  end;

  TListaDetalhe = class
  private
    { private declarations }
    fLista : TList;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    procedure Adicionar(pDetalhe: TDetalhe);
    procedure Remover(Index: Integer);
    function Count: Integer;
  end;

  TTotalizador = class
  private
    fId: string;
    fTotal: string;
    procedure setTotal(const Value: string);
  public
    constructor Create;
    property Id: string read fId;
    property Total: string read fTotal write setTotal;
  end;

  TComercializadas = class
    Header: THeader;
    Details: TListaDetalhe;
    Totalizador: TTotalizador;
    public
      constructor Create;
      destructor Destroy;
  end;

implementation

uses
  SysUtils, uFuncoes;

{ THeader }

constructor THeader.Create;
begin
  self.fId := 'H';
  self.fProjeto := 'BIG BET';
  self.fCNPJ := '26420531000127';
  self.Data :=  FormatDateTime('ddmmyyyy',now);
  self.fTotal := '0';
  self.fSUSEPE := '15414.902304/2019-37';
  self.fZeroUm := '01';
  self.fUm := '1';
end;

{ TDetail }

constructor TDetalhe.Create;
begin
  self.fId := 'D';
  self.fUm := '1';
  self.fCartela := '00000000';
  self.fValor := '5,00';
  self.fDezenas := '0000000000000000000000000000000000000000';
end;

procedure TDetalhe.setCartela(const Value: string);
begin
  self.fCartela := uFuncoes.FormataCartela(Value);
  self.fCartela2 := self.fCartela;
  self.fCartela3 := self.fCartela;
  self.fCartela4 := self.fCartela;
end;

procedure THeader.setData(const Value: string);
begin
  fData := Value;
  fData2 := fData;
end;

{ TTotalizador }

constructor TTotalizador.Create;
begin
  self.fId := 'T';
  self.fTotal := '000000000'
end;

procedure TTotalizador.setTotal(const Value: string);
begin
  fTotal := uFuncoes.PreencheZero(Value,9);
end;

{ TComercializadas }

constructor TComercializadas.Create;
begin
  Header := THeader.Create;
  Details := TListaDetalhe.Create;
  Totalizador := TTotalizador.Create;
end;

destructor TComercializadas.Destroy;
begin
  Header := nil;
  Details := nil;
  Totalizador := nil;
end;

{ TListaDetalhe }

procedure TListaDetalhe.Adicionar(pDetalhe: TDetalhe);
begin
  self.fLista.Add(pDetalhe);
end;

function TListaDetalhe.Count: Integer;
begin
  Result := self.fLista.Count;
end;

constructor TListaDetalhe.Create;
begin
  inherited Create;
  self.fLista := TList.Create;
end;

procedure TListaDetalhe.Remover(Index: Integer);
begin
  if Index < self.Count then
    self.fLista.Delete(Index);
end;

end.
