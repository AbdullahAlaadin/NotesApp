import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/core/extensions/context_ex.dart';
import 'package:my_notes/core/helpers/sheet_helper.dart';
import 'package:my_notes/core/utils/colors.dart';

import '../../../core/dependancy_injection/dependancy_injection.dart';
import '../../../core/utils/constance.dart';
import '../cubit/notes_cubit.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/notes_app_bar.dart';
import '../widgets/notes_screen_body.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotesCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const NotesAppBarBody(
            title: 'Notes',
            // icon: Icons.search,
          ),
        ),
        body: const NotesScreenBody(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            SheetHelper.showCustomSheet(
              context: context,
              bottomSheetHeight: context.screenHeight * 0.8,
              title: 'What\'s in your mind ?!',
              titleColor: AppConstance.isDark(context) ? AppColors.whiteColor : AppColors.blackColor,
              bottomSheetContent: BlocProvider.value(
                value: getIt<NotesCubit>(),
                child: const AddNoteBottomSheet(),
              ),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('New Note'),
        ),
      ),
    );
  }
}
