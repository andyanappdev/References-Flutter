import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // 가운데 정렬 설정
        title: const Text(
          'Appbar Drawer Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey,
        elevation: 0.0,
        // appbar 그림자 제거
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {
        //     // 실행 코드 작성
        //   },
        // ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // 실행 코드 작성
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // 실행 코드 작성
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/Ava1.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: <Widget>[
                ClipOval(
                  child: Image.asset('assets/images/Ava2.png'),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Ava2.png'),
                  backgroundColor: Colors.white,
                ),
              ],
              accountName: const Text(
                'Andy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text('andyanappdev@gmail.com'),
              onDetailsPressed: () {
                // 실행 코드 작성
                debugPrint('arrow is tapped');
              },
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: const Text('Home'),
              onTap: () {
                // 실행 코드 작성
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: const Text('Settings'),
              onTap: () {
                // 실행 코드 작성
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: const Text('Q&A'),
              onTap: () {
                // 실행 코드 작성
              },
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
