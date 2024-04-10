import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/module/presentation/cubit/notes_cubit.dart';
import 'package:my_notes/module/presentation/cubit/notes_states.dart';

import '../../../core/components/no_notes.dart';
import '../../../core/dependancy_injection/dependancy_injection.dart';
import 'note_item_view.dart';

class NotesScreenBody extends StatefulWidget {
  const NotesScreenBody({Key? key}) : super(key: key);

  @override
  State<NotesScreenBody> createState() => _NotesScreenBodyState();
}

class _NotesScreenBodyState extends State<NotesScreenBody> {
  @override
  void initState() {
    getIt<NotesCubit>().getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        if (getIt<NotesCubit>().notes!.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: getIt<NotesCubit>().notes!.length + 1,
              itemBuilder: (context, index) => index < getIt<NotesCubit>().notes!.length
                  ? NoteItemView(
                      note: getIt<NotesCubit>().notes![index],
                    )
                  : const SizedBox(
                      height: 70,
                    ),
            ),
          );
        } else {
          return const NoNotes();
        }
      },
    );
  }
}
