import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/core/extensions/context_ex.dart';
import 'package:my_notes/module/presentation/cubit/notes_states.dart';
import 'package:my_notes/module/presentation/widgets/notes_app_bar.dart';

import '../../../core/components/default_text_form_field.dart';
import '../../../core/dependancy_injection/dependancy_injection.dart';
import '../../data/models/notes_model.dart';
import '../cubit/notes_cubit.dart';
import '../widgets/pick_color_list_view_widget.dart';

class EditNoteScreen extends StatefulWidget {
  final NotesModel note;

  const EditNoteScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController.text = widget.note.title;
    subTitleController.text = widget.note.subTitle;
    getIt<NotesCubit>().selectedColor = Color(widget.note.darkColor);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    subTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<NotesCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<NotesCubit, NotesStates>(
            builder: (context, state) {
              return NotesAppBarBody(
                title: 'Edit Note',
                icon: Icons.check,
                canPressed: titleController.text != widget.note.title ||
                    subTitleController.text != widget.note.subTitle ||
                    getIt<NotesCubit>().selectedColor != Color(widget.note.darkColor),
                onTap: () {
                  if (titleController.text != widget.note.title ||
                      subTitleController.text != widget.note.subTitle ||
                      getIt<NotesCubit>().selectedColor != Color(widget.note.darkColor)) {
                    getIt<NotesCubit>().saveNote(
                      note: widget.note,
                      title: titleController.text,
                      subTitle: subTitleController.text,
                      darkColor: getIt<NotesCubit>().selectedColor.value,
                    );
                    context.pop();
                  }
                },
              );
            },
          ),
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
          ),
          // automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
          child: Column(
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
                onChange: (v) {
                  getIt<NotesCubit>().updateState();
                },
                nextInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
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
                  onChange: (v) {
                    getIt<NotesCubit>().updateState();
                  },
                ),
              ),
              const PickColorListViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
