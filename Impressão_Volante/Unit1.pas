unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppPrnabl, ppClass, ppCtrls, ppCache, ppBands, ppParameter, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, Grids, DBGrids, DB, MemDS,
  DBAccess, MyAccess, StdCtrls, Buttons, ppModule, raCodMod, ppVar;

type
  TForm1 = class(TForm)
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppDetailBand1: TppDetailBand;
    pp1_21: TppShape;
    pp1_16: TppShape;
    pp1_11: TppShape;
    pp1_6: TppShape;
    pp1_1: TppShape;
    pp1_22: TppShape;
    pp1_17: TppShape;
    pp1_12: TppShape;
    pp1_7: TppShape;
    pp1_2: TppShape;
    pp1_23: TppShape;
    pp1_18: TppShape;
    pp1_13: TppShape;
    pp1_8: TppShape;
    pp1_3: TppShape;
    pp1_24: TppShape;
    pp1_19: TppShape;
    pp1_14: TppShape;
    pp1_9: TppShape;
    pp1_4: TppShape;
    pp1_25: TppShape;
    pp1_20: TppShape;
    pp1_15: TppShape;
    pp1_10: TppShape;
    pp1_5: TppShape;
    pp2_21: TppShape;
    pp2_16: TppShape;
    pp2_11: TppShape;
    pp2_6: TppShape;
    pp2_1: TppShape;
    pp2_22: TppShape;
    pp2_17: TppShape;
    pp2_12: TppShape;
    pp2_7: TppShape;
    pp2_2: TppShape;
    pp2_23: TppShape;
    pp2_18: TppShape;
    pp2_13: TppShape;
    pp2_8: TppShape;
    pp2_3: TppShape;
    pp2_24: TppShape;
    pp2_19: TppShape;
    pp2_14: TppShape;
    pp2_9: TppShape;
    pp2_4: TppShape;
    pp2_25: TppShape;
    pp2_20: TppShape;
    pp2_15: TppShape;
    pp2_10: TppShape;
    pp2_5: TppShape;
    ppShape51: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    btnPrint: TBitBtn;
    btnOpen: TBitBtn;
    raCodeModule1: TraCodeModule;
    ppSystemVariable1: TppSystemVariable;
    BitBtn1: TBitBtn;
    ppReport2: TppReport;
    ppDetailBand2: TppDetailBand;
    ppR21_21: TppShape;
    ppR21_16: TppShape;
    ppR21_11: TppShape;
    ppR21_6: TppShape;
    ppR21_1: TppShape;
    ppR21_22: TppShape;
    ppR21_17: TppShape;
    ppR21_12: TppShape;
    ppR21_7: TppShape;
    ppR21_2: TppShape;
    ppR21_23: TppShape;
    ppR21_18: TppShape;
    ppR21_13: TppShape;
    ppR21_8: TppShape;
    ppR21_3: TppShape;
    ppR21_24: TppShape;
    ppR21_19: TppShape;
    ppR21_14: TppShape;
    ppR21_9: TppShape;
    ppR21_4: TppShape;
    ppR21_25: TppShape;
    ppR21_20: TppShape;
    ppR21_15: TppShape;
    ppR21_10: TppShape;
    ppR21_5: TppShape;
    ppR22_21: TppShape;
    ppR22_16: TppShape;
    ppR22_11: TppShape;
    ppR22_6: TppShape;
    ppR22_1: TppShape;
    ppR22_22: TppShape;
    ppR22_17: TppShape;
    ppR22_12: TppShape;
    ppR22_7: TppShape;
    ppR22_2: TppShape;
    ppR22_23: TppShape;
    ppR22_18: TppShape;
    ppR22_13: TppShape;
    ppR22_8: TppShape;
    ppR22_3: TppShape;
    ppR22_24: TppShape;
    ppR22_19: TppShape;
    ppR22_14: TppShape;
    ppR22_9: TppShape;
    ppR22_4: TppShape;
    ppR22_25: TppShape;
    ppR22_20: TppShape;
    ppR22_15: TppShape;
    ppR22_10: TppShape;
    ppR22_5: TppShape;
    ppShape52: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppSystemVariable2: TppSystemVariable;
    raCodeModule2: TraCodeModule;
    ppParameterList2: TppParameterList;
    ppReport3: TppReport;
    ppDetailBand3: TppDetailBand;
    ppNORM1_21: TppShape;
    ppNORM1_16: TppShape;
    ppNORM1_11: TppShape;
    ppNORM1_6 : TppShape;
    ppNORM1_1 : TppShape;
    ppNORM1_22: TppShape;
    ppNORM1_17: TppShape;
    ppNORM1_12: TppShape;
    ppNORM1_7 : TppShape;
    ppNORM1_2 : TppShape;
    ppNORM1_23: TppShape;
    ppNORM1_18: TppShape;
    ppNORM1_13: TppShape;
    ppNORM1_8 : TppShape;
    ppNORM1_3 : TppShape;
    ppNORM1_24: TppShape;
    ppNORM1_19: TppShape;
    ppNORM1_14: TppShape;
    ppNORM1_9 : TppShape;
    ppNORM1_4 : TppShape;
    ppNORM1_25: TppShape;
    ppNORM1_20: TppShape;
    ppNORM1_15: TppShape;
    ppNORM1_10: TppShape;
    ppNORM1_5 : TppShape;
    ppNORM2_21: TppShape;
    ppNORM2_16: TppShape;
    ppNORM2_11: TppShape;
    ppNORM2_6 : TppShape;
    ppNORM2_1 : TppShape;
    ppNORM2_22: TppShape;
    ppNORM2_17: TppShape;
    ppNORM2_12: TppShape;
    ppNORM2_7 : TppShape;
    ppNORM2_2 : TppShape;
    ppNORM2_23: TppShape;
    ppNORM2_18: TppShape;
    ppNORM2_13: TppShape;
    ppNORM2_8 : TppShape;
    ppNORM2_3 : TppShape;
    ppNORM2_24: TppShape;
    ppNORM2_19: TppShape;
    ppNORM2_14: TppShape;
    ppNORM2_9 : TppShape;
    ppNORM2_4 : TppShape;
    ppNORM2_25: TppShape;
    ppNORM2_20: TppShape;
    ppNORM2_15: TppShape;
    ppNORM2_10: TppShape;
    ppNORM2_5 : TppShape;
    ppShape53: TppShape;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppSystemVariable3: TppSystemVariable;
    raCodeModule3: TraCodeModule;
    ppParameterList3: TppParameterList;
    btnPrintNormal: TBitBtn;
    ppReport4: TppReport;
    ppDetailBand4: TppDetailBand;
    ppR41_1: TppShape;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppSystemVariable4: TppSystemVariable;
    raCodeModule4: TraCodeModule;
    ppParameterList4: TppParameterList;
    ppR41_2: TppShape;
    ppR41_3: TppShape;
    ppR41_4: TppShape;
    ppR41_5: TppShape;
    ppR41_6: TppShape;
    ppR41_7: TppShape;
    ppR41_8: TppShape;
    ppR41_9: TppShape;
    ppR41_10: TppShape;
    ppR41_11: TppShape;
    ppR41_20: TppShape;
    ppR41_12: TppShape;
    ppR41_13: TppShape;
    ppR41_14: TppShape;
    ppR41_15: TppShape;
    ppR41_16: TppShape;
    ppR41_17: TppShape;
    ppR41_19: TppShape;
    ppR41_18: TppShape;
    Button1: TButton;
    ppR41_21: TppShape;
    ppR41_30: TppShape;
    ppR41_22: TppShape;
    ppR41_23: TppShape;
    ppR41_24: TppShape;
    ppR41_25: TppShape;
    ppR41_26: TppShape;
    ppR41_27: TppShape;
    ppR41_29: TppShape;
    ppR41_31: TppShape;
    ppR41_39: TppShape;
    ppR41_38: TppShape;
    ppR41_40: TppShape;
    ppR41_32: TppShape;
    ppR41_28: TppShape;
    ppR41_33: TppShape;
    ppR41_34: TppShape;
    ppR41_35: TppShape;
    ppR41_36: TppShape;
    ppR41_37: TppShape;
    ppR41_41: TppShape;
    ppR41_50: TppShape;
    ppR41_42: TppShape;
    ppR41_43: TppShape;
    ppR41_44: TppShape;
    ppR41_45: TppShape;
    ppR41_46: TppShape;
    ppR41_47: TppShape;
    ppR41_49: TppShape;
    ppR41_51: TppShape;
    ppR41_59: TppShape;
    ppR41_58: TppShape;
    ppR41_60: TppShape;
    ppR41_52: TppShape;
    ppR41_48: TppShape;
    ppR41_53: TppShape;
    ppR41_54: TppShape;
    ppR41_55: TppShape;
    ppR41_56: TppShape;
    ppR41_57: TppShape;
    ppShape115: TppShape;
    ppR42_1: TppShape;
    ppR42_10: TppShape;
    ppR42_11: TppShape;
    ppR42_12: TppShape;
    ppR42_13: TppShape;
    ppR42_14: TppShape;
    ppR42_15: TppShape;
    ppR42_16: TppShape;
    ppR42_17: TppShape;
    ppR42_18: TppShape;
    ppR42_19: TppShape;
    ppR42_2: TppShape;
    ppR42_20: TppShape;
    ppR42_21: TppShape;
    ppR42_22: TppShape;
    ppR42_23: TppShape;
    ppR42_24: TppShape;
    ppR42_25: TppShape;
    ppR42_26: TppShape;
    ppR42_27: TppShape;
    ppR42_28: TppShape;
    ppR42_29: TppShape;
    ppR42_3: TppShape;
    ppR42_30: TppShape;
    ppR42_31: TppShape;
    ppR42_32: TppShape;
    ppR42_33: TppShape;
    ppR42_34: TppShape;
    ppR42_35: TppShape;
    ppR42_36: TppShape;
    ppR42_37: TppShape;
    ppR42_38: TppShape;
    ppR42_39: TppShape;
    ppR42_4: TppShape;
    ppR42_40: TppShape;
    ppR42_41: TppShape;
    ppR42_42: TppShape;
    ppR42_43: TppShape;
    ppR42_44: TppShape;
    ppR42_45: TppShape;
    ppR42_46: TppShape;
    ppR42_47: TppShape;
    ppR42_48: TppShape;
    ppR42_49: TppShape;
    ppR42_5: TppShape;
    ppR42_50: TppShape;
    ppR42_51: TppShape;
    ppR42_52: TppShape;
    ppR42_53: TppShape;
    ppR42_54: TppShape;
    ppR42_55: TppShape;
    ppR42_56: TppShape;
    ppR42_57: TppShape;
    ppR42_58: TppShape;
    ppR42_59: TppShape;
    ppR42_6: TppShape;
    ppR42_60: TppShape;
    ppR42_7: TppShape;
    ppR42_9: TppShape;
    ppR42_8: TppShape;
    procedure btnPrintClick(Sender: TObject);
    procedure ppDBText1GetText(Sender: TObject; var Text: string);
    procedure btnOpenClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPrintNormalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Relatorio : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Relatorio := 'R2';
  ppReport2.Print;
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  if not MyConnection1.Connected then
    MyConnection1.Connect;
  MyQuery1.Open;
