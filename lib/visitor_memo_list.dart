import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_page/guestbook.dart';
import 'package:team_page/guestbook_service.dart';

class VisitorMemoList extends StatefulWidget {
  const VisitorMemoList({super.key});

  @override
  State<VisitorMemoList> createState() => _HomePageState();
}

class _HomePageState extends State<VisitorMemoList> {
  List<String> visitList = ["테스트11", "테스트"]; // 전체 메모 목록

  @override
  Widget build(BuildContext context) {
    //   return Consumer<GuestbookService>(
    //     builder: (context, guestbookService, child) {
    // List<Guestbook> visitList = GuestbookService.visitList
    return Scaffold(
      appBar: AppBar(
        title: Text("방명록"),
        backgroundColor: Colors.grey,
      ),
      body: visitList.isEmpty
          ? Center(child: Text("방명록을 작성해 주세요"))
          : ListView.builder(
              itemCount: visitList.length,
              itemBuilder: (context, index) {
                String guestbook = visitList[index]; //String -> Guestbook
                return Container(
                  width: 400,
                  height: 70,
                  color: Colors.blue,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          guestbook,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => createMemoPage(
                                index: index,
                                visitList: visitList,
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // guestbook.creatMemoTitle(content: '');
          String guestbook = '';
          setState(() {
            visitList.add(guestbook);
          });

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => createMemoPage(
                      index: visitList.indexOf(guestbook),
                      visitList: visitList,
                    )),
          );
        },
        label: Text("방명록 쓰기"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
