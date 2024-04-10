import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/core/components/default_filled_button.dart';
import 'package:my_notes/core/components/default_flushbar.dart';
import 'package:my_notes/core/components/default_text_form_field.dart';
import 'package:my_notes/core/extensions/context_ex.dart';
import 'package:my_notes/core/utils/colors.dart';
import 'package:my_notes/core/utils/constance.dart';
import 'package:my_notes/module/presentation/cubit/notes_cubit.dart';

import '../../../core/dependancy_injection/dependancy_injection.dart';
import '../../data/models/notes_model.dart';
import '../cubit/notes_states.dart';
import 'pick_color_list_view_widget.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({Key? key,}) : super(key: key);

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getIt<NotesCubit>().selectedColor = getIt<NotesCubit>().colors[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is AddNoteFailState) {
          showDefaultFlushBar(
            context: context,
            color: AppColors.redColor.withOpacity(0.6),
            messageText: state.message,
          );
        }

        if (state is AddNoteSuccessState) {
          context.pop();
        }
      },
      builder: (context, state) {
        if (state is AddNoteLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppConstance.isDark(context) ? AppColors.whiteColor : AppColors.blackColor,
            ),
          );
        }
        return Form(
          key: formKey,
          child: ListView(
            children: [
              DefaultTextFormField(
                controller: titleController,
                type: TextInputType.text,
                hint: 'Note title ...',
                label: 'Title',
                maxLines: 2,
                validate: (v) {
                  if (v?.isEmpty ?? true) {
                    return 'Title required';
                  }
                  return null;
                },
                nextInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: context.screenHeight * 0.41,
                child: DefaultTextFormField(
                  controller: subTitleController,
                  type: TextInputType.text,
                  hint: 'Type your note here ...',
                  label: 'Note',
                  minLines: 6,
                  // maxLines: 6,
                  validate: (v) {
                    if (v?.isEmpty ?? true) {
                      return 'Note required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const PickColorListViewWidget(),
              const SizedBox(
                height: 16,
              ),
              DefaultFilledButton(
                title: 'Add',
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    NotesModel note = NotesModel(
                      title: titleController.text,
                      subTitle: subTitleController.text,
                      date: DateTime.now().toString(),
                      modifyDate: '',
                      darkColor: getIt<NotesCubit>().selectedColor.value,
                      lightColor: Colors.green.value
                    );
                    getIt<NotesCubit>().addNote(note);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
