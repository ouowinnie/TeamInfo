import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'guestbook_service.dart';
import 'themes/colors.dart';

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

  void unfocusTextFields() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    BookService bookService = context.read<BookService>();
    Book book = bookService.bookList[widget.index];

    contentController.text = book.content;
    substanceController.text = book.substance;
    nameController.text = book.name;

    return GestureDetector(
      onTap: unfocusTextFields,
      child: Scaffold(
        backgroundColor: ColorStyles.kMainBackground,
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
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.grey),
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
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                guestBookItem(contentController, "제목을 입력하세요", 1),
                SizedBox(height: 20),
                guestBookItem(substanceController, "내용을 입력하세요", 10),
                SizedBox(height: 20),
                guestBookItem(nameController, "이름", 1),
                SizedBox(height: 20),
                guestBookItem(keyController, "비밀번호", 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField guestBookItem(
      TextEditingController controller, String hintText, int maxLines) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            filled: true,
            fillColor: ColorStyles.kLightGrey),
        autofocus: false,
        maxLines: maxLines,
        expands: false,
        keyboardType: TextInputType.multiline,
        onChanged: (value) {});
  }
}
