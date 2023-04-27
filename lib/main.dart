import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  final String title;
  
  MyHomePage({Key? key, required this.title}) : super(key: key);

  Location location = Location();
  Future<void> requestLocationPermission() async {
    PermissionStatus permission = await location.requestPermission();

    if (permission == PermissionStatus.granted) {
      // Location permission granted
      print("OK");
    } else {
      // Location permission not granted
      print("not OK");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add your code here for the first button
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text('Open Map'),
            ),
            SizedBox(height: 16), // Add some spacing between the buttons
            ElevatedButton(
              onPressed: () {
                // Add your code here for the second button
                requestLocationPermission();
              },
              child: Text('Ask for Permission'),
            ),
          ],
        ),
      ),
    );
  }
}

