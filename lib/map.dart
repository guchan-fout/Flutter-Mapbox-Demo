import 'package:flutter/material.dart';

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class SecondPage extends StatelessWidget {
  MapboxMap? mapboxMap;

  _onMapCreated(MapboxMap mapboxMap) {
    print("_onMapCreated");
    this.mapboxMap = mapboxMap;
  }

  @override
  Widget build(BuildContext context) {
        final MapWidget mapWidget = MapWidget(
        key: ValueKey("mapWidget"),
        resourceOptions: ResourceOptions(accessToken: "YOUR TOKEN"),
        styleUri: MapboxStyles.LIGHT,
        cameraOptions: CameraOptions(
          center: Point(coordinates: Position(139.75322,35.68945)).toJson(),
          zoom: 14.0),
        onMapCreated: _onMapCreated);

    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
         body: Container(
        child: mapWidget,
      ),
    );
  }
}