// import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// dart 프로젝트 시작점
void main(List<String> args) {
  runApp(const MyApp());
}

/// flutter 로 생성한 app 의 시작점
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        title: "반갑습니다",
        theme: CupertinoThemeData(
          brightness: Brightness.light,
        ),
        home: StartPage());
  }
}

/// State를 사용하여 화면에 지속적인 변화를 주기 위한 시작점
/// StatefulWidget 의 State 위젯을 생성, 컨트롤하는 위젯
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  /// _StartPage 클래스의 생성자를 호출하여 객체를 생성하는 코드
  @override
  State<StartPage> createState() => _StartPage();
}

/// StartPage(StatefulWidget)가 생성하고 컨트롤할 State
/// 클래스 이름에 UnderScore(_)를 붙이면 이 클래스는 private 성질을 갖는다
/// 현재 버전의 dart 에서는 UnderScore() 를 사용하지 말라고 권하는데,
/// flutter 의 State 클래스에는 통상 UnderScore()를 붙여서 StatefulWidget의 이름과 같이 만든다
class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("나의 첫 App"),
      ),
      backgroundColor: Color.fromARGB(255, 255, 246, 235),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   child: const Icon(Icons.email),
      // ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "반가워",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
            Text(
              "반가워",
              style: TextStyle(color: Colors.orange, fontSize: 35),
            ),
            Text(
              "반가워",
              style: TextStyle(color: Colors.yellow, fontSize: 40),
            ),
            Text(
              "반가워",
              style: TextStyle(color: Colors.green, fontSize: 45),
            ),
            Text(
              "반가워",
              style: TextStyle(color: Colors.blue, fontSize: 40),
            ),
            Text(
              "반가워",
              style: TextStyle(color: Colors.indigo, fontSize: 35),
            ),
            Text(
              "반가워",
              style: TextStyle(color: Colors.purple, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
