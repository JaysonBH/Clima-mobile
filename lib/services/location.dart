import 'package:geolocator/geolocator.dart';

const baseOpenWeatherMapsURL =
    'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '4ac2294bbaeec8fcfa64ec335977e83d';

class Location {
  double _latitude = 0;
  double _longitude = 0;

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (exception) {
      print(exception);
    }
  }

  void printCurrentLocation() {
    print('Lat: $_latitude, Long: $_longitude');
  }

  String getLongLatUrl() {
    return '$baseOpenWeatherMapsURL?lat=$_latitude&lon=$_longitude&units=imperial&appid=$apiKey';
  }

  String getUrlByLocationName(String cityName) {
    return '$baseOpenWeatherMapsURL?q=$cityName&units=imperial&appid=$apiKey';
  }
}
