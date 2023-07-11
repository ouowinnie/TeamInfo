import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_page/visitor_memo_list.dart';

import 'guestbook_service.dart';
import 'team_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TeamPage(),
    );
  }
}
