import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as loc;

import '../../../../../../API/alamat/alamat.dart';
import '../../../../../../Constants/app_constants.dart';
import '../../../../../../common/color_value.dart';

class EditAlamatMap extends StatefulWidget {
  EditAlamatMap(
      {Key? key,
      required this.alamatId,
      required this.labelAlamat,
      required this.namaPenerima,
      required this.noHpPenerima,
      required this.alamat,
      required this.latitude,
      required this.longitude,
      required this.prioritasAlamat})
      : super(key: key);
  final String labelAlamat;
  final String namaPenerima;
  final String noHpPenerima;
  final String alamat;
  final int alamatId;
  final double latitude;
  final double longitude;
  final String prioritasAlamat;

  @override
  State<EditAlamatMap> createState() => _EditAlamatMapState();
}

class _EditAlamatMapState extends State<EditAlamatMap> {
  String? _currentAddress;
  late LatLng _currentPosition = AppConstants.myLocation;
  final List<Marker> _markers = [];
  Marker? _currentMarker;

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
    _getCurrentLocation();
    _getAddressFromLatLng();
    mapController = MapController(); // Initialize the mapController
  }

  //loading
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Ubah Alamat",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
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
                  Text(
                    'Latitude: ${_currentPosition.latitude.toStringAsFixed(6)}',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Longitude: ${_currentPosition.longitude.toStringAsFixed(6)}',
                  ),
                  const SizedBox(height: 15),
                  if (_isLoading)
                    _loading()
                  else
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await Alamat.EditAlamat(
                            widget.namaPenerima,
                            widget.alamat,
                            widget.noHpPenerima,
                            _currentPosition.latitude,
                            _currentPosition.longitude,
                            widget.labelAlamat,
                            widget.alamatId,
                            widget.prioritasAlamat,
                            context);
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
                              'Pilih Lokasi',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
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

  Widget _loading() {
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
        child: Center(
          child: Text(
            'Pilih Lokasi',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
          ),
        ));
  }
}
