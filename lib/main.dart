import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GyroResponsiveImage(),
    );
  }
}
class GyroResponsiveImage extends StatefulWidget {
  @override
  _GyroResponsiveImageState createState() => _GyroResponsiveImageState();
}
class _GyroResponsiveImageState extends State<GyroResponsiveImage> {
  double _x = 0.0;
  double _y = 0.0;
  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _x += event.y;
        _y += event.x;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.translate(
          offset: Offset(_x * 10, _y * 10),
          child: Image.asset('assets/gyro_two.jpg'), // Add your image to assets
        ),
      ),
    );
  }
}