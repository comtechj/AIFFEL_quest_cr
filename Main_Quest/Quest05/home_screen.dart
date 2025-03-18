import 'package:flutter/material.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {         // qr
                Navigator.pushNamed(context, '/qr_scan',);
              },
              child: Column(
                children: [
                  Image.asset(
                    'images/qr.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                      'QR 인식',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),

            GestureDetector(
              onTap: () {             // 사물 예측
                Navigator.pushNamed(context, '/predict',);
              },
              child: Column(
                children: [
                  Image.asset(
                    'images/predict.png',
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '사물 예측',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}