import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');

    if (response.statusCode == 200) {
      String rBody = response.body;
      String rStatus = response.statusCode.toString();

      var decoded = jsonDecode(rBody)['coord'];
      var decodedLatitude = jsonDecode(rBody)['coord']['lat'];
      var description = jsonDecode(rBody)['weather'][0]['description'];

      var sMain = jsonDecode(rBody)['weather'][0]['main'];

      double challengeTemp = jsonDecode(rBody)['main']['temp'];
      int challengeConditionNumber = jsonDecode(rBody)['weather'][0]['id'];
      String challengeConditionName = jsonDecode(rBody)['name'];

      print('Response Body: $rBody');
      print('Status code: $rStatus');
      print('decoded Body: $decoded');
      print('decoded Latitude: $decodedLatitude');
      print('Description: $description');
      print('main: $sMain');

      print('Challenge temp: $challengeTemp');
      print('Challenge Condition Number: $challengeConditionNumber');
      print('Challenge Condition Name: $challengeConditionName');
    } else {
      print(response.statusCode);
    }
  }
}
