import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  LocationProvider() {
    getLocation();
  }

  bool isLoading = true;

  bool get loading {
    return isLoading;
  }

  Map<String, dynamic> _coorDinates = {'lat': 0.0, 'lng': 0.0};

  Map<String, dynamic> get coorDinates {
    return {..._coorDinates};
  }

  String _address = '';
  String _deliveryAddress = '';
  String? _state = '';

  String? get state {
    return _state;
  }

  String get address {
    return _address;
  }

  String get deliveryAddress {
    return _deliveryAddress;
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  // ignore: non_constant_identifier_names
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    _address = '${place.subLocality}';
    _deliveryAddress =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    _state = place.administrativeArea;
    _coorDinates['lat'] = position.latitude;
    _coorDinates['lng'] = position.longitude;
    print('Coordinates in Location ${_coorDinates['lat']}');
    print('Coordinates in Location ${_coorDinates['lng']}');
    // setState(() {});
    notifyListeners();
  }

  Future<void> setNewAddress(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    _address = '${place.subLocality}';
    print('Address $_address');
    // setState(() {});
    _state = place.administrativeArea;
    _coorDinates['lat'] = latitude;
    _coorDinates['lng'] = longitude;
    notifyListeners();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getLocation();
  // }

  Future<void> getLocation() async {
    Position position = await _getGeoLocationPosition();
    GetAddressFromLatLong(position).then((_) {
      if (_address.length > 0) {
        isLoading = false;
      } else {
        isLoading = true;
      }
    });
    notifyListeners();
  }
}
