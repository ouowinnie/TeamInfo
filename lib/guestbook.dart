import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:team_page/guestbook_service.dart';
import 'package:team_page/visitor_memo_list.dart';
=======
import 'package:provider/provider.dart';
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1

import 'guestbook_service.dart';
import 'themes/colors.dart';
import 'themes/textStyles.dart';

<<<<<<< HEAD
<<<<<<< HEAD
class createMemoPage extends StatelessWidget {
  createMemoPage({super.key, required this.index, required this.visitList});

  final List<String> visitList;
  final int index;
=======
class CreateMemoPage extends StatelessWidget {
  CreateMemoPage({super.key, required this.index});
=======
class CreateMemoPage extends StatefulWidget {
  CreateMemoPage({super.key, required this.index, required this.isModify});
>>>>>>> 1871534931754f2a11210222591d51fda6ce9981

  final int index;
  final bool isModify;

<<<<<<< HEAD
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
=======
  @override
  State<CreateMemoPage> createState() => _CreateMemoPageState();
}

class _CreateMemoPageState extends State<CreateMemoPage> {
>>>>>>> 1871534931754f2a11210222591d51fda6ce9981
  TextEditingController contentController = TextEditingController();

  TextEditingController substanceController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController keyController = TextEditingController();

  String contentValue = "";

  String substanceValue = "";

  String nameValue = "";

  String keyValue = "";

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
    Book book = bookService.bookList[widget.index];

    contentController.text = book.content;
    substanceController.text = book.substance;
    nameController.text = book.name;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.kAppBar,
        actions: [
          TextButton(
              onPressed: () {
                String contentS = contentController.text;
                String substanceS = substanceController.text;
                String nameS = nameController.text;
                String keyS = keyController.text;

                if (contentS.isNotEmpty &&
                    substanceS.isNotEmpty &&
                    nameS.isNotEmpty &&
                    keyS.isNotEmpty) {
                  bookService.updateBook(
                      index: widget.index,
                      content: contentS,
                      substance: substanceS,
                      name: nameS,
                      key: keyS);
                  Navigator.pop(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("모든 내용을 입력해야 저장, 수정이 가능합니다."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("확인"),
                          ),
                        ],
                      );
                    },
                  );
<<<<<<< HEAD
                },
              );
            },
            icon: Icon(Icons.delete),
          )
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
=======
                }
              },
              child: Text(
                widget.isModify ? "수정" : "저장",
                style: TextStyles.kWhiteTextStyle,
              ))
>>>>>>> 1871534931754f2a11210222591d51fda6ce9981
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                      hintText: "제목을 입력하세요",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: ColorStyles.kLightGrey),
                  autofocus: false,
                  maxLines: 1,
                  expands: false,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {}),
              SizedBox(height: 20),
              TextField(
                  controller: substanceController,
                  decoration: const InputDecoration(
                      hintText: "내용을 입력하세요",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: ColorStyles.kLightGrey),
                  autofocus: false,
                  maxLines: 10,
                  expands: false,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {}),
              SizedBox(height: 20),
              TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: "이름",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: ColorStyles.kLightGrey),
                  autofocus: false,
                  maxLines: 1,
                  expands: false,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {}),
              SizedBox(height: 20),
              TextField(
                  controller: keyController,
                  decoration: const InputDecoration(
                      hintText: "비밀번호",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: ColorStyles.kLightGrey),
                  autofocus: false,
                  maxLines: 1,
                  expands: false,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {}),
            ],
          ),
        ),
      ),
    );
  }
}
