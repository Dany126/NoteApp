import 'package:flutter/material.dart';

import 'package:note_app/Views/edit_page.dart';
import 'package:note_app/Views/home_page.dart';

void main() async {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "HomePage": (context) => HomePage(),
        "EditPage": (context) => EditPage(),
      },
      initialRoute: "HomePage",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
    );
  }
}
