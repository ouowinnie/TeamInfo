import 'package:flutter/material.dart';
import 'package:team_page/guestbook_service.dart';
import 'package:team_page/visitor_memo_list.dart';

// MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => GuestbookService()),
//       ],

class createMemoPage extends StatelessWidget {
  createMemoPage({super.key, required this.index, required this.visitList});

  final List<String> visitList;
  final int index;
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
