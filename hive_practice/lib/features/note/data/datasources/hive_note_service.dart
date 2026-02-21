import 'package:hive_flutter/adapters.dart';
import 'package:hive_practice/features/note/data/models/note_model.dart';
import 'package:hive_practice/features/note/domain/hive_repo.dart';

class HiveNoteService implements HiveRepo {
  //single ton
  final Box<NoteModel> box;
  HiveNoteService._internal({required this.box});

  static final HiveNoteService _instance =
      HiveNoteService._internal(box: Hive.box('noteBox'));

  factory HiveNoteService() {
    return _instance;
  }

  ///

  @override
  Future<void> createNote(NoteModel note) async {
    await box.put(note.id, note);
    getAllNote();
  }

  @override
  Future<void> deleteNote(String id) async {
    await box.delete(id);
    getAllNote();
  }

  @override
  List<NoteModel> getAllNote() {
    final notes = box.values.toList();
    return notes;
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    await box.put(note.id, note);
    getAllNote();
  }

}
