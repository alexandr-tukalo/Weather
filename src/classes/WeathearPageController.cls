public class WeathearPageController {
    public WeatherApi weather  {set; get;}
    public WeathearPageController (){
        weather = (WeatherApi)WeatherApi.MakeGetCallout(''); 
    }
}