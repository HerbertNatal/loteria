unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Math, DB, MemDS, VirtualTable, Grids,
  DBGrids, SMDBGrid, Generics.Collections, Generics.Defaults, OleDB, Menus,
  ActnList, ComObj, StrUtils, MyAccess, DBAccess;

type
  TEstatistica = record
      Numero : Integer;
      LastIndex : Integer;
  end;

type
  TDrawOperations = (rdDisableControls, rdEnableControls);

type
  TForm2 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    edQtdAcertos: TEdit;
    Label1: TLabel;
    edQtdAJogar: TEdit;
    Label2: TLabel;
    edQtdNumTotal: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Label4: TLabel;
    edQtdJogos: TEdit;
    btGame: TBitBtn;
    Button1: TButton;
    vtApostas: TVirtualTable;
    dsApostas: TDataSource;
    SMDBGrid1: TSMDBGrid;
    vtNumbers: TVirtualTable;
    dsNumbers: TDataSource;
    vtNumbersnumber: TIntegerField;
    vtNumbersqtd: TIntegerField;
    gd1: TSMDBGrid;
    alRightClick: TActionList;
    actExportToExcel: TAction;
    pmRightClick: TPopupMenu;
    Excel1: TMenuItem;
    edStart: TEdit;
    Label5: TLabel;
    edFinished: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edDtLastNumber: TEdit;
    Label8: TLabel;
    edQtdJaJogado: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btGameClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure actExportToExcelExecute(Sender: TObject);
    procedure actExportToExcelUpdate(Sender: TObject);
    procedure SMDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn3Click(Sender: TObject);
  private
    iQtdAcertos, iQtdAJogar, iQtdTotal, iQtdJogosSelec, iQtdJogos : integer;
    JogoTmp: array[0..14] of integer;
    function fat(n: Integer): Integer;
    function GeraNumero(Jogados, iAtual : Integer ; var bAlteraJogo : Boolean) : Boolean;
    procedure Aposta;
    procedure Sort(Top: integer);
    function PodeJogar(Jogados: Integer): boolean;
    function ExportToExcel(dbGrid : TDBGrid;sPlanName : string = 'Plan1'; bDinamicPlan : boolean = True) : Boolean;
    function IxToExcelColumn(iIndex: Integer): string;
    function EC(sText, sGroup: string): string;
    function GeraNumeroSemRecursivo(Jogados, iAtual : Integer ; var bAlteraJogo : Boolean) : Boolean;
    procedure RedrawControls(ds: TDataSource; Operation: TDrawOperations);
    { Private declarations }

  public
    sSortedNum : TStringList;
    sTotalNum : TStringList;
    index : Int64;
    bStopAll : boolean;
    { Public declarations }
  end;

var
  Form2: TForm2;
  Estatistica : array of TEstatistica;

implementation

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  i, iSorted : integer;
begin
  iQtdAcertos    := StrToInt(edQtdAcertos.Text);
  iQtdAJogar     := StrToInt(edQtdAJogar.Text);
  iQtdTotal      := StrToInt(edQtdNumTotal.Text);
  iQtdJogosSelec := StrToInt(edQtdJogos.Text);
  sTotalNum.Clear;
//  for i := 1 to StrToInt(edQtdNumTotal.Text) do begin
//
//  end;
  sSortedNum.Clear;

  while dsNumbers.DataSet.RecordCount > 0 do
    dsNumbers.DataSet.Delete;

  dsNumbers.DataSet.Open;
  for i := 1 to StrToInt(edQtdNumTotal.Text) do begin
    sTotalNum.Add(IntToStr(i));
    dsNumbers.DataSet.Append;
    dsNumbers.DataSet.FieldByName('number').AsInteger := i;
    dsNumbers.DataSet.FieldByName('qtd').AsInteger := 0;
    dsNumbers.DataSet.Post;
  end;
//  Memo1.Clear;
//  for i := 0 to StrToInt(edQtdNumTotal.Text)-1 do begin
//    Memo1.Lines.Add(sSortedNum.Strings[i]);
//  end;

  for i := StrToInt(edQtdNumTotal.Text) downto 1 do begin
    iSorted := Random(i);
    sSortedNum.Add(sTotalNum.Strings[iSorted]);
    sTotalNum.Delete(iSorted);
  end;
