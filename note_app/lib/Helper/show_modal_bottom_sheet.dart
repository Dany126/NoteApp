// Helper/show_modal_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/NotesCubits/notes_cubits.dart';
import 'package:note_app/Cubits/addNotesCubits/add_notes_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';

void showNoteBottomSheet(BuildContext context) {
  // Get the existing NotesCubit from parent
  final notesCubit = context.read<NotesCubits>();

  showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AddNotesCubit>(create: (context) => AddNotesCubit()),
          // Provide the existing NotesCubit to the bottom sheet
          BlocProvider.value(value: notesCubit),
        ],
        child: const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: AddNoteForm(),
        ),
      );
    },
  ).whenComplete(() => notesCubit.fetchNotes());
}
