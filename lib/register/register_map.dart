import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:kangsayur/API/auth/Auth.dart';
import 'package:location/location.dart' as loc;
import '../../../Constants/app_constants.dart';
import 'package:latlong2/latlong.dart';
import '../../../common/color_value.dart';

class Register_map extends StatefulWidget {
  Register_map({
    Key? key,
    required this.email,
    required this.name,
    required this.password,
    required this.image,
    required this.address,
    required this.phone,
    required this.dateOfBirth,
  }) : super(key: key);
  final String email;
  final String name;
  final String password;
  final File image;
  final String address;
  final String phone;
  final DateTime dateOfBirth;

  @override
  _Register_mapState createState() => _Register_mapState();
}

class _Register_mapState extends State<Register_map> {
  String? _currentAddress;
  LatLng _currentPosition = AppConstants.myLocation;
  final List<Marker> _markers = [];
  Marker? _currentMarker;
  // circle progress
  bool _isLoading = false;

  var mapController = MapController();

  void _handleTap(tapPosition, LatLng tappedPoint) async {
    _currentPosition = tappedPoint;
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          point: tappedPoint,
          builder: (context) => const Icon(
            Icons.location_pin,
            size: 50,
            color: ColorValue.primaryColor,
          ),
        ),
      );
    });

    // Mendapatkan alamat berdasarkan koordinat marker
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      if (placemarks.isNotEmpty) {
        Placemark currentPlacemark = placemarks[0];
        String formattedAddress =
            "${currentPlacemark.street}, ${currentPlacemark.locality}, ${currentPlacemark.administrativeArea} ${currentPlacemark.postalCode}, ${currentPlacemark.country}";
        setState(() {
          _currentAddress = formattedAddress;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      if (placemarks.isNotEmpty) {
        Placemark currentPlacemark = placemarks[0];
        String formattedAddress =
            "${currentPlacemark.street}, ${currentPlacemark.locality}, ${currentPlacemark.administrativeArea} ${currentPlacemark.postalCode}, ${currentPlacemark.country}";
        setState(() {
          _currentAddress = formattedAddress;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _getCurrentLocation() async {
    final location = loc.Location();
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;
    loc.LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    setState(() {
      _currentPosition =
          LatLng(locationData.latitude!, locationData.longitude!);
    });
    _getAddressFromLatLng();

    // Memindahkan peta ke lokasi pengguna atau marker
    mapController.move(
        _currentPosition, 14.0); // Sesuaikan level zoom jika perlu
  }

  String convertToText(TextEditingController controller) {
    String text = controller.text;
    text = text.replaceAll("┤", "").replaceAll("├", "");
    return text;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAddressFromLatLng();
    _getCurrentLocation();
    mapController = MapController(); // Initialize the mapController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lokasi Anda",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: AppConstants.myLocation,
              zoom: 14.0,
              onTap: _handleTap,
            ),
            mapController: mapController,
            children: [
              TileLayer(
                urlTemplate: AppConstants.mapBoxStyleId,
                additionalOptions: const {
                  'accessToken': AppConstants.mapBoxAccessToken,
                  'id': 'mapbox.mapbox-streets-v8',
                  'mapStyleId': AppConstants.mapBoxStyleId
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: _currentPosition,
                    builder: (ctx) => const Icon(
                      Icons.location_pin,
                      size: 50,
                      color: ColorValue.primaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alamat: $_currentAddress',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: ColorValue.neutralColor,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 15),
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await Auth.register(
                          widget.name.toString(),
                          widget.image,
                          widget.email.toString(),
                          widget.password.toString(),
                          widget.address.toString(),
                          widget.phone,
                          widget.dateOfBirth,
                          context,
                          _currentPosition.latitude.toDouble().toString(),
                          _currentPosition.longitude.toDouble().toString());
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorValue.primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            'Pilih Lokasi & Daftar',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _loadin(){
    return                   Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
        child: Center(
          child: Text(
            'Pilih Lokasi & Daftar',
            style:
            Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ));

  }
}
