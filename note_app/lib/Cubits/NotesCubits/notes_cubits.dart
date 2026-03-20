// Cubits/NotesCubits/notes_cubits.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/Cubits/NotesCubits/notes_states.dart';
import 'package:note_app/Models/note_model.dart';

class NotesCubits extends Cubit<NotesStates> {
  NotesCubits() : super(NotesInitial()) {
    fetchNotes(); // ← add this
  }

  Future<void> fetchNotes() async {
    emit(NotesLoading());
    try {
      var notesBox = await Hive.openBox<NoteModel>('notes');
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
