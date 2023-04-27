import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart' as loc;

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class SecondPage extends StatelessWidget {
  MapboxMap? mapboxMap;

  _onMapCreated(MapboxMap mapboxMap) {
    print("_onMapCreated");
    this.mapboxMap = mapboxMap;
    final location = this.mapboxMap?.location;
  }

  @override
  Widget build(BuildContext context) {
    final MapWidget mapWidget = MapWidget(
        key: ValueKey("mapWidget"),
        resourceOptions: ResourceOptions(
            accessToken:
                ""),
        styleUri: MapboxStyles.LIGHT,
        cameraOptions: CameraOptions(
            center: Point(coordinates: Position(139.75322, 35.68945)).toJson(),
            zoom: 14.0),
        onMapCreated: _onMapCreated);

    return Stack(
      children: <Widget>[
        Container(color: Colors.grey, child: mapWidget),
        Positioned(
          left: 10,
          top: 100,
          child: ElevatedButton(
            onPressed: () {
              // Add your code here for the top left button
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ),
        Positioned(
          left: 10,
          top: 150,
          child: ElevatedButton(
            onPressed: () async {
              // Add your code here for the second button
              geo.Position position = await geo.Geolocator.getCurrentPosition(
              );
              print(
                  'Latitude: ${position.latitude}, Longitude: ${position.longitude}');

              mapboxMap?.flyTo(
                  CameraOptions(
                      center:
                      position.toJson(),
                      anchor: ScreenCoordinate(x: 0, y: 0),
                      zoom: 17,
                      bearing: 180,
                      pitch: 30),
                  MapAnimationOptions(duration: 2000, startDelay: 0));
            },
            child: Text('Move to my location'),
          ),
        ),
      ],
    );
  }
}
