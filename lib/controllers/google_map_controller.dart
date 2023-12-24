import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final streetTFController = TextEditingController();
  final buildingNumberTFController = TextEditingController();
  final cityTFController = TextEditingController();
  final apartmentTFController = TextEditingController();
  late LatLng currentPosition;
  @override
  void onInit() {
    super.onInit();
    getLocation();
    currentPosition = center;
  }

  GoogleMapController? mapController;

  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(31.936783, 35.874772),
    )
  };
  LatLng center = const LatLng(31.936783, 35.874772);

  setupLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      Geolocator.openAppSettings();
    }
    update();
    return permission;
  }

  Future<void> getLocation() async {
    LocationPermission locationPermission = await setupLocationPermission();

    if (locationPermission != LocationPermission.always &&
        locationPermission != LocationPermission.whileInUse) {
      return;
    }

    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double zoom = await mapController!.getZoomLevel();

      changeLocation(zoom, LatLng(position.latitude, position.longitude));
      update();
    } catch (error) {
      return;
    }
  }

  void onMapTap(LatLng latLong) {
    mapController!
        .getZoomLevel()
        .then((zoom) => {changeLocation(zoom, latLong)});
  }

  Future<void> changeLocation(double zoom, LatLng latLng) async {
    double newZoom = zoom > 15 ? zoom : 15;
    currentPosition = latLng;

    mapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: newZoom)));
    markers.clear();

    markers.add(Marker(
      markerId: const MarkerId('1'),
      position: latLng,
    ));
    print('markers$markers');
    update();
  }
}
