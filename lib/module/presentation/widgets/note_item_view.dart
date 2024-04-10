import 'package:flutter/material.dart';
import 'package:my_notes/core/components/default_filled_button.dart';
import 'package:my_notes/core/components/warning_alert_pop_up.dart';
import 'package:my_notes/core/extensions/context_ex.dart';
import 'package:my_notes/core/helpers/dialog_helper.dart';
import 'package:my_notes/core/utils/constance.dart';

import '../../../core/dependancy_injection/dependancy_injection.dart';
import '../../data/models/notes_model.dart';
import '../cubit/notes_cubit.dart';
import '../screens/edit_note_screen.dart';

class NoteItemView extends StatelessWidget {
  final NotesModel note;

  const NoteItemView({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, animation1) => EditNoteScreen(
                note: note,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppConstance.isDark(context)
                ? Color(note.darkColor).withOpacity(0.7)
                : Color(note.lightColor).withOpacity(0.7),
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: AppConstance.isDark(context) ? Color(note.darkColor) : Color(note.lightColor),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  isThreeLine: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    note.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      note.subTitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    onPressed: () {
                      DialogHelper.showCustomDialog(
                        context: context,
                        alertDialog: WarningAlertPopUp(
                          description: 'Note will be permanently deleted, Are you sure ?',
                          btnContent: 'Delete',
                          onPress: () {
                            getIt<NotesCubit>().deleteNote(note);
                            context.pop();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  AppConstance.dateFormat.format(DateTime.parse(note.date)),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                if (note.modifyDate.isNotEmpty)
                  Text(
                    'modified on : ${AppConstance.dateFormat.format(DateTime.parse(note.modifyDate))}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
