import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {     // 정적인 화면 설계
  @override
  Widget build(BuildContext context) {
    return MaterialApp(                         // 휴대폰 화면 그대로 만든다.
        home: Scaffold(                         // 꾸미기 위한 디자인이 저장되어 있다.
          appBar: AppBar(                       // 가장 상당의 바를 꾸민다.
            title: Text('플러터 앱 만들기'),
            centerTitle: true,                  // 바의 가운데 정렬
            backgroundColor: Colors.blue,
            leading: Icon(Icons.menu)           // 바의 왼쪽에 아이콘을 삽입.
            //leading: IconButton(
            //  onPressed: () {},               // 아이콘을 삽입 전 버튼을 사용해 봄.
            //  icon: Icon(Icons.menu)
            //)
          ),
          body: Center(                         // 휴대폰 화면 전체를 가운데 정렬 한다.
            child: Column(                      // 세로로 배치한다.
              mainAxisAlignment: MainAxisAlignment.center,      // 세로 배치를 가운데 정렬.
              children: [
                OutlinedButton(                 // TEXT 라는 버튼을 만든다.
                  child: Text('TEXT'),
                  onPressed: () {                      // 클릭하면,
                    print('버튼이 눌렸습니다.');        // 메시지가 콘솔 창에 출력.
                  }
                ),
                SizedBox(height: 50),                 // 버튼과 컨테이너 간격 유지.
                Container(
                  margin: EdgeInsets.only(left: 50, right: 50),   // 화면 구성에서 왼쪽, 오른쪽 간격 유지
                  child: Stack(
                    children: [                       // 겹친 사각형 만들기
                      Container(width: 300, height: 300, color: Colors.red,),
                      Container(width: 240, height: 240, color: Colors.orange,),
                      Container(width: 180, height: 180, color: Colors.yellow),
                      Container(width: 120, height: 120, color: Colors.green),
                      Container(width: 60, height: 60, color: Colors.blue)
                    ]
                  )
                )
              ]
            )
          )
        )
    );
  }
}
