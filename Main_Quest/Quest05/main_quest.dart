import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'qr_scan.dart';
import 'predict.dart';
import 'gallery.dart';
import 'camera.dart';
//import 'predict.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/qr_scan': (context) => QrScanScreen(),
        //'/qr_result': (context) => QrResultScreen(),
        '/predict': (context) => PredictScreen(),
        '/gallery': (context) => GalleryScreen(),
        '/camera': (context) => CameraScreen(),
        //'/predict_result': (context) => PredictResultScreen(),
      },
    );
  }
}