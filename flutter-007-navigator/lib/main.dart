import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/email_page.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/my_page.dart';
import 'page/main_drawer.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => const HomePage(),
        "/mypage": (context) => const MyPage(),
        "/email": (context) => const EmailPage(),
      },
      home: const StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter navi"),
        backgroundColor: const Color.fromRGBO(255, 90, 90, 1.0),
      ),
      drawer: mainDrawer(context),
    );
  }
}
