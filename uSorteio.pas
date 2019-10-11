unit uSorteio;

interface

uses
  Classes;

type
  THeader = class
    Id: string;
    CentoCinquenta: string;
    Data: string;
    Data2: string;
    Dois: string;
    public
      constructor Create;
  end;

  TDetalhe = class
  private
    fCartela: string;
    fBairro: string;
    fEmail: string;
    fValor: string;
    fUF: string;
    fCPF: string;
    fCEP: string;
    fId: string;
    fComplemento: string;
    fNome: string;
    fCidade: string;
    fTelefone: string;
    fRua: string;
    fCartela4: string;
    fUm: string;
    fCartela2: string;
    fCartela3: string;
    procedure setCartela(const Value: string);
  public
    constructor Create;
    property Id: string read fId;
    property Um: string read fUm;
    property Cartela: string read fCartela write setCartela;
    property Cartela2: string read fCartela2;
    property Cartela3: string read fCartela3;
    property Cartela4: string read fCartela4;
    property Valor: string read fValor;
    property CPF: string read fCPF write fCPF;
    property Nome: string read fNome write fNome;
    property Email: string read fEmail write fEmail;
    property Telefone: string read fTelefone write fTelefone;
    property UF: string read fUF write fUF;
    property CEP: string read fCEP write fCEP;
    property Cidade: string read fCidade write fCidade;
    property Bairro: string read fBairro write fBairro;
    property Rua: string read fRua write fRua;
    property Complemento: string read fComplemento write fComplemento;
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

  TPremio = class
  private
    fId: string;
    fValorReal: string;
    fEre: string;
    fValor: string;
    fValor2: string;
    procedure setValor(const Value: string);
  public
    constructor Create;
    property Id: string read fId;
    property ValorReal: string read fValorReal write fValorReal;
    property Ere: string read fEre;
    property Valor: string read fValor write setValor;
  end;

  TListaPremio = class
  private
    { private declarations }
    fLista : TList;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    procedure Adicionar(pPremio: TPremio);
    procedure Remover(Index: Integer);
    function Count: Integer;
  end;

  TTipoE = class
    Id: string;
    Quantidade: string;
    Zero: string;
    ValorCartela: string;
    ValorCartela2: string;
    Data: string;
    public
      constructor Create;
  end;

  TTotalizador = class
    Id: string;
    Cartelas: string;
    Valor: string;
    public
      constructor Create;
  end;

  TComercializadas = class
    Header: THeader;
    Details: TListaDetalhe;
    Premios: TListaPremio;
    TipoE: TTipoE;
    Totalizador: TTotalizador;
    public
      constructor Create;
  end;

implementation

uses
  SysUtils, uFuncoes;

{ TComercializadas }

constructor TComercializadas.Create;
begin
  //
end;

{ TTotalizador }

constructor TTotalizador.Create;
begin
  self.Id := 'T';
  self.Cartelas := '0';
  self.Valor := '0,00';
end;

{ TTipoE }

constructor TTipoE.Create;
begin
  self.Id := 'E';
  self.Quantidade := '1000000';
  self.Zero := '0';
  self.ValorCartela := '5,00';
  self.ValorCartela2 := self.ValorCartela;
  self.Data := FormatDateTime('ddmmyyyy',now);
end;

{ TPremio }

constructor TPremio.Create;
begin
  self.fId := 'P';
  self.fValorReal := 'R$ 1.000';
  self.fEre := 'R';
  self.Valor := '1000,00';
end;

{ TDetail }

constructor TDetalhe.Create;
begin
  self.fId := 'D';
  self.fCartela := '00000000';
  self.fValor := '5,00';
  self.fCPF := '00000000000';
  self.fNome := 'Nome';
  self.fTelefone := '00000000000';
end;

procedure TPremio.setValor(const Value: string);
begin
  fValor := Value;
  fValor2 := fValor;
end;

{ THeader }

constructor THeader.Create;
begin
  self.Id := 'H';
  self.CentoCinquenta := '150';
  self.Data := FormatDateTime('ddmmyyyy',now);
  self.Data2 := self.Data;
  self.Dois := '2';
end;

procedure TDetalhe.setCartela(const Value: string);
begin
  fCartela := uFuncoes.FormataCartela(Value);
  fCartela2 := fCartela;
  fCartela3 := fCartela;
  fCartela4 := fCartela;
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

{ TListaPremio }

procedure TListaPremio.Adicionar(pPremio: TPremio);
begin
  self.fLista.Add(pPremio);
end;

function TListaPremio.Count: Integer;
begin
  Result := self.fLista.Count;
end;

constructor TListaPremio.Create;
begin
  inherited Create;
  self.fLista := TList.Create;
end;

procedure TListaPremio.Remover(Index: Integer);
begin
  if Index < self.Count then
    self.fLista.Delete(Index);
end;

end.

