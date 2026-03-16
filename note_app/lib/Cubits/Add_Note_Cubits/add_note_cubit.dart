import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/Cubits/Add_Note_Cubits/add_note_state.dart';
import 'package:note_app/Models/note_item_model.dart';
import 'package:note_app/constant.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote(NoteItemModel note) {
    try {
      var noteBox = Hive.box<NoteItemModel>(kNotesBox);
      emit(AddNoteLoading());
      noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
