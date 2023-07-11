import 'package:flutter/material.dart';

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
  }
}
