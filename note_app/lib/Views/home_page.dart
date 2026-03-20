import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/NotesCubits/notes_cubits.dart';
import 'package:note_app/Cubits/NotesCubits/notes_states.dart';

import 'package:note_app/constant.dart';

import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_notes_view.dart';
import 'package:note_app/Helper/show_modal_bottom_sheet.dart';
import 'package:note_app/widgets/search_deleget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showNoteBottomSheet(context);
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomAppBar(
                icon: const Icon(Icons.search),
                onPressed: () {
                  final note = context.read<NotesCubits>();
                  if (note.state is NotesSuccess) {
                    final notesList = (note.state as NotesSuccess).notes;
                    showSearch(
                      context: context,
                      delegate: NotesSearchDelegate(notesList),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),

              /// Expanded should be HERE
              const Expanded(child: CustomNotesView()),
            ],
          ),
        ),
      ),
    );
  }
}