end;

procedure TForm1.btnPrintClick(Sender: TObject);
begin
  Relatorio := '';
  ppReport1.Print;
end;

procedure TForm1.btnPrintNormalClick(Sender: TObject);
begin
  Relatorio := 'NORM';
  ppReport3.Print;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Relatorio := 'R4';
  ppReport4.Print;
end;

procedure TForm1.ppDBText1GetText(Sender: TObject; var Text: string);
  procedure PrintaBola(iNumero , iParte : Integer);
  var
    sNameComponent : string;
  begin
    sNameComponent := 'pp' + Relatorio + IntToStr(iParte) + '_' + IntToStr(iNumero);
    (FindComponent(sNameComponent) as TppShape).Visible := True;
//    ShowMessage((FindComponent('pp' + IntToStr(iParte) + '_' + IntToStr(iNumero)) as TppShape).Name);
//    case iParte of
//      1 : begin case iNumero of
//              1 : pp1_1.Visible  := True;
//              2 : pp1_2.Visible  := True;
//              3 : pp1_3.Visible  := True;
//              4 : pp1_4.Visible  := True;
//              5 : pp1_5.Visible  := True;
//              6 : pp1_6.Visible  := True;
//              7 : pp1_7.Visible  := True;
//              8 : pp1_8.Visible  := True;
//              9 : pp1_9.Visible  := True;
//              10: pp1_10.Visible := True;
//              11: pp1_11.Visible := True;
//              12: pp1_12.Visible := True;
//              13: pp1_13.Visible := True;
//              14: pp1_14.Visible := True;
//              15: pp1_15.Visible := True;
//              16: pp1_16.Visible := True;
//              17: pp1_17.Visible := True;
//              18: pp1_18.Visible := True;
//              19: pp1_19.Visible := True;
//              20: pp1_20.Visible := True;
//              21: pp1_21.Visible := True;
//              22: pp1_22.Visible := True;
//              23: pp1_23.Visible := True;
//              24: pp1_24.Visible := True;
//              25: pp1_25.Visible := True;
//                end;
//          end;
//
//      2 : begin case iNumero of
//              1 : pp2_1.Visible  := True;
//              2 : pp2_2.Visible  := True;
//              3 : pp2_3.Visible  := True;
//              4 : pp2_4.Visible  := True;
//              5 : pp2_5.Visible  := True;
//              6 : pp2_6.Visible  := True;
//              7 : pp2_7.Visible  := True;
//              8 : pp2_8.Visible  := True;
//              9 : pp2_9.Visible  := True;
//              10: pp2_10.Visible := True;
//              11: pp2_11.Visible := True;
//              12: pp2_12.Visible := True;
//              13: pp2_13.Visible := True;
//              14: pp2_14.Visible := True;
//              15: pp2_15.Visible := True;
//              16: pp2_16.Visible := True;
//              17: pp2_17.Visible := True;
//              18: pp2_18.Visible := True;
//              19: pp2_19.Visible := True;
//              20: pp2_20.Visible := True;
//              21: pp2_21.Visible := True;
//              22: pp2_22.Visible := True;
//              23: pp2_23.Visible := True;
//              24: pp2_24.Visible := True;
//              25: pp2_25.Visible := True;
//                end;
//          end;
//    end;
  end;
