import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  String modifyDate;
  @HiveField(4)
  int darkColor;
  @HiveField(5)
  int lightColor;

  NotesModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.modifyDate,
    required this.darkColor,
    required this.lightColor,
  });

}
