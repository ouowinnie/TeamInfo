import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'guestbook_service.dart';

class ViewGuestBook extends StatelessWidget {
  ViewGuestBook({super.key, required this.index});
  final int index;
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
    Book book = bookService.bookList[index];
    contentController.text = book.content;
    substanceController.text = book.substance;
    nameController.text = book.name;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
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
                        fillColor: Color(0xFFEEEEEE)),
                    autofocus: false,
                    maxLines: 1,
                    expands: false,
                    enabled: false,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {}),
                SizedBox(height: 20),
                TextField(
                    controller: substanceController,
                    decoration: const InputDecoration(
                        hintText: "내용을 입력하세요",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xFFEEEEEE)),
                    autofocus: false,
                    maxLines: 10,
                    expands: false,
                    enabled: false,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {}),
                SizedBox(height: 20),
                TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        hintText: "이름",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xFFEEEEEE)),
                    autofocus: false,
                    maxLines: 1,
                    expands: false,
                    enabled: false,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {}),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
