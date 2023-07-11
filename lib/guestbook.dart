import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:team_page/guestbook_service.dart';
import 'package:team_page/visitor_memo_list.dart';
=======
import 'package:provider/provider.dart';
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1

import 'guestbook_service.dart';

<<<<<<< HEAD
class createMemoPage extends StatelessWidget {
  createMemoPage({super.key, required this.index, required this.visitList});

  final List<String> visitList;
  final int index;
=======
class CreateMemoPage extends StatelessWidget {
  CreateMemoPage({super.key, required this.index});

  final int index;

>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // List<Guestbook> visitList = GuestbookService.visitList;
    // GuestbookService guestbookService = context.read<GuestbookService>();
    // Guestbook guestbook = GuestbookService.visitlist[index];
    contentController.text = visitList[index];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VisitorMemoList(),
                    ),
                  )
                },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: TextField(
              controller: contentController,
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              onChanged: (value) {
                visitList[index] = value;
              },
              decoration: InputDecoration(
                hintText: "제목",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "내용",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                size: 16,
              ),
              label: Text("저장하기"))
=======
    BookService bookService = context.read<BookService>();
    Book book = bookService.bookList[index];

    contentController.text = book.content;

    return Scaffold(
      appBar: AppBar(
        actions: [
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
                          bookService.deleteMemo(index: index);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "확인",
                          style: TextStyle(color: Colors.pink),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete),
          )
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
            controller: contentController,
            decoration: const InputDecoration(
                hintText: "방명록을 입력하세요",
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xffD9D9D9)),
            autofocus: true,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            onChanged: (value) {
              bookService.updateBook(index: index, content: value);
            }),
      ),
    );
  }
}
