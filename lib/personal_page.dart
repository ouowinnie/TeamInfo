import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'themes/colors.dart';
import 'themes/textStyles.dart';

class PersonalPage extends StatelessWidget {
  final String name;

  const PersonalPage(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> images = {
      "이충환": "assets/choonghwan_personal_img.jpg",
      "이다을": "assets/daeul_personal_img.jpg",
      "김진아": "assets/jina_personal_img.jpeg",
      "이용준": "assets/IMG_7607.png",
      "김소현": "assets/sohyun_personal_img.jpg",
    };
    List<Map<String, dynamic>> personalList = [
      {
        "question": "- 나에 대한 설명 및 MBTI",
        "이충환":
            "제 MBTI는 ISFJ입니다. 항상 I,S 비율은 압도적으로 높고, F와 J는 가끔 바뀝니다.\n소프트웨어 학과를 다니다가 우연히 접한 Android 프로젝트가 저와 잘 맞는다고 생각해서 캠프에 오게 되었습니다.",
        "이다을":
            "ENTJ지만 E와 I의 비율이 거의 51대 49입니다. 상황에 따라 자주 바뀌는데 지금은 다시 I가 된 것 같아요.",
        "김진아": "저의 MBTI는 ENFP이지만 E와 I의 비율과 P와 J의 비율이 거의 비슷합니다.",
        "이용준":
            "저의 MBTI는 'INTJ'입니다 사람들이랑 어울리는 걸 좋아해서 E라고 생각한 적 있는데 낯 가림이 심한 걸 보니 I가 맞는 것 같아요",
        "김소현":
            "학부생 시절만 해도 ESFJ였는데 입사를 하고서 ISFJ로 바뀌었습니다. 검사를 해보면 90% 이상의 극S와 극J가 나오고 E와I, T와F는 4:6정도 비율이 나옵니다. ISFJ가 I중에 가장 E이고, F중에 가장 T라고 하던데 어느정도는 일치한다고 느끼는 것 같습니다.",
      },
      {
        "question": "- 객관적인 장점",
        "이충환": "융통성 없다는 이야기도 많이 듣지만 정해진 규칙을 잘 따르고 시간 약속을 잘 지키는 것이 장점인것 같습니다.",
        "이다을": "해야겠다고 마음먹은 일이라면 밤을 새서라도 끝을봐야 직성이 풀리는 성격인데 장점이라고 해도 되겠죠?ㅎ..",
        "김진아": "모르는 것이 생기더라도 끝까지 노력하는 것입니다.",
        "이용준": "객관적으로 봤을 때 저의 장점은 감정적이지 않은 것입니다.",
        "김소현":
            "필기노트만 보면 전교1등이라는 얘기를 숱하게 들을만큼 정리를 잘하는게 제 장점인 것 같습니다. 이 장점을 문서정리에 잘 녹여낼 수 있는 것 같습니다.",
      },
      {
        "question": "- 협업 스타일",
        "이충환":
            "적극적으로 의견을 내거나 리드하는 스타일은 아니지만 다른 사람 의견을 경청하고 맡은 바 최선을 다하려고 노력하는 편 인것 같습니다.",
        "이다을":
            "의견을 내는것도 좋아하지만 다른사람의 의견을 듣고 수용해 서로의 장점을 뽑아내서 정리하는 편입니다. 모두의 의견을 존중해야 한다고 생각해요.",
        "김진아": "다른 사람의 의견을 수용하고, 반영하려고 노력하는 것입니다.",
        "이용준":
            "저는 수용을 잘하는 스타일인 것 같습니다 아는 것이 적은데 내 의견을 얘기하다가 부끄러워지는 상황이 두려워서 조심하는 것 같네요",
        "김소현":
            "제 의견도 많이 내고 팀원들의 의견도 최대한 많이 들으며 그 안에서의 최선을 찾기위해 노력하는 편인 것 같습니다.",
      },
      {
        "question": "- 개인 블로그 주소",
        "이충환": "https://choongplog.tistory.com/",
        "이다을": "https://velog.io/@ouowinnie",
        "김진아": "https://velog.io/@jxxn_a",
        "이용준": "-",
        "김소현": "https://sinw212.tistory.com/",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.kAppBar,
        title: Text(
          "개인 프로필 ($name)",
          style: TextStyles.kBoldTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  images[name]!,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: personalList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    color: ColorStyles.kLightGrey,
                    margin: EdgeInsets.fromLTRB(8, 4, 8, 8),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            personalList[index]['question'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (personalList[index][name].contains("https")) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebViewPage(
                                    url: personalList[index][name],
                                  ),
                                ),
                              );
                            }
                          },
                          child: (personalList[index][name].contains("https"))
                              ? Text(
                                  personalList[index][name],
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              : Text(
                                  personalList[index][name],
                                ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  WebViewPage({super.key, required this.url});

  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.kAppBar,
        title: Text(url),
      ),
      body: WebView(initialUrl: url),
    );
  }
}
