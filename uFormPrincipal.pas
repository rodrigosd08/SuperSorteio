unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure AtribuiNumeroLinhas;
    procedure GerarNumerosGrid(const pnQuantidade: Integer);
    procedure GerarArquivos;
    function LinhasPreenchidas: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AtribuiNumeroLinhas;
var
  I: Integer;
begin
  for I := 0 to StringGrid1.RowCount - 1 do
    StringGrid1.Cells[0,I] := IntToStr(I+1);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if StrToInt(Edit1.Text) > 0 then
    GerarNumerosGrid(StrToInt(Edit1.Text))
  else
    ShowMessage('Informar quantidade de prêmios');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  GerarArquivos;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.ColWidths[0] := 30;
  AtribuiNumeroLinhas;
end;

procedure TForm1.GerarArquivos;
begin
  //
end;

procedure TForm1.GerarNumerosGrid(const pnQuantidade: Integer);
begin
  StringGrid1.RowCount := pnQuantidade;
  AtribuiNumeroLinhas;
end;

function TForm1.LinhasPreenchidas: Integer;
var
  i: Integer;
begin
  Result := 0;
  for I := 0 to StringGrid1.RowCount - 1 do
    if not StringGrid1.Cells[1,I].IsEmpty then
      Inc(Result);
end;

end.
