// import 'dart:js_util';
import 'dart:math';

import 'package:flutter/material.dart';
// import "package:state/main_app_bar.dart";
import 'package:state/models/student.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      title: "Flutter State",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

/// state 클래스를 관리하는 부모 클래스
/// state 를 생성(create) 한다
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  /// => StartPage()
  /// StartPage class 의 생성자를 호출하여 StartPage 의 객체를 생성하여 return 하라는 의미
  @override
  State<StatefulWidget> createState() => StartPage();
}

/// State Widget 에서는 StatefulWidget 과 관계를 명확하게 하기 위하여
/// Generic(<HomePage>)을 연결해 준다
class StartPage extends State<HomePage> {
  /// State 클래스 위젯에서 titles 배열 변수를 생성(선언과 초기화)
  /// 이 순간 titles 는 state 가 된다
  /// state 는 화면 렌더링 또는 동적인 활동을 감시할 수 있는 동적변수
  var titles = [
    "hello home",
    "집에가세요",
    "집에갑니까?",
    "집에 갑시다",
    "집으로 갑시다",
    "go to the home",
  ];

  final studentList = [
    Student(stNum: "001", stName: "홍길동"),
    Student(stNum: "002", stName: "이몽룡"),
    Student(stNum: "003", stName: "성춘향"),
    Student(stNum: "004", stName: "임꺽정"),
    Student(stNum: "005", stName: "장보고"),
    Student(stNum: "006", stName: "김바보"),
  ];

  /// 동적으로 변화되는 배열(리스트) 요소들을 화면에 출력하기 위하여
  /// ListView.builder() 함수를 사용하여 각 요소를 디자인한다
  ListView appBarBody() => ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Material(
              child: InkWell(
                onTap: () {
                  var snackBar = SnackBar(
                    content: Text(studentList[index].stName),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                highlightColor:
                    const Color.fromARGB(255, 255, 90, 90).withOpacity(0.5),
                splashColor:
                    const Color.fromARGB(255, 15, 15, 47).withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(studentList[index].stNum),
                      Text(studentList[index].stName),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("안녕하세요"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              var rnd = Random().nextDouble();

              /// flutter 의 State 클래스에서 기본으로 제공하는 함수
              /// state 로 선언된 변수의 값을 변경할때 사용하는 함수
              /// 이 함수내의 본문에서 state 변수의 값(상태)을 변경하면 화면에 자동으로 렌더링된다
              setState(() {
                titles.add(rnd.toString());
              });
            },
            icon: const Icon(Icons.add_alarm_outlined),
          )
        ],
      ),

      // mainAppBar(context),
      body: appBarBody(),
    );
  }
}
