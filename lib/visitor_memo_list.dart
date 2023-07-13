import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_page/guestbook_service.dart';
import 'package:team_page/guestbook.dart';

class VisitorMemoList extends StatefulWidget {
  const VisitorMemoList({super.key});

  @override
  State<VisitorMemoList> createState() => _VisitorMemoListState();
}

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
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => createMemoPage(
                                index: index,
                                visitList: [],
                              ),
                            ),
                          );
                        },
                      ),
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
                builder: (_) => createMemoPage(
                  index: bookService.bookList.length - 1,
                  visitList: [],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