//  for i := 1 to StrToInt(edQtdNumTotal.Text) do begin
//    sTotalNum.Add(IntToStr(i));
//    sSortedNum.Add(IntToStr(i));
//  end;
  Memo1.Clear;
  for i := 0 to StrToInt(edQtdNumTotal.Text)-1 do begin
    Memo1.Lines.Add(sSortedNum.Strings[i]);
    if dsNumbers.DataSet.Locate('number',sSortedNum.Strings[i],[loCaseInsensitive]) then begin
      dsNumbers.DataSet.Edit;
      dsNumbers.DataSet.FieldByName('qtd').AsInteger := dsNumbers.DataSet.FieldByName('qtd').AsInteger + 1;
      dsNumbers.DataSet.Post;
    end;
  end;

  SetLength(Estatistica, iQtdTotal);
  for i := 0 to iQtdTotal-1 do
  begin
    Estatistica[i].Numero := i+1;
    Estatistica[i].LastIndex := 0;
  end;
end;

procedure TForm2.BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ExportToExcel((ActiveControl as TDBGrid), 'LOTOFACIL');
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  bStopAll := True;
end;

procedure TForm2.BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  bStopAll := True;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  i : integer;
begin
  sTotalNum := TStringList.Create;
  sSortedNum := TStringList.Create;
  sTotalNum.Clear;
  sSortedNum.Clear;
  dsNumbers.DataSet.Open;
  for i := 1 to StrToInt(edQtdNumTotal.Text) do begin
    dsNumbers.DataSet.Append;
    dsNumbers.DataSet.FieldByName('number').AsInteger := i;
    dsNumbers.DataSet.FieldByName('qtd').AsInteger := 0;
    dsNumbers.DataSet.Post;
    sTotalNum.Add(IntToStr(i));
    sSortedNum.Add(IntToStr(i));
  end;
  Memo1.Clear;
  for i := 0 to StrToInt(edQtdNumTotal.Text)-1 do begin
    Memo1.Lines.Add(sSortedNum.Strings[i]);
  end;

end;

procedure TForm2.RedrawControls(ds: TDataSource; Operation: TDrawOperations);
begin
  if Operation = rdDisableControls then begin
    if (ds.DataSet is TMyTable) then (ds.DataSet as TMyTable).DisableControls;
    if (ds.DataSet is TVirtualTable) then (ds.DataSet as TVirtualTable).DisableControls;
    if (ds.DataSet is TMyQuery) then (ds.DataSet as TMyQuery).DisableControls;
  end
  else if Operation = rdEnableControls then begin
    if (ds.DataSet is TMyTable) then (ds.DataSet as TMyTable).EnableControls;
    if (ds.DataSet is TVirtualTable) then (ds.DataSet as TVirtualTable).EnableControls;
    if (ds.DataSet is TMyQuery) then (ds.DataSet as TMyQuery).EnableControls;
  end;
end;

function TForm2.GeraNumeroSemRecursivo(Jogados, iAtual : Integer ; var bAlteraJogo : Boolean) : Boolean;
  procedure ZeraOrdenacao();
  begin
    dsNumbers.DataSet.Last;
    while dsNumbers.DataSet.FieldByName('qtd').AsInteger <> 0 do begin
      dsNumbers.DataSet.Edit;
      dsNumbers.DataSet.FieldByName('qtd').AsInteger := 0;
      dsNumbers.DataSet.Post;
      dsNumbers.DataSet.Last;
    end;
  end;
var
  x,z : integer;
  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o : integer;
  bFoiJogado : boolean;
