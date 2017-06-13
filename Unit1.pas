unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.TMSLiveGridDataBinding, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Controls.Presentation, FMX.Edit,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.TMSGridCell,
  FMX.TMSGridOptions, FMX.TMSGridData, FMX.TMSCustomGrid, FMX.TMSLiveGrid,
  FMX.TMSBaseControl, FMX.TMSSlider, FireDAC.Stan.StorageBin;

type
  TForm1 = class(TForm)
    Slider: TTMSFMXSlider;
    LG: TTMSFMXLiveGrid;
    FDMemTable1: TFDMemTable;
    SliderEdit: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    procedure SliderEditValidate(Sender: TObject; var Text: string);
    procedure SliderStateChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.SliderEditValidate(Sender: TObject; var Text: string);
begin
  case Text.ToInteger of
    0: Slider.State := ssOn;
    1: Slider.State := ssOff;
  end;
end;

procedure TForm1.SliderStateChanged(Sender: TObject);
begin
  case Slider.State of
    ssOn: SliderEdit.Text := '0';
    ssOff: SliderEdit.Text := '1';
  end;
  TLinkObservers.ControlChanged(SliderEdit);
  FDMemTable1.Post;
end;

end.
