import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes/core/utils/constance.dart';

import '../../data/models/notes_model.dart';
import 'notes_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());

  static NotesCubit of(BuildContext context) => BlocProvider.of(context);

  List<NotesModel>? notes;

  void getAllNotes() {
    // try {
    var notesBox = Hive.box<NotesModel>(AppConstance.notesBox);
    List<NotesModel> storedNotes = notesBox.values.toList();
    storedNotes.sort((a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
    notes = storedNotes;

    emit(GetNotesSuccessState());
    // } catch (e) {
    //   emit(GetNotesFailState(message: 'Something went wrong, check again later'));
    // }
  }

  Future addNote(NotesModel note) async {
    note.darkColor = selectedColor.value;
    emit(AddNoteLoadingState());
    try {
      var notesBox = Hive.box<NotesModel>(AppConstance.notesBox);
      notesBox.add(note);
      // delay for loading
      Future.delayed(const Duration(milliseconds: 300))
          .whenComplete(
            () => emit(
              AddNoteSuccessState(),
            ),
          )
          .whenComplete(
            // fetch data again to rebuild
            () => getAllNotes(),
          );
    } catch (e) {
      emit(AddNoteFailState(message: 'Something went wrong, check again later'));
    }
  }

  void deleteNote(NotesModel note) {
    note.delete().whenComplete(
          () => getAllNotes(),
        );
  }

  void saveNote({
    required NotesModel note,
    required String title,
    required String subTitle,
    required int darkColor,
  }) {
    note.title = title;
    note.subTitle = subTitle;
    note.darkColor = darkColor;
    note.modifyDate = DateTime.now().toString();
    note.save().whenComplete(
          () => getAllNotes(),
        );
  }


  void updateState() {
    emit(UpdateState());
  }

  Color selectedColor = const Color(0xffB0A1BA);
  List<Color> colors = const [
    Color(0xffB0A1BA),
    Color(0xffA5B5BF),
    Color(0xff7DDF64),
    Color(0xffC0DF85),
    Color(0xffDEB986),
    Color(0xffDB6C79),
    Color(0xffED4D6E),
  ];

  void pickColor(Color color) {
    selectedColor = color;
    emit(PickColorState());
  }
}
