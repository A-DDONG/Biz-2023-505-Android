import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';

Widget mainDrawer(BuildContext context) => Drawer(
      backgroundColor: const Color.fromARGB(150, 255, 90, 90),
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("callor"),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
              )
            ],
            accountName: Text("A-DDONG"),
            accountEmail: Text("ssc5924@gmail.com"),
          ),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            leading: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onTap: () {
              debugPrint("Home 메뉴가 클릭됨");

              /// 스마트 기기에서 현재 화면을 다른 화면으로 전환하기
              /// web, pc app 에서는 단순히 화면을 단순히 전환하는데 별 어려움없이 수행이 가능하다
              /// 스마트 기기에서는 화면 하나하나가 context 이다
              /// 화면을 전환시킬때도 context 를 잘 관리해야한다
              // const HomePage();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          const Divider(
            height: 0.8,
            color: Colors.white,
          ),
          ListTile(
            title: const Text(
              "MyPage",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onTap: () {
              debugPrint("MyPage 메뉴가 클릭됨");
              Navigator.of(context).pushNamed("/mypage");
            },
          ),
          const Divider(
            height: 0.8,
            color: Colors.white,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed("/email",
                  arguments: {"email": "addong@addong.com"});
            },
            title: const Text(
              "email",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            leading: const Icon(
              Icons.email,
              color: Colors.white,
            ),
          ),
          const Divider(
            height: 0.8,
            color: Colors.white,
          ),
        ],
      ),
    );
