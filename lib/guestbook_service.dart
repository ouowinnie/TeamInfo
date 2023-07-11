import 'package:flutter/material.dart';

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
class Book {
  Book({
    required this.content,
  });
  String content;
}

class BookService extends ChangeNotifier {
  List<Book> bookList = [
    Book(content: '첫 방명록'),
    Book(content: '두번째 방명록'),
  ];

  createBook({required String content}) {
    Book book = Book(content: content);
    bookList.add(book);
    notifyListeners();
>>>>>>> 953f1706c97b9f2058700677278027f6d53d01c1
  }
}
