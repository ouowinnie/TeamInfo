import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_page/guestbook_service.dart';
import 'package:team_page/guestbook_view.dart';
import 'guestbook.dart';
import 'themes/colors.dart';
import 'themes/textStyles.dart';

class VisitorMemoList extends StatefulWidget {
  const VisitorMemoList({super.key});
  @override
  State<VisitorMemoList> createState() => _VisitorMemoListState();
}

class _VisitorMemoListState extends State<VisitorMemoList> {
  TextEditingController keyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(builder: (context, bookService, child) {
      List<Book> bookList = bookService.bookList;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorStyles.kAppBar,
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
                                      title: Text("삭제를 원하실 경우 비밀번호를 입력해주세요."),
                                      actions: [
                                        TextField(controller: keyController),
                                        Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("취소"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                if (keyController.text ==
                                                    bookService.checkPassword(
                                                        index: index)) {
                                                  bookService.deleteMemo(
                                                      index: index);
                                                  Navigator.pop(context);
                                                } else {
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Text(
                                                "확인",
                                                style: TextStyles
                                                    .kAlertDialogPositiveTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete)),
                          IconButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("수정을 원하실 경우 비밀번호를 입력해주세요."),
                                        actions: [
                                          TextField(controller: keyController),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("취소"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  if (keyController.text ==
                                                      bookService.checkPassword(
                                                          index: index)) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            CreateMemoPage(
                                                          index: index,
                                                          isModify: true,
                                                        ),
                                                      ),
                                                    );
                                                    if (memo.content.isEmpty) {
                                                      bookService.deleteMemo(
                                                          index: index);
                                                    }
                                                  } else {
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Text(
                                                  "확인",
                                                  style: TextStyles
                                                      .kAlertDialogPositiveTextStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.edit))
                        ]),
                      ),
                      Container(height: 1, color: ColorStyles.kBlack)
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