begin
  index := 0;
  Result := True;
  x := 1;
  bStopAll := False;

  while x <= 11 do begin
    bAlteraJogo := False;
    dsNumbers.DataSet.RecNo := x;
    JogoTmp[0] := dsNumbers.DataSet.FieldByName('number').AsInteger;
    for b := x+1 to 12 do begin
      dsNumbers.DataSet.RecNo := b;
      JogoTmp[1] := dsNumbers.DataSet.FieldByName('number').AsInteger;
      for c := b+1 to 13 do begin
        dsNumbers.DataSet.RecNo := c;
        JogoTmp[2] := dsNumbers.DataSet.FieldByName('number').AsInteger;
        for d := c+1 to 14 do begin
          dsNumbers.DataSet.RecNo := d;
          JogoTmp[3] := dsNumbers.DataSet.FieldByName('number').AsInteger;
          for e := d+1 to 15 do begin
            dsNumbers.DataSet.RecNo := e;
            JogoTmp[4] := dsNumbers.DataSet.FieldByName('number').AsInteger;
            for f := e+1 to 16 do begin
              dsNumbers.DataSet.RecNo := f;
              JogoTmp[5] := dsNumbers.DataSet.FieldByName('number').AsInteger;
              for g := f+1 to 17 do begin
                dsNumbers.DataSet.RecNo := g;
                JogoTmp[6] := dsNumbers.DataSet.FieldByName('number').AsInteger;
                for h := g+1 to 18 do begin
                  dsNumbers.DataSet.RecNo := h;
                  JogoTmp[7] := dsNumbers.DataSet.FieldByName('number').AsInteger;
                  for i := h+1 to 19 do begin
                    dsNumbers.DataSet.RecNo := i;
                    JogoTmp[8] := dsNumbers.DataSet.FieldByName('number').AsInteger;
                    for j := i+1 to 20 do begin
                      dsNumbers.DataSet.RecNo := j;
                      JogoTmp[9] := dsNumbers.DataSet.FieldByName('number').AsInteger;
                      for k := j+1 to 21 do begin
                        dsNumbers.DataSet.RecNo := k;
                        JogoTmp[10] := dsNumbers.DataSet.FieldByName('number').AsInteger;
                        if bStopAll then
                          Exit;
                        if not PodeJogar(11) then begin
                          JogoTmp[10] := 0;
                          Continue;
                        end;
                        for l := k+1 to 22 do begin
                          dsNumbers.DataSet.RecNo := l;
                          JogoTmp[11] := dsNumbers.DataSet.FieldByName('number').AsInteger;
                          if not PodeJogar(12) then begin
                            JogoTmp[11] := 0;
                            Continue;
                          end;
                          for m := l+1 to 23 do begin
                            dsNumbers.DataSet.RecNo := m;
                            JogoTmp[12] := dsNumbers.DataSet.FieldByName('number').AsInteger;
                            if not PodeJogar(13) then begin
                              JogoTmp[12] := 0;
                              Continue;
                            end;
                            for n := m+1 to 24 do begin
                              dsNumbers.DataSet.RecNo := n;
                              JogoTmp[13] := dsNumbers.DataSet.FieldByName('number').AsInteger;
                              if not PodeJogar(14) then begin
                                JogoTmp[13] := 0;
                                Continue;
                              end;
                              for o := n+1 to 25 do begin
                                dsNumbers.DataSet.RecNo := o;
                                JogoTmp[14] := dsNumbers.DataSet.FieldByName('number').AsInteger;
                                if not PodeJogar(15) then begin
                                  JogoTmp[14] := 0;
                                  Continue;
                                end else begin
                                  Aposta();
                                  inc(iQtdJogos);
                                  if (iQtdJogos mod 100) = 0 then
                                    ZeraOrdenacao();
                                  edQtdJaJogado.Text := IntToStr(iQtdJogos);
                                  edDtLastNumber.Text := FormatDateTime('dd/mm/yyyy hh:MM:ss', Now());
                                  Application.ProcessMessages;
                                  bAlteraJogo := True;
                                  if iQtdJogos = iQtdJogosSelec then begin
                                    Exit;
                                  end;
                                  JogoTmp[14] := 0;
                                  Break;
                                end;
                                JogoTmp[14] := 0;
                                if bAlteraJogo then
                                  Break;
                              end;
                              JogoTmp[13] := 0;
                              if bAlteraJogo then
                                Break;
                            end;
                            JogoTmp[12] := 0;
                            if bAlteraJogo then
                              Break;
                          end;
                          JogoTmp[11] := 0;
                          if bAlteraJogo then
                            Break;
                        end;
                        JogoTmp[10] := 0;
                        if bAlteraJogo then
                          Break;
                      end;
                      JogoTmp[9] := 0;
                      if bAlteraJogo then
                        Break;
                    end;
                    JogoTmp[8] := 0;
                    if bAlteraJogo then
                      Break;
                  end;
                  JogoTmp[7] := 0;
                  if bAlteraJogo then
                    Break;
                end;
                JogoTmp[6] := 0;
                if bAlteraJogo then
                  Break;
              end;
              JogoTmp[5] := 0;
              if bAlteraJogo then
                Break;
            end;
            JogoTmp[4] := 0;
            if bAlteraJogo then
              Break;
          end;
          JogoTmp[3] := 0;
          if bAlteraJogo then
            Break;
        end;
        JogoTmp[2] := 0;
        if bAlteraJogo then
          Break;
      end;
      JogoTmp[1] := 0;
      if bAlteraJogo then
        Break;
    end;
    JogoTmp[0] := 0;
    if bAlteraJogo then
      x := 1
    else
      inc(x);
  end;
