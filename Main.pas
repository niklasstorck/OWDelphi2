unit Main;

interface

uses
  System.JSON, IdHTTP,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  IdHTTP: TIdHTTP;
  APIKey: string;
  Lon, Lat: Double;
  APIResponse: string;
  JSONObj: TJSONObject;
  MainObj: TJSONObject;
  Temperature, Humidity, WindSpeed: Double;
  WeatherArr: TJSONArray;
  WeatherObj: TJSONObject;
  Description: string;
begin
  // get the longitude and latitude values from the text boxes
  Lat := StrToFloat(Edit1.Text);
  Lon := StrToFloat(Edit2.Text);

  // set your API key
  APIKey := 'your_api_key_here';

  // set up the HTTP client
  IdHTTP := TIdHTTP.Create(nil);
  try
    IdHTTP.IOHandler := IdHTTP.IOHandler.Create(IdHTTP);
    IdHTTP.HandleRedirects := True;
    IdHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:80.0) Gecko/20100101 Firefox/80.0';
    IdHTTP.Request.Accept := 'application/json';
    IdHTTP.Request.ContentType := 'application/json';

    // send the request to the API
    APIResponse := IdHTTP.Get('https://api.openweathermap.org/data/2.5/weather?lat='
                              + FloatToStr(Lat) + '&lon=' + FloatToStr(Lon) + '&appid=' + APIKey);

    // parse the JSON response
    JSONObj := TJSONObject.ParseJSONValue(APIResponse) as TJSONObject;
    try
      // extract the weather information from the JSON
      MainObj := JSONObj.GetValue('main') as TJSONObject;
      Temperature := MainObj.GetValue('temp').AsType<Double> - 273.15;
      Humidity := MainObj.GetValue('humidity').AsType<Double>;

      WeatherArr := JSONObj.GetValue('weather') as TJSONArray;
      WeatherObj := WeatherArr.Items[0] as TJSONObject;
      Description := WeatherObj.GetValue('description').Value;

      //WindSpeed := JSONObj.GetValue('wind').GetValue('speed').AsType<Double>;
    finally
      JSONObj.Free;
    end;

    // display the weather data
    Label1.Text := Format('Temperature: %.1f°C', [Temperature]);
    Label2.Text := Format('Humidity: %.0f%%', [Humidity]);
    //Label3.Text := Format('Wind speed: %.1f m/s', [WindSpeed]);
    //Label4.Text := 'Description: ' + Description;
  finally
    IdHTTP.Free;
  end;
end;


end.
