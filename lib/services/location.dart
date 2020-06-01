import 'package:geolocator/geolocator.dart';

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
}