end;

function TForm2.GeraNumero(Jogados, iAtual : Integer ; var bAlteraJogo : Boolean) : Boolean;
var
  i,j : integer;
  bFoiJogado : boolean;
begin
  index := 0;
  Result := True;
  if iQtdJogos = iQtdJogosSelec then begin
    Exit;
  end;
  if iAtual = Jogados+StrToInt(edQtdAcertos.Text) then
    Exit;
//  for i := Jogados + 1 to Jogados+11 do begin
  i := Jogados + 1;
  while i <= Jogados+StrToInt(edQtdAcertos.Text) do begin

    dsNumbers.DataSet.RecNo := i;
    if (dsNumbers.DataSet.RecNo > Jogados+StrToInt(edQtdAcertos.Text)) then begin
      Result := False;
      bAlteraJogo := True;
//      dsNumbers.DataSet.First;
//      for j := 0 to iQtdAJogar-1 do begin
//        JogoTmp[j] := 0;
//      end;

    end;
    if (bAlteraJogo) and (Jogados > 0) then begin
      Application.ProcessMessages;
      Exit;
    end else begin
      bAlteraJogo := False;

    end;
    dsNumbers.DataSet.RecNo := i;
    //dsNumbers.DataSet.First;
    // verificando se o n�mero j� n�o foi selecionado dentro deste jogo
//    while not dsNumbers.DataSet.Eof do begin
      bFoiJogado := False;;
      for j := 0 to iQtdAJogar-1 do begin
        if JogoTmp[j] = 0 then
          Break;
        if JogoTmp[j] = dsNumbers.DataSet.FieldByName('number').AsInteger then begin
          bFoiJogado := True;
          Break;
        end;
      end;
      if bFoiJogado then begin
        Inc(i);
        Continue;
      end;
//        dsNumbers.DataSet.Next
//      else
//        Break;
//    end;

//    for j := 0 to iQtdAJogar-1 do begin
//    // vberificando se o n�mero j� n�o foi selecionado dentro deste jogo
//      if JogoTmp[j] = dsNumbers.DataSet.FieldByName('number').AsInteger then begin
//        dsNumbers.DataSet.Next;
//        Continue;
//      end;
//    end;

    // pegando o n�mero menos jogado (o vtNumbers est� sempre ordenado pela qtd de vezes q foi jogado do menor pro maior
    JogoTmp[Jogados] := dsNumbers.DataSet.FieldByName('number').AsInteger;
    if (Jogados + 1) >= iQtdAcertos then begin
      if not PodeJogar(Jogados+1) then begin
//        dsNumbers.DataSet.Next;
        Inc(i);
        Continue;
      end;
    end;
    if (Jogados + 1) = iQtdAJogar then begin
      Aposta();
      inc(iQtdJogos);
//      dsNumbers.DataSet.First;
//      Inc(i);
      bAlteraJogo := True;
      Break;
    end else begin
      //dsNumbers.DataSet.First;
      Result := GeraNumero(Jogados+1, i+1, bAlteraJogo);