begin
  pp1_1.Visible := False;
  pp1_2.Visible := False;
  pp1_3.Visible := False;
  pp1_4.Visible := False;
  pp1_5.Visible := False;
  pp1_6.Visible := False;
  pp1_7.Visible := False;
  pp1_8.Visible := False;
  pp1_9.Visible := False;
  pp1_10.Visible := False;
  pp1_11.Visible := False;
  pp1_12.Visible := False;
  pp1_13.Visible := False;
  pp1_14.Visible := False;
  pp1_15.Visible := False;
  pp1_16.Visible := False;
  pp1_17.Visible := False;
  pp1_18.Visible := False;
  pp1_19.Visible := False;
  pp1_20.Visible := False;
  pp1_21.Visible := False;
  pp1_22.Visible := False;
  pp1_23.Visible := False;
  pp1_24.Visible := False;
  pp1_25.Visible := False;
  pp2_1.Visible := False;
  pp2_2.Visible := False;
  pp2_3.Visible := False;
  pp2_4.Visible := False;
  pp2_5.Visible := False;
  pp2_6.Visible := False;
  pp2_7.Visible := False;
  pp2_8.Visible := False;
  pp2_9.Visible := False;
  pp2_10.Visible := False;
  pp2_11.Visible := False;
  pp2_12.Visible := False;
  pp2_13.Visible := False;
  pp2_14.Visible := False;
  pp2_15.Visible := False;
  pp2_16.Visible := False;
  pp2_17.Visible := False;
  pp2_18.Visible := False;
  pp2_19.Visible := False;
  pp2_20.Visible := False;
  pp2_21.Visible := False;
  pp2_22.Visible := False;
  pp2_23.Visible := False;
  pp2_24.Visible := False;
  pp2_25.Visible := False;
  ppR21_1.Visible := False;
  ppR21_2.Visible := False;
  ppR21_3.Visible := False;
  ppR21_4.Visible := False;
  ppR21_5.Visible := False;
  ppR21_6.Visible := False;
  ppR21_7.Visible := False;
  ppR21_8.Visible := False;
  ppR21_9.Visible := False;
  ppR21_10.Visible := False;
  ppR21_11.Visible := False;
  ppR21_12.Visible := False;
  ppR21_13.Visible := False;
  ppR21_14.Visible := False;
  ppR21_15.Visible := False;
  ppR21_16.Visible := False;
  ppR21_17.Visible := False;
  ppR21_18.Visible := False;
  ppR21_19.Visible := False;
  ppR21_20.Visible := False;
  ppR21_21.Visible := False;
  ppR21_22.Visible := False;
  ppR21_23.Visible := False;
  ppR21_24.Visible := False;
  ppR21_25.Visible := False;
  ppR22_1.Visible := False;
  ppR22_2.Visible := False;
  ppR22_3.Visible := False;
  ppR22_4.Visible := False;
  ppR22_5.Visible := False;
  ppR22_6.Visible := False;
  ppR22_7.Visible := False;
  ppR22_8.Visible := False;
  ppR22_9.Visible := False;
  ppR22_10.Visible := False;
  ppR22_11.Visible := False;
  ppR22_12.Visible := False;
  ppR22_13.Visible := False;
  ppR22_14.Visible := False;
  ppR22_15.Visible := False;
  ppR22_16.Visible := False;
  ppR22_17.Visible := False;
  ppR22_18.Visible := False;
  ppR22_19.Visible := False;
  ppR22_20.Visible := False;
  ppR22_21.Visible := False;
  ppR22_22.Visible := False;
  ppR22_23.Visible := False;
  ppR22_24.Visible := False;
  ppR22_25.Visible := False;

  ppNORM1_1.Visible := False;
  ppNORM1_2.Visible := False;
  ppNORM1_3.Visible := False;
  ppNORM1_4.Visible := False;
  ppNORM1_5.Visible := False;
  ppNORM1_6.Visible := False;
  ppNORM1_7.Visible := False;
  ppNORM1_8.Visible := False;
  ppNORM1_9.Visible := False;
  ppNORM1_10.Visible := False;
  ppNORM1_11.Visible := False;
  ppNORM1_12.Visible := False;
  ppNORM1_13.Visible := False;
  ppNORM1_14.Visible := False;
  ppNORM1_15.Visible := False;
  ppNORM1_16.Visible := False;
  ppNORM1_17.Visible := False;
  ppNORM1_18.Visible := False;
  ppNORM1_19.Visible := False;
  ppNORM1_20.Visible := False;
  ppNORM1_21.Visible := False;
  ppNORM1_22.Visible := False;
  ppNORM1_23.Visible := False;
  ppNORM1_24.Visible := False;
  ppNORM1_25.Visible := False;
  ppNORM2_1.Visible := False;
  ppNORM2_2.Visible := False;
  ppNORM2_3.Visible := False;
  ppNORM2_4.Visible := False;
  ppNORM2_5.Visible := False;
  ppNORM2_6.Visible := False;
  ppNORM2_7.Visible := False;
  ppNORM2_8.Visible := False;
  ppNORM2_9.Visible := False;
  ppNORM2_10.Visible := False;
  ppNORM2_11.Visible := False;
  ppNORM2_12.Visible := False;
  ppNORM2_13.Visible := False;
  ppNORM2_14.Visible := False;
  ppNORM2_15.Visible := False;
  ppNORM2_16.Visible := False;
  ppNORM2_17.Visible := False;
  ppNORM2_18.Visible := False;
  ppNORM2_19.Visible := False;
  ppNORM2_20.Visible := False;
  ppNORM2_21.Visible := False;
  ppNORM2_22.Visible := False;
  ppNORM2_23.Visible := False;
  ppNORM2_24.Visible := False;
  ppNORM2_25.Visible := False;


  ppR41_1.Visible := False;
  ppR41_2.Visible := False;
  ppR41_3.Visible := False;
  ppR41_4.Visible := False;
  ppR41_5.Visible := False;
  ppR41_6.Visible := False;
  ppR41_7.Visible := False;
  ppR41_8.Visible := False;
  ppR41_9.Visible := False;
  ppR41_10.Visible := False;
  ppR41_11.Visible := False;
  ppR41_12.Visible := False;
  ppR41_13.Visible := False;
  ppR41_14.Visible := False;
  ppR41_15.Visible := False;
  ppR41_16.Visible := False;
  ppR41_17.Visible := False;
  ppR41_18.Visible := False;
  ppR41_19.Visible := False;
  ppR41_20.Visible := False;
  ppR41_21.Visible := False;
  ppR41_22.Visible := False;
  ppR41_23.Visible := False;
  ppR41_24.Visible := False;
  ppR41_25.Visible := False;
  ppR41_26.Visible := False;
  ppR41_27.Visible := False;
  ppR41_28.Visible := False;
  ppR41_29.Visible := False;
  ppR41_30.Visible := False;
  ppR41_31.Visible := False;
  ppR41_32.Visible := False;
  ppR41_33.Visible := False;
  ppR41_34.Visible := False;
  ppR41_35.Visible := False;
  ppR41_36.Visible := False;
  ppR41_37.Visible := False;
  ppR41_38.Visible := False;
  ppR41_39.Visible := False;
  ppR41_40.Visible := False;
  ppR41_41.Visible := False;
  ppR41_42.Visible := False;
  ppR41_43.Visible := False;
  ppR41_44.Visible := False;
  ppR41_45.Visible := False;
  ppR41_46.Visible := False;
  ppR41_47.Visible := False;
  ppR41_48.Visible := False;
  ppR41_49.Visible := False;
  ppR41_50.Visible := False;
  ppR41_51.Visible := False;
  ppR41_52.Visible := False;
  ppR41_53.Visible := False;
  ppR41_54.Visible := False;
  ppR41_55.Visible := False;
  ppR41_56.Visible := False;
  ppR41_57.Visible := False;
  ppR41_58.Visible := False;
  ppR41_59.Visible := False;
  ppR41_60.Visible := False;
  ppR42_1.Visible := False;
  ppR42_2.Visible := False;
  ppR42_3.Visible := False;
  ppR42_4.Visible := False;
  ppR42_5.Visible := False;
  ppR42_6.Visible := False;
  ppR42_7.Visible := False;
  ppR42_8.Visible := False;
  ppR42_9.Visible := False;
  ppR42_10.Visible := False;
  ppR42_11.Visible := False;
  ppR42_12.Visible := False;
  ppR42_13.Visible := False;
  ppR42_14.Visible := False;
  ppR42_15.Visible := False;
  ppR42_16.Visible := False;
  ppR42_17.Visible := False;
  ppR42_18.Visible := False;
  ppR42_19.Visible := False;
  ppR42_20.Visible := False;
  ppR42_21.Visible := False;
  ppR42_22.Visible := False;
  ppR42_23.Visible := False;
  ppR42_24.Visible := False;
  ppR42_25.Visible := False;
  ppR42_26.Visible := False;
  ppR42_27.Visible := False;
  ppR42_28.Visible := False;
  ppR42_29.Visible := False;
  ppR42_30.Visible := False;
  ppR42_31.Visible := False;
  ppR42_32.Visible := False;
  ppR42_33.Visible := False;
  ppR42_34.Visible := False;
  ppR42_35.Visible := False;
  ppR42_36.Visible := False;
  ppR42_37.Visible := False;
  ppR42_38.Visible := False;
  ppR42_39.Visible := False;
  ppR42_40.Visible := False;
  ppR42_41.Visible := False;
  ppR42_42.Visible := False;
  ppR42_43.Visible := False;
  ppR42_44.Visible := False;
  ppR42_45.Visible := False;
  ppR42_46.Visible := False;
  ppR42_47.Visible := False;
  ppR42_48.Visible := False;
  ppR42_49.Visible := False;
  ppR42_50.Visible := False;
  ppR42_51.Visible := False;
  ppR42_52.Visible := False;
  ppR42_53.Visible := False;
  ppR42_54.Visible := False;
  ppR42_55.Visible := False;
  ppR42_56.Visible := False;
  ppR42_57.Visible := False;
  ppR42_58.Visible := False;
  ppR42_59.Visible := False;
  ppR42_60.Visible := False;

  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA1').AsInteger, 1);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA2').AsInteger, 1);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA3').AsInteger, 1);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA4').AsInteger, 1);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA5').AsInteger, 1);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA6').AsInteger, 1);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA1_1').AsInteger, 2);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA2_1').AsInteger, 2);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA3_1').AsInteger, 2);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA4_1').AsInteger, 2);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA5_1').AsInteger, 2);
  PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA6_1').AsInteger, 2);
  
  if Relatorio <> 'R4' then begin

    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA7').AsInteger, 1);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA8').AsInteger, 1);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA9').AsInteger, 1);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA10').AsInteger, 1);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA11').AsInteger, 1);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA12').AsInteger, 1);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA13').AsInteger, 1);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA14').AsInteger, 1);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA15').AsInteger, 1);
  
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA7_1').AsInteger, 2);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA8_1').AsInteger, 2);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA9_1').AsInteger, 2);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA10_1').AsInteger, 2);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA11_1').AsInteger, 2);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA12_1').AsInteger, 2);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA13_1').AsInteger, 2);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA14_1').AsInteger, 2);
    PrintaBola(ppDBPipeline1.DataSource.DataSet.FieldByName('NBBOLA15_1').AsInteger, 2);
  
  end;
    
end;

end.
