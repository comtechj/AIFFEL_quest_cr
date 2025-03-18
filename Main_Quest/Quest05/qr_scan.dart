import 'package:flutter/material.dart';

class QrScanScreen extends StatefulWidget {
  @override
  QrScanScreen_State createState() => QrScanScreen_State();
}

class QrScanScreen_State extends State<QrScanScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR 인식 결과'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 400,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500),
            ),
            child: Text('QR 내용 1', style: TextStyle(fontSize: 20),),
          ),

          Container(
            height: 100,
            width: 400,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500),
            ),
            child: Text('QR 내용 2', style: TextStyle(fontSize: 20),),
          ),

          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            child: Text(
                'QR 인식',
                style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}