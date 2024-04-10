abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

class AddNoteLoadingState extends NotesStates {}
class AddNoteSuccessState extends NotesStates {}
class AddNoteFailState extends NotesStates {
  final String message;

  AddNoteFailState({required this.message});
}

class GetNotesSuccessState extends NotesStates {}
class GetNotesFailState extends NotesStates {
  final String message;

  GetNotesFailState({required this.message});
}

class UpdateState extends NotesStates {}
class PickColorState extends NotesStates {}