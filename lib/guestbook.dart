import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'guestbook_service.dart';
import 'themes/colors.dart';
import 'themes/textStyles.dart';

class CreateMemoPage extends StatefulWidget {
  CreateMemoPage({super.key, required this.index, required this.isModify});
  final int index;
  final bool isModify;
  @override
  State<CreateMemoPage> createState() => _CreateMemoPageState();
}

class _CreateMemoPageState extends State<CreateMemoPage> {
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
                }
              },
              child: Text(
                widget.isModify ? "수정" : "저장",
                style: TextStyles.kWhiteTextStyle,
              ))
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
