import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String subTitle;

  @HiveField(3)
  final DateTime dateTime;

  NoteModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.dateTime,
  });

  factory NoteModel.create(
      {required String? title, required String? subTitle, String? id}) {
    var uuid = Uuid();
    return NoteModel(
      id: id ?? uuid.v4(),
      title: title ?? '',
      subTitle: subTitle ?? '',
      dateTime: DateTime.now(),
    );
  }
}
