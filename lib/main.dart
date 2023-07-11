import 'package:flutter/material.dart';
import 'package:team_page/Jina_personal.dart';
import 'package:team_page/choonghwan_personal.dart';
import 'package:team_page/daeul_personal.dart';
import 'package:team_page/sohyun_personal.dart';
import 'package:team_page/visitor_memo_list.dart';
import 'package:team_page/yongjun_personal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VisitorMemoList(),
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
    );
  }
}
