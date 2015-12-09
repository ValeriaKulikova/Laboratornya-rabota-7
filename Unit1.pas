unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ListBox1: TListBox;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var


  Form1: TForm1;
   h: HWND;


function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall;

implementation


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if FindWindow(nil, '1.txt - AkelPad') <> 0 then
  ShowMessage('Окно найдено')
else
  ShowMessage('Окно не найдено');

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  h := findwindow(nil, '1.txt - AkelPad');
  if h <> 0 then
    SetWindowPos(h, HWND_BOTTOM, 320, 200, 20, 20, swp_nosize);
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
setwindowtext (h,'2.txt - AkelPad')

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 h := findwindow(nil, '1.txt - AkelPad');
    if h<> 0 then
    begin
       if IsIconic(h) then
         Showwindow(h,sw_minimize)
       else
      Showwindow(h,sw_maximize);
    end;


end;

function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall; //
 Var Nm:Array[0..255] of Char; // буфер для имени
Cs: Array[0..255] of Char; // буфер для класса
Begin GetWindowText(Wd,Nm,255); // считываем текст заголовка окна
GetClassName(Wd,Cs,255); // считываем название класса окна
Form1.ListBox1.Items.Add(String(Nm)+'/'+String(Cs)); //добавляем название окна и класс в список
EnumProc := TRUE; // продолжать искать окна...
end;

procedure TForm1.Button5Click(Sender: TObject);

begin
ListBox1.Items.Clear; // Очистим список перед началом поисков
 EnumWindows (@EnumProc, 0); // и скажем-искать
end;

procedure TForm1.Button6Click(Sender: TObject);
var canvas:TCanvas;
begin
h:= FindWindow(nil,'1.txt - AkelPad');

   canvas:=TCanvas.Create;
with canvas do
begin
handle:=getdc(h); // теперь с поверхностью кнопки можно работать,как с простой канвой
rectangle(0,0,100,100); // рисуем прямоугольник на кнопке
font.color:=$0000ff; // ставим красный цвет шрифта
textout(10,0,'Нажми');
textout(13,10,'меня'); //выводим текст
free; // освобождаем память
end;
releasedc(0,getdc(h));
end;

end.






