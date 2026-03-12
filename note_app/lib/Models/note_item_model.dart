import 'package:hive/hive.dart';

part 'note_item_model.g.dart';

@HiveType(typeId: 0)
class NoteItemModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteItemModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });
}
