import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/model/nearesttokomodel.dart';
import 'package:kangsayur/widget/panel_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../bloc/json_bloc/json_bloc.dart';
import '../../../../../bloc/json_bloc/json_state.dart';
import '../../../../../common/color_value.dart';
import '../../../../../constants/app_constants.dart';
import '../../profile/profile_head.dart';
import 'package:latlong2/latlong.dart';

class Toko_sekitar extends StatefulWidget {
  const Toko_sekitar({Key? key}) : super(key: key);

  @override
  State<Toko_sekitar> createState() => _Toko_sekitarState();
}

class _Toko_sekitarState extends State<Toko_sekitar> {
  String? _currentAddress;
  LatLng _currentPosition = AppConstants.myLocation;

  Marker? _currentMarker;
  var mapController = MapController();

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
        _currentPosition, 10.0); // Sesuaikan level zoom jika perlu
  }

  final JsonBloc _jsonBloc = JsonBloc();

  @override
  void initState() {
    _jsonBloc.add(GetNearestTokoList());
    _getCurrentLocation();
    _getAddressFromLatLng();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paneHeightClosed = MediaQuery.of(context).size.height * 0.5;
    final paneHeightOpen = MediaQuery.of(context).size.height * 1 - 80;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          toolbarHeight: 80,
          title: Text(
            "Toko Sekitar",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),

        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1,
              child: Column(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: FlutterMap(
                      options: MapOptions(
                          center: AppConstants.myLocation,
                          screenSize: MediaQuery.of(context).size,
                          interactiveFlags: InteractiveFlag.pinchZoom |
                              InteractiveFlag.drag |
                              InteractiveFlag.doubleTapZoom,),
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
                        CircleLayer(
                          circles: [
                            CircleMarker(
                              point: _currentPosition,
                              color: Colors.green.withOpacity(0.2),
                              radius: 25000,
                              useRadiusInMeter: true,
                            ),
                          ],
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
                        ),
                        BlocProvider(
                          create: (_) => _jsonBloc,
                          child: BlocListener<JsonBloc, JsonState>(
                              listener: (context, state) {
                            if (state is JsonError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                ),
                              );
                            }
                          }, child: BlocBuilder<JsonBloc, JsonState>(
                                  builder: (context, state) {
                            if (state is JsonInitial) {
                              return Loading();
                            } else if (state is JsonLoading) {
                              return Loading();
                            } else if (state is JsonLoaded) {
                              return marker(widget: state.jsonNearestToko);
                            } else if (state is JsonError) {
                              return Text(state.message);
                            }
                            return Container();
                          })),
                        )
                      ]),
                )
              ]),
            ),
            SlidingUpPanel(
              color: Colors.transparent,
              panelBuilder:
              (controller) => PanelWidget(controller: controller,),
              minHeight: paneHeightClosed,
              maxHeight: paneHeightOpen,
              parallaxEnabled: true,
              parallaxOffset: 0.5,
            )
          ],
        ));
  }
}

//make widget marker
Widget marker({required NearestTokoModel widget}) {
  var latLang =
      widget.data.map((e) => LatLng(e.latitude, e.longitude)).toList();

  return MarkerLayer(
    markers: [
      for (int i = 0; i < widget.data.length; i++)
        Marker(
          point: latLang[i],
          builder: (_) {
            return GestureDetector(
                onTap: () {},
                child: Container(height: 1,width: 1, decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorValue.tertiaryColor,
                ),));
          },
        )
    ],
  );
}
