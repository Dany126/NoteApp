import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/Cubits/NotesCubits/notes_cubits.dart';
import 'package:note_app/Models/note_model.dart';

import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final formKey = GlobalKey<FormState>();

  late NoteModel note;
  late String editTitle;
  late String editContent;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    editTitle = note.title; // ← initialize with current values
    editContent = note.content; // ← initialize with current values
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                CustomAppBar(
                  icon: const FaIcon(FontAwesomeIcons.check),
                  onPressed: () {
                    note.title = editTitle;
                    note.content = editContent;
                    note.save();
                    context.read<NotesCubits>().fetchNotes();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hint: note.title,
                  maxLines: 1,

                  onChanged: (value) => editTitle = value ?? editTitle,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hint: note.content,
                  maxLines: 10,

                  onChanged: (p0) => editContent = p0 ?? editContent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
