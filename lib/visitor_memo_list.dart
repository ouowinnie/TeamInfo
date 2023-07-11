import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:team_page/guestbook.dart';
import 'package:team_page/guestbook_service.dart';
=======
import 'package:provider/provider.dart';
import 'package:team_page/guestbook_service.dart';

import 'guestbook.dart';
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1

class VisitorMemoList extends StatefulWidget {
  const VisitorMemoList({super.key});

  @override
  State<VisitorMemoList> createState() => _VisitorMemoListState();
}

<<<<<<< HEAD
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
=======
class _VisitorMemoListState extends State<VisitorMemoList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(builder: (context, bookService, child) {
      List<Book> bookList = bookService.bookList;

      return Scaffold(
        appBar: AppBar(
          title: Text("방명록 작성하기"),
        ),
        body: bookList.isEmpty
            ? Center(child: Text("방명록을 작성해 주세요"))
            : ListView.builder(
                itemCount: bookList.length,
                itemBuilder: (context, index) {
                  Book memo = bookList[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          memo.content,
                          maxLines: 1,
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
<<<<<<< HEAD
                              builder: (_) => createMemoPage(
                                index: index,
                                visitList: visitList,
=======
                              builder: (_) => CreateMemoPage(
                                index: index,
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
                              ),
                            ),
                          );
                        },
                      ),
<<<<<<< HEAD
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
=======
                      Container(height: 1, color: Colors.black)
                    ],
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            bookService.createBook(content: '');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreateMemoPage(
                  index: bookService.bookList.length - 1,
                ),
              ),
            );
          },
        ),
      );
    });
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
  }
}
