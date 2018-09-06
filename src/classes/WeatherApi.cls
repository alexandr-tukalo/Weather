public class WeatherApi {
    private static final String key = '[04ad3e8cc469de9df1c9bba0e038bfcc]';
    
//    private MainWrapper weather;
//private class MainWrapper {    
        public List<PropWeather> classProp 	{set; get;}
        public classCity city 				{set; get;}
        public String message 				{set; get;}
//}
    
    
    public class PropWeather {
        public classMain main 				{set; get;}
        public classWind wind 				{set; get;}
        public String dt_txt				{set; get;}
    }
    
    public class classMain {
       	public Double temp 			{set; get;}
       	public Double pressure		{set; get;}
       	public Double temp_min		{set; get;}
       	public Double temp_max		{set; get;}
        public Double sea_level		{set; get;}
        public Double grnd_level	{set; get;}
        public Double humidity		{set; get;}
        public Double temp_kf		{set; get;}
	}
    
    public class classWind {
        public Double speed			{set; get;}
        public Double deg			{set; get;}
	}

    public class classCity {
      	public Integer id 			{set; get;}
        public String name 			{set; get;}
        public classCoord coord  	{set; get;}
        public String country		{set; get;}
        public Integer population	{set; get;}
	}
    
    public class classCoord {
        public Double lat 			{set; get;}
        public Double lon 			{set; get;}
	}
            
    private static WeatherApi Parse(String JSON) {
        return (WeatherApi)System.JSON.deserialize(JSON, WeatherApi.class);
    }
        
    public static WeatherApi MakeGetCallout(String address) {
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.openweathermap.org/data/2.5/forecast?q=Vitebsk,BY&APPID=04ad3e8cc469de9df1c9bba0e038bfcc');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        WeatherApi WeatherApiClass;
        
        if (response.getStatusCode() == 200) {
            /*
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
			system.debug(results.keySet());
			Map<String, Object> coord = (Map<String, Object>) results.get('main');
            System.debug(String.valueOf(coord.get('temp')));
            */
            String strjson = response.getbody();
            String newStrjson = strjson.replace('list', 'classProp');
          //  System.debug(newStrjson);  
          	WeatherApiClass = Parse(newStrjson);
			System.debug(WeatherApiClass);
         //  System.debug(WeatherApiClass.classProp[20].main.temp);     
		}      
        return WeatherApiClass;
    }
}