program Pedidos;

uses
  Forms,
  uFormPedidos in 'uFormPedidos.pas' {formPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformPedidos, formPedidos);
  Application.Run;
end.
