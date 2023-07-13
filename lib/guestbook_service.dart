import 'dart:convert';
import 'package:flutter/material.dart';
import 'main.dart';

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
    saveBookList();
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
