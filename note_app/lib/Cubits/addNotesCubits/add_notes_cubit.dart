// Cubits/addNotesCubits/add_notes_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/Cubits/addNotesCubits/add_note_states.dart';
import 'package:note_app/Models/note_model.dart';

class AddNotesCubit extends Cubit<AddNoteStates> {
  AddNotesCubit() : super(AddNoteInitial());

  Future<void> addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>('notes');
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
