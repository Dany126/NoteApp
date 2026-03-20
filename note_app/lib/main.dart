import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Views/edit_page.dart';
import 'package:note_app/Cubits/NotesCubits/notes_cubits.dart';
import 'package:note_app/Views/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>("notes");
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotesCubits>(create: (context) => NotesCubits()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
