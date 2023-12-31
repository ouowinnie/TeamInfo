import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'themes/colors.dart';
import 'themes/text_styles.dart';

class TeamIntroducePage extends StatelessWidget {
  const TeamIntroducePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.kMainBackground,
      appBar: AppBar(
        backgroundColor: ColorStyles.kAppBar,
        title: Text('팀 소개 페이지'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image(
              image: AssetImage('assets/logo_fourfect.png'),
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              "저희 FourFect 팀이 더 궁금하신가요?\n아래 링크를 클릭해보세요!",
              textAlign: TextAlign.center,
              style: TextStyles.kIntroduceTitleTextStyle,
            ),
          ),
          teamIntroduceItem(context, "- 노션 주소",
              "https://lemon-conifer-031.notion.site/1-4-67d4cd7fb9d94aa7a8b73fd9b93097b8?pvs=4"),
          teamIntroduceItem(
              context, "- 깃허브 주소", "https://github.com/Team4Page/TeamPage"),
        ],
      ),
    );
  }

  Container teamIntroduceItem(
      BuildContext context, String titleText, String url) {
    return Container(
      width: double.infinity,
      color: ColorStyles.kLightGrey,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text(
              titleText,
              style: TextStyles.kQuestionTextStyle,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    url: url,
                  ),
                ),
              );
            },
            child: Text(
              url,
              style: TextStyles.kWebViewTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
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
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
