import 'package:flutter/material.dart';

class PredictScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사물 예측'),
        centerTitle: true,
        backgroundColor: Colors.green.shade300,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/gallery',);
              },
              icon: Image.asset(
                'images/photo.png',
                width: 120,
                height: 120,
              ),
              label: Text(
                '사진',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 50),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/camera',);
              },
              icon: Image.asset(
                'images/camera.png',
                width: 100,
                height: 100,
              ),
              label: Text(
                '카메라',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],

        ),
      ),
    );
  }
}