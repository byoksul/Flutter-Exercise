import 'package:geolocator/geolocator.dart';

class GpsService {
  //Geolocator _geolocator = Geolocator();
  late Position _position;

  Future<Position> getPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    //return _position;
  }
}