//      dsNumbers.DataSet.Next;
    end;

  end;
  JogoTmp[Jogados] := 0;
end;

function TForm2.PodeJogar(Jogados: Integer) : boolean;
var
  i, j, iAcertos : Integer;
begin
  Result := True;
  if Jogados < iQtdAcertos then
    Exit;
  vtApostas.First;
  while not vtApostas.Eof do begin
    iAcertos := 0;
    for i := 0 to Jogados-1 do begin
      if (iAcertos - i) < (iQtdAcertos - Jogados) then
        Break;

      for j := 0 to vtApostas.Fieldcount-1 do begin
        if (vtApostas.Fields[j].AsInteger = JogoTmp[i]) then begin
          Inc(iAcertos);
          if iAcertos = iQtdAcertos then begin
            Result := False;
            Exit;
          end;

          Break;
        end;
      end;
    end;
    vtApostas.Next;
  end;

end;

procedure TForm2.SMDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Point: TPoint;
begin
  if Button = mbRight then begin
//    bRightClick := True;
    GetCursorPos(Point);
    pmRightClick.Popup(Point.X, Point.Y);
  end;
end;

Procedure TForm2.Sort(Top:integer);
var
  counter, min, look:integer;
  temp:integer; {if the array is of integer type then temp must be defined as 'integer' etc.}
begin
  for counter := 0 to Top do begin
    min:=counter;
    for look:=counter+1 to top do
      if JogoTmp[look]<JogoTmp[min] then
        min:=look;

    temp:=JogoTmp[min];
    JogoTmp[min]:=JogoTmp[counter];
    JogoTmp[counter]:=temp;
  end;
end;


procedure TForm2.actExportToExcelExecute(Sender: TObject);
begin
  if (ActiveControl is TDBGrid) then
    if not ExportToExcel((ActiveControl as TDBGrid), 'LOTOFACIL') then
      MessageBox(Handle, 'N�o foi poss�vel exportar para o excel', '', MB_OK + MB_ICONERROR);
end;

procedure TForm2.actExportToExcelUpdate(Sender: TObject);
begin
  if (ActiveControl is TDBGrid) then
    (Sender as TAction).Enabled := ((ActiveControl as TDBGrid).DataSource.DataSet.RecordCount > 0);
end;

procedure TForm2.Aposta();
var
  i : Integer;
begin
  Sort(iQtdAJogar-1);
  vtApostas.Append;
  for i := 0 to iQtdAJogar-1 do begin
    vtApostas.Fields[i].AsInteger := JogoTmp[i];
    if dsNumbers.DataSet.Locate('number',JogoTmp[i],[loCaseInsensitive]) then begin
      dsNumbers.DataSet.Edit;
      dsNumbers.DataSet.FieldByName('qtd').AsInteger := dsNumbers.DataSet.FieldByName('qtd').AsInteger + 1;
      dsNumbers.DataSet.Post;
    end;
    JogoTmp[i] := 0;
  end;
  vtApostas.Post;
end;

procedure TForm2.btGameClick(Sender: TObject);
var
  i : integer;
  bAlteraJogo : Boolean;
begin
//  dsNumbers.DataSet.First;
//  while not dsNumbers.DataSet.Eof do begin
//    dsNumbers.DataSet.Edit;
//    dsNumbers.DataSet.FieldByName('qtd').AsInteger := 0;
//    dsNumbers.DataSet.Post;
//    dsNumbers.DataSet.Next;
//  end;
//  dsNumbers.DataSet.First;
  iQtdAcertos    := StrToInt(edQtdAcertos.Text);
  iQtdAJogar     := StrToInt(edQtdAJogar.Text);
  iQtdTotal      := StrToInt(edQtdNumTotal.Text);
  iQtdJogosSelec := StrToInt(edQtdJogos.Text);
  iQtdJogos      := 0;
  vtApostas.Close;
  vtApostas.Clear;
  vtApostas.DeleteFields;
  for i := 1 to iQtdAJogar do begin
    vtApostas.AddField('Num' + IntToStr(i), ftInteger);
  end;
  vtApostas.FieldDefs.Update;
  vtApostas.Open;
  dsNumbers.DataSet.First;
  edStart.Text := FormatDateTime('dd/mm/yyyy hh:MM:ss', Now());
  Application.ProcessMessages;
  RedrawControls(dsNumbers, rdDisableControls);
  RedrawControls(dsApostas, rdDisableControls);
