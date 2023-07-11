import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:team_page/Jina_personal.dart';
import 'package:team_page/choonghwan_personal.dart';
import 'package:team_page/daeul_personal.dart';
import 'package:team_page/sohyun_personal.dart';
import 'package:team_page/visitor_memo_list.dart';
import 'package:team_page/yongjun_personal.dart';
=======
import 'package:provider/provider.dart';
import 'package:team_page/visitor_memo_list.dart';

import 'guestbook_service.dart';
import 'team_page.dart';
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: VisitorMemoList(),
<<<<<<< HEAD
    );
  }
}

class TeamPage extends StatelessWidget {
  const TeamPage({super.key}); // 생성자

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("팀 프로젝트"),
      ),
      body: Column(
        children: [
          Text("팀 페이지 초안"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChoongHwanPersonal(),
                  ),
                );
              },
              child: Text("이충환")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DaeulPersonal(),
                  ),
                );
              },
              child: Text("이다을")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JinAPersonal(),
                  ),
                );
              },
              child: Text("김진아")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => YongjunPersonal(),
                  ),
                );
              },
              child: Text("이용준")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SohyunPersonal(),
                  ),
                );
              },
              child: Text("김소현")),
        ],
      ),
=======
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
=======
      home: TeamPage(),
>>>>>>> e3fd2281145c89d5d114e7020fc8b51338d810de
    );
  }
}
