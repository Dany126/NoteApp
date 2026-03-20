import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/NotesCubits/notes_cubits.dart';
import 'package:note_app/Cubits/NotesCubits/notes_states.dart';

import 'package:note_app/widgets/custom_note_card.dart';

class CustomNotesView extends StatelessWidget {
  const CustomNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubits, NotesStates>(
      builder: (context, state) {
        // Handle different states
        if (state is NotesLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.amber),
          );
        }

        if (state is NotesSuccess) {
          if (state.notes.isEmpty) {
            return const Center(
              child: Text(
                'No notes yet.\nTap the + button to add one!',
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomNoteCard(note: state.notes[index]),
              );
            },
          );
        }

        if (state is NotesError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 50),
                const SizedBox(height: 10),
                Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<NotesCubits>().fetchNotes();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        // Default case (NotesInitial)
        return const Center(
          child: Text('Loading...', style: TextStyle(color: Colors.grey)),
        );
      },
    );
  }
}