//  GeraNumeroSemRecursivo(0, 0, bAlteraJogo);
  RedrawControls(dsNumbers, rdEnableControls);
  RedrawControls(dsApostas, rdEnableControls);
  GeraNumero(0, 0, bAlteraJogo) ;
  edFinished.Text := FormatDateTime('dd/mm/yyyy hh:MM:ss', Now());
  StatusBar1.Panels[0].Text := 'Quantidade de Jogos: ' + IntToStr(vtApostas.RecordCount);

end;

procedure TForm2.Button1Click(Sender: TObject);
var
  i : integer;
begin
  iQtdAcertos    := StrToInt(edQtdAcertos.Text);
  iQtdAJogar     := StrToInt(edQtdAJogar.Text);
  iQtdTotal      := StrToInt(edQtdNumTotal.Text);
  iQtdJogosSelec := StrToInt(edQtdJogos.Text);
  for i := 0 to iQtdTotal-1 do begin
    JogoTmp[i] := ((i - iQtdAJogar) * -1);
  end;
  sort(iQtdAJogar-1);
  Memo1.clear();
  for i := 0 to iQtdTotal-1 do begin
    Memo1.Lines.add(IntToStr(JogoTmp[i]));
  end;

end;

function TForm2.fat (n: Integer):Integer;
var i: Integer;
begin

  Result := 1;

  for i := 2 to n do
    Result := Result * i;

end;

function TForm2.EC(sText, sGroup: string): string;
var
  sTemp: string;
  nTemp: Integer;
  nCount: Integer;
begin
  nCount := Length(sText);
  sTemp := '';
  for nTemp := 1 to nCount do begin
    if Pos(sText[nTemp], sGroup) > 0 then
      sTemp := sTemp + sText[nTemp];
  end;
  EC := sTemp;
end;

function TForm2.IxToExcelColumn(iIndex: Integer): string;
var
  iQuotient: Integer;
begin
  iQuotient := iIndex div 26;
  if iQuotient > 0 then
    Result := IxToExcelColumn(iQuotient - 1) + Char((iIndex mod 26) + 65)
  else
    Result := Char(iIndex + 65);
end;

function TForm2.ExportToExcel(dbGrid : TDBGrid;sPlanName : string = 'Plan1'; bDinamicPlan : boolean = True) : Boolean;
var
  XApp:Variant;
  sheet:Variant;
  PivotCache : OleVariant;
//  MyPic: Variant;
  r,c:Integer;
  row,col:Integer;
  filName:Integer;
  q:Integer;
  bBookmark : TBookmark;
  bBands : boolean;
  sDispFormat: string;
  iColumn : Integer;
begin

  XApp:=CreateOleObject('Excel.Application');
  try
    try
      XApp.Visible:=false;
      XApp.WorkBooks.Add(-4167);
      XApp.WorkBooks[1].WorkSheets[1].Name:=sPlanName;
      sheet:=XApp.WorkBooks[1].WorkSheets[sPlanName];
      bBookmark := dbGrid.DataSource.DataSet.Bookmark;
      Screen.Cursor := crHourGlass;
      dbGrid.DataSource.DataSet.DisableControls;
      dbGrid.DataSource.DataSet.First;
      iColumn := 0;
      for filName:=0 to dbGrid.FieldCount-1 do begin
        if not dbGrid.Columns[filName].Visible then
          Continue;
        Inc(iColumn);
        q:=iColumn;
        sheet.Cells[1,q]:=dbGrid.Columns[filName].Title.Caption;
      end;

