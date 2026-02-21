import 'package:hive_practice/features/note/data/models/note_model.dart';

abstract class HiveRepo {
  Future<void> createNote(NoteModel note);
  Future<void> deleteNote(String id);
  Future<void> updateNote(NoteModel note);
  List<NoteModel> getAllNote();
}
