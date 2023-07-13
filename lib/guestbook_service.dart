import 'dart:convert';

import 'package:flutter/material.dart';

<<<<<<< HEAD
<<<<<<< HEAD
class Guestbook {
  Guestbook({
    required this.content,
  });

  String content;

  Map toJson() {
    return {'content': content};
  }

  factory Guestbook.fromJson(json) {
    return Guestbook(content: json['content']);
  }
}

class GuestbookService extends ChangeNotifier {
  List<Guestbook> visitlist = [Guestbook(content: "테스트")];
  updateMemoTitle({required int index, required String content}) {}
  updateMemoContent({required int index, required String content}) {}
  creatMemoTitle({required String content}) {
    Guestbook guestbook = Guestbook(content: content);
    visitlist.add(guestbook);
=======
=======
import 'main.dart';

>>>>>>> 1871534931754f2a11210222591d51fda6ce9981
class Book {
  Book(
      {required this.content,
      required this.substance,
      required this.name,
      required this.key});
  String content;
  String substance;
  String name;
  String key;

  Map toJson() {
    return {
      'content': content,
      'substance': substance,
      'name': name,
      'key': key
    };
  }

  factory Book.fromJson(json) {
    return Book(
        content: json['content'],
        substance: json['substance'],
        name: json['name'],
        key: json['key']);
  }
}

class BookService extends ChangeNotifier {
  BookService() {
    loadBookList();
  }
  List<Book> bookList = [
    Book(content: '방명록', substance: 'ㅇㅇㅇ', name: '충환', key: '11111'),
  ];

  createBook(
      {required String content,
      required String substance,
      required String name,
      required String key}) {
    Book book =
        Book(content: content, substance: substance, name: name, key: key);
    bookList.add(book);
    notifyListeners();
<<<<<<< HEAD
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
=======
    saveBookList();
>>>>>>> 1871534931754f2a11210222591d51fda6ce9981
  }

  updateBook(
      {required int index,
      required String content,
      required String substance,
      required String name,
      required String key}) {
    Book book = bookList[index];
    book.content = content;
    book.substance = substance;
    book.name = name;
    book.key = key;
    notifyListeners();
    saveBookList();
  }

  deleteMemo({required int index}) {
    bookList.removeAt(index);
    notifyListeners();
    saveBookList();
  }

  checkPassword({required int index}) {
    return bookList[index].key;
  }

  saveBookList() {
    List bookJsonList = bookList.map((memo) => memo.toJson()).toList();
    String jsonString = jsonEncode(bookJsonList);
    prefs.setString('bookList', jsonString);
  }

  loadBookList() {
    String? jsonString = prefs.getString('bookList');
    if (jsonString == null) return;
    List bookJsonList = jsonDecode(jsonString);
    bookList = bookJsonList.map((json) => Book.fromJson(json)).toList();
  }
}