//      MyPic := sheet.Pictures.Insert('C:\Work\SmartComex\Resources\logo_160.jpg');
//      MyPic.Top := 5;
//      MyPic.Left := 5;

      Sheet.Range['A1',IxToExcelColumn(q-1)+'1'].Interior.Color := TColor($CACACA);
      Sheet.Range['A1',IxToExcelColumn(q-1)+'1'].Font.Bold := True;

      for r:=0 to dbGrid.DataSource.DataSet.RecordCount-1 do begin
        iColumn := 0;
        for c:=0 to dbGrid.FieldCount-1 do begin
          if not dbGrid.Columns[c].Visible then
          Continue;
          inc(iColumn);
          row:=r+2;
          col:=iColumn;
          try
            if Assigned(dbGrid.Fields[c]) then begin
              if dbGrid.Fields[c].Calculated then begin
                if Trim(dbGrid.Fields[c].DisplayText) <> '' then begin
                  if ((dbGrid.Fields[c].DataType = ftDate) or (dbGrid.Fields[c].DataType = ftDateTime)) then
                    sheet.Cells[row,col].Value :=  dbGrid.Fields[c].AsDateTime
                  else if (dbGrid.Fields[c].DataType = ftString) and (Trim(dbGrid.Fields[c].DisplayText) <> '') then
                    sheet.Cells[row,col].Value := ''''+Trim(dbGrid.Fields[c].DisplayText)
                  else if (dbGrid.Fields[c].DataType = ftFloat) then begin
                    try
                      sDispFormat := IfThen( (dbGrid.DataSource.DataSet.FieldByName(dbGrid.Fields[c].FieldName) as TFloatField).DisplayFormat = '', '0,00', StringReplace((dbGrid.DataSource.DataSet.FieldByName(dbGrid.Fields[c].FieldName) as TFloatField).DisplayFormat, FormatSettings.ThousandSeparator, FormatSettings.DecimalSeparator, [rfReplaceAll]) );
                    except
                      sDispFormat := '0,00';
                    end;
                    sheet.Cells[row,col].NumberFormat := sDispFormat;
                    sheet.Cells[row,col].Value := StrToFloatDef(EC(Trim(dbGrid.Fields[c].DisplayText), '1234567890,-'),0);
                  end
                  else
                    sheet.Cells[row,col].Value := Trim(dbGrid.Fields[c].DisplayText);
                end
                else
                  sheet.Cells[row,col].Value := Trim(dbGrid.Fields[c].DisplayText);
              end else
              if Trim(dbGrid.Fields[c].AsString) <> '' then begin
                if ((dbGrid.Fields[c].DataType = ftDate) or (dbGrid.Fields[c].DataType = ftDateTime)) then
                  sheet.Cells[row,col].Value :=  dbGrid.Fields[c].AsDateTime
                else if (dbGrid.Fields[c].DataType = ftString) and (Trim(dbGrid.Fields[c].AsString) <> '') then
                  sheet.Cells[row,col].Value := ''''+Trim(dbGrid.Fields[c].AsString)
                else if (dbGrid.Fields[c].DataType = ftFloat) then begin
                  try
                    sDispFormat := IfThen( (dbGrid.DataSource.DataSet.FieldByName(dbGrid.Fields[c].FieldName) as TFloatField).DisplayFormat = '', '0,00', StringReplace((dbGrid.DataSource.DataSet.FieldByName(dbGrid.Fields[c].FieldName) as TFloatField).DisplayFormat, FormatSettings.ThousandSeparator, FormatSettings.DecimalSeparator, [rfReplaceAll]) );
                  except
                    sDispFormat := '0,00';
                  end;
                  sheet.Cells[row,col].NumberFormat := sDispFormat;
                  sheet.Cells[row,col].Value := StrToFloatDef(EC(Trim(dbGrid.Fields[c].AsString), '1234567890,-'),0);
                end
                else
                  sheet.Cells[row,col].Value := Trim(dbGrid.Fields[c].AsString);
              end
              else
                sheet.Cells[row,col].Value := Trim(dbGrid.Fields[c].AsString);
            end;
          except
            sheet.Cells[row,col].Value := ''''+Trim(dbGrid.Fields[c].AsString);
          end;
        end;
        if ((row mod 2) = 0) then
          Sheet.Range['A'+ IntToStr(row),IxToExcelColumn(col-1)+ InttoStr(row)].Interior.Color := TColor($FFFFFF)
        else
          Sheet.Range['A'+ IntToStr(row),IxToExcelColumn(col-1)+ InttoStr(row)].Interior.Color := TColor($FBFBFB);
        dbGrid.DataSource.DataSet.Next;
      end;
      sheet.Cells.EntireColumn.AutoFit;
      Sheet.Range['A1',IxToExcelColumn(q-1)+'1'].AutoFilter;
      Sheet.Range['A1', IxToExcelColumn(Col-1)+ InttoStr(row)].Borders.LineStyle := 1;
      Sheet.Range['A1', IxToExcelColumn(Col-1)+ InttoStr(row)].Borders.Weight := 2;
      Sheet.Range['A1', IxToExcelColumn(Col-1)+ InttoStr(row)].Borders.ColorIndex := 1;
      XApp.Visible:=True;
//      XApp.WorkBooks[1].WorkSheets.Add();
      {
      Sheets.Add After:=Sheets(Sheets.Count)
      ActiveSheet.Name = "Dinamica"
      ActiveWorkbook.PivotCaches.Create(1, "MAPA!R1C1:R10C10").CreatePivotTable "Dinamica!R3C1", "Tabela Din�mica"
      ActiveWorkbook.ShowPivotTableFieldList = True
      ActiveSheet.PivotTables("Tabela din�mica").ShowDrillIndicators = True
      ActiveSheet.PivotTables("Tabela din�mica").DisplayFieldCaptions = True
      ActiveSheet.Cells(3, 1).Select
       }
//      sheet.ActiveWorkBook.PivotCaches.Create(1, sPlanName + '!R1C1:R' + IntToStr(row) + 'C' + IntToStr(dbGrid.FieldCount)).CreatePivotTable('Dinamica!R3C1', 'Tabela Din�mica');
//      XApp.WorkBooks[1].WorkSheets['Dinamica'].PivotCaches.Create(1, sPlanName + '!R1C1:R' + IntToStr(row) + 'C' + IntToStr(dbGrid.FieldCount)).CreatePivotTable('Dinamica!R3C1', 'Tabela Din�mica');
//      sheet.ShowPivotTableFieldList := True;
      try
        if bDinamicPlan then begin
          XApp.WorkBooks[1].PivotCaches.Create(1, sPlanName + '!R1C1:R' + IntToStr(row) + 'C' + IntToStr(Col)).CreatePivotTable('', 'Tabela Din�mica');
          XApp.WorkBooks[1].ShowPivotTableFieldList := True;
          XApp.ActiveSheet.Name:= 'Dinamica';
          sheet:=XApp.WorkBooks[1].WorkSheets['Dinamica'];
    //      PivotCache := sheet.PivotCaches.Create(1, sPlanName + '!R1C1:R' + IntToStr(row) + 'C' + IntToStr(dbGrid.FieldCount));
    //      PivotCache.CreatePivotTable('Dinamica!R3C1', 'Tabela Din�mica');
          sheet.PivotTables('Tabela din�mica').ShowDrillIndicators := True;
          sheet.PivotTables('Tabela din�mica').DisplayFieldCaptions := True;
          sheet.Cells[3, 1].Select;
          XApp.WorkBooks[1].WorkSheets[sPlanName].Select;
          Result := True;
        end;
      except
//        Sheet.ActiveWorkBook.Close(False);
//        Sheet.Quit;
        XApp.WorkBooks[1].Close(False);
        XApp.Application.Quit;
        XApp  := Unassigned;
        Sheet := Unassigned;
        Result := ExportToExcel(dbGrid, sPlanName, False);
      end;
//      XApp.Visible:=True;
    except
      Result := False;
      Sheet.ActiveWorkBook.Close(False);
      Sheet.Quit;
    end;

  finally
    dbGrid.DataSource.DataSet.Bookmark := bBookmark;
    dbGrid.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
    XApp  := Unassigned;
    Sheet := Unassigned;

  end;

end;

//procedure next_combination (pos: integer);
//begin
//
//  if (pos = 0) then
//    Exit;
//
//  inc (combination[pos]);
//
//  if (combination[pos] > max_values[pos]) then begin
//
//     next_combination (pos - 1);
//
//     combination[pos] := combination[pos - 1] + 1;
//
//  end;
//
//end;

end.
