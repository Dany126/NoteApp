import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/Models/note_item_model.dart';
import 'package:note_app/Views/edit_page.dart';
import 'package:note_app/Views/home_page.dart';
import 'package:note_app/constant.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteItemModelAdapter());
  await Hive.openBox(kNotesBox);

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
