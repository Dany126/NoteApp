import 'package:hive/hive.dart';
import 'package:note_app/Cubits/addNotesCubits/add_note_states.dart';
import 'package:bloc/bloc.dart';
import 'package:note_app/Models/note_model.dart';

class AddNotesCubit extends Cubit<AddNoteStates> {
  AddNotesCubit() : super(AddNoteInitial());
  void addNotes(NoteModel note) {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>("notes");
      notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
