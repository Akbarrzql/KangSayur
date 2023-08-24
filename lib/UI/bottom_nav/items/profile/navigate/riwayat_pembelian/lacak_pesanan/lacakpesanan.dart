import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:kangsayur/API/chat/chat.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pusher_client/pusher_client.dart';

import '../../../../../../../Constants/app_constants.dart';
import '../../../../../../../common/color_value.dart';
import '../../../../../../../model/statuspesanandiantarmodel.dart';

class Lacak_Pesanan extends StatefulWidget {
  Lacak_Pesanan({
    Key? key,
    required this.idPesanan,
    required this.latitude,
    required this.longitude,
    required this.namaDriver,
    required this.photorDriver,
    required this.platKendaraan,
    required this.nameKendaraan,
    required this.photoKendaraan, required this.idDriver,
  }) : super(key: key);
  String idPesanan;
  double latitude;
  double longitude;
  final String namaDriver;
  final String photorDriver;
  final String platKendaraan;
  final String nameKendaraan;
  final String photoKendaraan;
  final int idDriver;

  @override
  State<Lacak_Pesanan> createState() => _Lacak_PesananState();
}

class _Lacak_PesananState extends State<Lacak_Pesanan> {
  String? _currentAddress;
  LatLng _currentPosition = AppConstants.myLocation;
  final List<Marker> _markers = [];
  Marker? _currentMarker;
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Timer? dateTimeOutTimer;

  late PusherClient pusher;
  StreamController<dynamic> dataStreamController = StreamController<dynamic>();

  var mapController = MapController();

  void _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(widget.latitude, widget.longitude);

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

  void _getCurrentLocation(double latitude, double longitude) async {
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

    _getPolyline(
        latitude, longitude); // Panggil fungsi untuk mengambil polyline

    // Memindahkan peta ke lokasi pengguna atau marker
    // mapController.move(_currentPosition, 14.0); // Sesuaikan level zoom jika perlu
  }

  void _getPolyline(double latitude, double longitude) async {
    String url =
        'https://api.mapbox.com/directions/v5/mapbox/driving/${widget.longitude},${widget.latitude};${longitude},${latitude}?overview=full&geometries=geojson&access_token=${AppConstants.mapBoxAccessToken}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> coordinates = data['routes'][0]['geometry']['coordinates'];

      setState(() {
        polylineCoordinates =
            coordinates.map((coord) => LatLng(coord[1], coord[0])).toList();
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> _initPusher() async {
    try {
      pusher = PusherClient(
        'a1b4c333a2e77bd3dc40',
        PusherOptions(
          cluster: 'ap1',
          encrypted: true,
        ),
      );

      pusher.onConnectionStateChange((state) {
        print('Connection state changed: $state');
      });

      pusher.onConnectionError((error) {
        print('Error connecting to Pusher: $error');
      });

      await pusher.connect();

      // Subscribe to a channel
      Channel channel = pusher.subscribe('delivery.${widget.idPesanan}');

      //untuk subscribe ke channel private
      // Channel channel = pusher.subscribePrivate('private-delivery');

      //unsbuscribe channel
      // pusher.unsubscribe('delivery');

      //disconnect
      // pusher.disconnect();

      // Bind to an event
      channel.bind('updateLoc', (event) {
        print('Menerima data: $event');
        String eventDataString = event?.data ?? '';
        if (eventDataString.isNotEmpty) {
          Map<String, dynamic> eventData =
              Map<String, dynamic>.from(json.decode(eventDataString));
          double latitude =
              double.tryParse(eventData['lat']?.toString() ?? '') ?? 0.0;
          double longitude =
              double.tryParse(eventData['long']?.toString() ?? '') ?? 0.0;
          print('Latitude: $latitude, Longitude: $longitude');
          dataStreamController.add(eventData);
          _getCurrentLocation(latitude, longitude);
          _getPolyline(latitude, longitude);
        }
      });
    } catch (e) {
      print('Error initializing Pusher: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAddressFromLatLng();
    mapController = MapController();
    dateTimeOutTimer = Timer.periodic(const Duration(seconds: 6), (timer) {
      // Check if you haven't received data within 6 seconds
      if (dataStreamController.isClosed) {
        // Close the page or perform any other action here
        Navigator.pop(context);
        timer.cancel(); // Stop the timer
      }
    });
    _initPusher();
  }

  @override
  void dispose() {
    dateTimeOutTimer?.cancel();
    // pusher.disconnect();
    dataStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Lacak Driver",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          StreamBuilder<dynamic>(
            stream: dataStreamController.stream,
            builder: (context, snapshot) {
              //jika tidak ada data yang terkirim dari pusher lebih dari 5 detik maka kosong
              if (!snapshot.hasData) {
                return Center(
                  child: Text('Loading'),
                );
              }
              if (snapshot.hasData) {
                try {
                  Map<String, dynamic> eventData =
                      Map<String, dynamic>.from(snapshot.data);
                  String latString = eventData['lat']?.toString() ?? '0.0';
                  String longString = eventData['long']?.toString() ?? '0.0';
                  double latitude = double.tryParse(latString) ?? 0.0;
                  double longitude = double.tryParse(longString) ?? 0.0;
                  String formattedLat = latitude.toStringAsFixed(2);
                  String formattedLong = longitude.toStringAsFixed(2);
                  return FlutterMap(
                    options: MapOptions(
                      center: LatLng(latitude, longitude),
                      zoom: 14.0,
                      // onTap: _handleTap,
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
                              point: LatLng(latitude, longitude),
                              builder: (ctx) => const Image(
                                    image:
                                        AssetImage('assets/images/driver.png'),
                                    width: 50,
                                    height: 50,
                                  )),
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(widget.latitude, widget.longitude),
                            builder: (ctx) => const Icon(
                              Icons.location_pin,
                              size: 50,
                              color: ColorValue.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: polylineCoordinates,
                            strokeWidth: 4.0,
                            color: ColorValue.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  );
                } catch (e) {
                  print('Error accessing lat and long: $e');
                  return Text('Error accessing lat and long');
                }
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 0, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget.namaDriver,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      widget.platKendaraan,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      widget.nameKendaraan,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Sedang Mengantar",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: ColorValue.primaryColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        ChatFunc().startConversation(widget.idDriver.toString(), widget.namaDriver, widget.photorDriver, widget.idDriver.toString(),context,);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          "assets/icon/chat.svg",
                                          color: ColorValue.primaryColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 24,
                          child: Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "https://kangsayur.nitipaja.online/" +
                                      widget.photoKendaraan,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
