import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartPage(),
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
        title: const Text("안녕하세요"),
        backgroundColor: Colors.brown,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("선동철"),
              accountEmail: const Text("ssc5924@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "images/sally.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const Text("addong")
                  ],
                ),
              ),
            ),
            const ListTile(
              title: Text("전체 메일보기"),
              leading: Icon(Icons.email),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("받은 메일함"),
              leading: Icon(Icons.inbox),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("페이스북"),
              leading: Icon(Icons.facebook),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("트위터"),
              leading: Icon(Icons.flutter_dash),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          onPressed: () => {},
          icon: const Icon(Icons.add),
          label: const Text("추가"),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 15,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => {},
          icon: const Icon(Icons.clear),
          label: const Text("삭제"),
        )
      ],
      body: const Center(
        child: Text(
          "나의 스마트 어플",
          style: TextStyle(
              color: Colors.red,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
