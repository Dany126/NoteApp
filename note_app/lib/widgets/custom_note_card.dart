import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/Cubits/NotesCubits/notes_cubits.dart';
import 'package:note_app/Models/note_model.dart';

class CustomNoteCard extends StatelessWidget {
  const CustomNoteCard({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "EditPage", arguments: note);
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  note.content,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
              trailing: IconButton(
                onPressed: () async {
                  note.delete();

                  await (context).read<NotesCubits>().fetchNotes();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),

            /// Date
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),

              child: Text(
                note.date,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
