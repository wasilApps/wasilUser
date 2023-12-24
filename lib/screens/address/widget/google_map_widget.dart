import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:wasil_user/controllers/google_map_controller.dart';
import 'package:wasil_user/utils/size_config.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  MapController mapController = Get.put(MapController());
  //  LatLng currentPosition;
  Geolocation? geo;
  // late GoogleMapController googlemapController;
  bool loaded = false;

  _changeLoaded() {
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    // currentPosition = mapController.center;
    WidgetsBinding.instance.addPostFrameCallback((_) => _changeLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: GetBuilder<MapController>(
          builder: (googlecontroller) => Column(
            children: [
              SizedBox(
                  height: getPercentScreenHeight(50),
                  width: getPercentScreenWidth(100),
                  child:
                      // loaded
                      // ?
                      GoogleMap(
                    onMapCreated: (controller) {
                      mapController.mapController = controller;
                    },
                    mapType: MapType.normal,
                    markers: googlecontroller.markers,
                    onTap: googlecontroller.onMapTap,
                    initialCameraPosition: CameraPosition(
                      target: googlecontroller.center,
                      zoom: 11.0,
                    ),
                  )
                  // : Container(
                  //     color: Colors.grey,
                  //   ),
                  ),
              SizedBox(
                height: getPercentScreenHeight(1),
              ),
              SizedBox(
                width: getPercentScreenWidth(95),
                child: SearchMapPlaceWidget(
                  bgColor: Colors.white,
                  iconColor: Colors.black,
                  placeholder: 'Search Location'.tr,
                  placeType: PlaceType.address,
                  hasClearButton: false,
                  textColor: Colors.black,
                  apiKey: 'AIzaSyC7OA_kF9duRuHHew__jN_HdYh8yq0BCtE',
                  onSelected: (Place place) async {
                    //   _onAddMarkerButtonPressed();
                    geo = await place.geolocation;

                    mapController.mapController!.animateCamera(
                        CameraUpdate.newLatLng(geo?.coordinates));
                    mapController.mapController!.animateCamera(
                        CameraUpdate.newLatLngBounds(geo?.bounds, 0));
                    mapController.center = geo!.coordinates;
                    mapController.onMapTap(mapController.center);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
