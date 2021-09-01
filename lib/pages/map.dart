import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapup/widgets/app_bar.dart';
import 'package:switch_it/switch_it.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  GoogleMapController _googleMapController;
  bool isEnabled1 = false;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: RapupAppBar(
        backgroundColor: Colors.transparent,
        height: MediaQuery.of(context).size.height/10,
        leading: BackButton(color: Colors.black45),
        center: null,
        trailing: SwitchIt(
          isEnabled: isEnabled1,
          backgroundColor: Colors.transparent,
          inActiveColor: Colors.red,
          activeColor: Colors.green,
          color: Colors.black45,
          size: 60,
          onChanged: (value) {
            setState(() {
              isEnabled1 = !isEnabled1;
            });
          },
        ),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        //onLongPress: _addMarker,
      ),
    );
  }

}
