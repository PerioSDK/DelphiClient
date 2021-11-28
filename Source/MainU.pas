unit MainU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,RESTRequest4D,
  System.JSON,Converters;

type
  TfrmMain = class(TForm)
    pnlConnSettings: TPanel;
    edtUserName: TLabeledEdit;
    edtPassword: TLabeledEdit;
    edtHost: TLabeledEdit;
    btnLogin: TButton;
    Panel3: TPanel;
    cmbMethod: TComboBox;
    Label1: TLabel;
    edtUrl: TLabeledEdit;
    btnSend: TButton;
    SplitterMain: TSplitter;
    pnlBody: TPanel;
    Splitter2: TSplitter;
    pnlResponse: TPanel;
    mmResponse: TMemo;
    mmBody: TMemo;
    procedure btnSendClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbMethodChange(Sender: TObject);
  private
    Bearer : String;
    function Login(UserName , Password,LoginUrl,AppKey,Language: String;Out Bearer,StatusText :String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

Function TfrmMain.Login(UserName , Password,LoginUrl,AppKey,Language : String;Out Bearer,StatusText :String): Boolean;
Var
  Response: IResponse;
  Obj : TJSONObject;
Begin
  Response := TRequest.New.AddHeader('jwtusername',UserName)
    .AddHeader('jwtpassword',Password)
    .AddHeader('jwtappkey',AppKey)
    .AddHeader('jwtlanguage',Language)
    .BaseURL(LoginUrl)
    .Accept('application/json')
    .Post;
  Result := (Response.StatusCode = 200);
  if Result then
  Begin
    Obj := TJSONObject.ParseJSONValue(Response.Content) as TJSONObject;
    Bearer := Obj.GetValue('token').Value;
  End
  Else
    StatusText := Response.StatusText;
End;

procedure TfrmMain.btnLoginClick(Sender: TObject);
Var
  StatusText : String;
begin
  if Login(edtUserName.Text , edtPassword.Text,edtHost.text + 'login','9FB8FE72-1D55-4735-A29A-3A74091298B6','tr',Bearer,StatusText) Then
    btnSend.Enabled := True
  Else
  Begin
    btnSend.Enabled := False;
    ShowMessage(StatusText);
  End;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  btnSend.Enabled := False;
  pnlBody.Visible := False;
  SplitterMain.Visible := False;
end;

procedure TfrmMain.btnSendClick(Sender: TObject);
Var
  Request : IRequest;
  Response: IResponse;
begin
  Request := TRequest.New.BaseURL(edtHost.text + edtUrl.Text)
    .Accept('application/json')
    .AddHeader('Authentication','bearer ' + Bearer);
  case cmbMethod.ItemIndex of
    0 :
    Begin
      Response := Request.Get;
      if (Response.StatusCode = 200) then
        mmResponse.Lines.Text := TConverters.JsonReformat(Response.Content,True)
      else
        ShowMessage(Response.StatusText);
    End;
    1 :
    Begin
      Response := Request.AddBody(mmBody.Lines.Text).Post;
      if (Response.StatusCode = 200) then
        mmResponse.Lines.Text := TConverters.JsonReformat(Response.Content,True)
      else
        ShowMessage(Response.StatusText);
    End;
    2 :
    Begin
      Response := Request.AddBody(mmBody.Lines.Text).Put;
      if (Response.StatusCode = 200) then
        mmResponse.Lines.Text := TConverters.JsonReformat(Response.Content,True)
      else
        ShowMessage(Response.StatusText);
    End;
    3 :
    Begin
      Response := Request.Delete;
      if (Response.StatusCode = 200) then
        mmResponse.Lines.Text := TConverters.JsonReformat(Response.Content,True)
      else
        ShowMessage(Response.StatusText);
    End;
  end;
end;

procedure TfrmMain.cmbMethodChange(Sender: TObject);
begin
  case cmbMethod.ItemIndex of
    0 :
    Begin
      pnlBody.Visible := False;
      SplitterMain.Visible := False;
      mmResponse.Lines.Clear;
      mmBody.Lines.Clear;
    End;
    1 :
    Begin
      pnlBody.Visible := True;
      SplitterMain.Visible := True;
      mmResponse.Lines.Clear;
      mmBody.Lines.Clear;
    End;
    2 :
    Begin
      pnlBody.Visible := True;
      SplitterMain.Visible := True;
      mmResponse.Lines.Clear;
      mmBody.Lines.Clear;
    End;
    3 :
    Begin
      pnlBody.Visible := False;
      SplitterMain.Visible := False;
      mmResponse.Lines.Clear;
      mmBody.Lines.Clear;
    End;
  end;
end;

end.
