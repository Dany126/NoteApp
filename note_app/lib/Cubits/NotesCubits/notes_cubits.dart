import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/Cubits/NotesCubits/notes_states.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/constant.dart';

class NotesCubits extends Cubit<NotesStates> {
  NotesCubits() : super(NotesLoading());

  void fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.toList();

      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
