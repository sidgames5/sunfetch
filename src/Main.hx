import haxe.Json;
import sys.Http;

using StringTools;

class Main {
	static function main() {
		var ipreq = new Http("https://api.ipgeolocation.io/ipgeo?apiKey=" + Secrets.API_KEY);

		var lat = 0.0;
		var lon = 0.0;

		ipreq.onData = (d:String) -> {
			var data = Json.parse(d);

			lat = data.latitude;
			lon = data.longitude;
		};

		ipreq.onError = (m:String) -> trace(m);

		ipreq.request();

		var sunreq = new Http('https://api.sunrisesunset.io/json?lat=$lat&lng=$lon');

		sunreq.onData = (d:String) -> {
			var data = Json.parse(d);

			Sys.println("First Light: " + timeformat(data.results.first_light, "0"));
			Sys.println("    Sunrise: " + timeformat(data.results.sunrise, "0"));
			Sys.println("       Noon: " + timeformat(data.results.solar_noon, "0"));
			Sys.println("Golden Hour: " + timeformat(data.results.golden_hour, "0"));
			Sys.println("     Sunset: " + timeformat(data.results.sunset, "0"));
			Sys.println(" Last Light: " + timeformat(data.results.last_light, "0"));
		};

		sunreq.request();
	}

	private static function timeformat(text:String, extendifycharacter:String):String {
		if (text.length < 11) {
			text = extendifycharacter + text;
		}
		return text;
	}
}
