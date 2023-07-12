import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_page/guestbook_service.dart';
import 'package:team_page/guestbook_view.dart';

import 'guestbook.dart';

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
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ViewGuestBook(
                                index: index,
                              ),
                            ),
                          );
                        },
                        trailing: Wrap(children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("정말로 삭제하시겠습니까?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("취소"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            bookService.deleteMemo(
                                                index: index);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "확인",
                                            style:
                                                TextStyle(color: Colors.pink),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete)),
                          IconButton(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CreateMemoPage(
                                      index: index,
                                      isModify: true,
                                    ),
                                  ),
                                );
                                if (memo.content.isEmpty) {
                                  bookService.deleteMemo(index: index);
                                }
                              },
                              icon: Icon(Icons.edit))
                        ]),
                      ),
                      Container(height: 1, color: Colors.black)
                    ],
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            bookService.createBook(
                content: '', substance: '', name: '', key: '');
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreateMemoPage(
                  index: bookService.bookList.length - 1,
                  isModify: false,
                ),
              ),
            );
            if (bookList[bookService.bookList.length - 1].content.isEmpty) {
              bookService.deleteMemo(index: bookList.length - 1);
            }
          },
        ),
      );
    });
  }
}
