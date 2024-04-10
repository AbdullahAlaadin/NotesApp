import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/core/dependancy_injection/dependancy_injection.dart';
import 'package:my_notes/module/presentation/cubit/notes_cubit.dart';
import 'package:my_notes/module/presentation/cubit/notes_states.dart';

import 'color_item.dart';

class PickColorListViewWidget extends StatelessWidget {
  const PickColorListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24 * 2,
      child: BlocBuilder<NotesCubit, NotesStates>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getIt<NotesCubit>().colors.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                getIt<NotesCubit>().pickColor(getIt<NotesCubit>().colors[index]);
              },
              child: ColorItem(
                isSelected: getIt<NotesCubit>().selectedColor == getIt<NotesCubit>().colors[index],
                color: getIt<NotesCubit>().colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
