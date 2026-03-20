import 'package:note_app/Models/note_model.dart';

class NotesStates {}

class NotesInitial extends NotesStates {}

class NotesLoading extends NotesStates {}

class NotesSuccess extends NotesStates {
  List<NoteModel> notes;
  NotesSuccess(this.notes);
}

class NotesError extends NotesStates {
  final String errorMessage;
  NotesError(this.errorMessage);
}
