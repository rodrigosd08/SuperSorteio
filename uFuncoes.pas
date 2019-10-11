unit uFuncoes;

interface

function PreencheZero(sTexto: string; iTamanho: Integer): string;
function FormataCartela(sCartela: string): string;

implementation

uses
  SysUtils;

function PreencheZero(sTexto: string; iTamanho: Integer): string;
begin
  while Length(sTexto) < iTamanho do
    sTexto := '0'+sTexto;
  Result := sTexto;
end;

function FormataCartela(sCartela: string): string;
begin
  Result := PreencheZero(sCartela,8);
end;

end.
