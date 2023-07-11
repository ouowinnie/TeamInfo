import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:team_page/Jina_personal.dart';
import 'package:team_page/choonghwan_personal.dart';
import 'package:team_page/daeul_personal.dart';
import 'package:team_page/sohyun_personal.dart';
import 'package:team_page/yongjun_personal.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key}); // 생성자

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
      appBar: AppBar(
        title: Text("팀 Fourfect"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Image(
                        image: AssetImage('assets/IMG_7607.png'),
                        width: 200,
                      )),
                  Text(
                    "안녕하세요 Fourfect 입니다 :)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  Text(
                    "숫자 4와 perfect의 뜻을 합친 이름으로 우리들의 창의적인 사고와 실행력으로 완벽한 결과물을 낼 수 있도록 최선을다하겠습니다!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffeeeeee),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChoongHwanPersonal(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffeeeeee).withOpacity(0.1),
                  minimumSize: Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("이충환 "),
                      Icon(Icons.arrow_circle_right_rounded)
                    ],
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DaeulPersonal(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffeeeeee).withOpacity(0.1),
                  minimumSize: Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("이다을 "),
                      Icon(Icons.arrow_circle_right_rounded)
                    ],
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JinAPersonal(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffeeeeee).withOpacity(0.1),
                  minimumSize: Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("김진아 "),
                      Icon(Icons.arrow_circle_right_rounded)
                    ],
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => YongjunPersonal(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffeeeeee).withOpacity(0.1),
                  minimumSize: Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("이용준 "),
                      Icon(Icons.arrow_circle_right_rounded)
                    ],
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SohyunPersonal(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffeeeeee).withOpacity(0.1),
                  minimumSize: Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("김소현 "),
                      Icon(Icons.arrow_circle_right_rounded)
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
