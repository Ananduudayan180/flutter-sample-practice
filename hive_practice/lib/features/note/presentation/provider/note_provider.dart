import 'package:flutter/material.dart';
import 'package:hive_practice/features/note/data/models/note_model.dart';
import 'package:hive_practice/features/note/domain/hive_repo.dart';

class NoteProvider extends ChangeNotifier {
  final HiveRepo hiveRepo;

  NoteProvider({required this.hiveRepo});

  List<NoteModel> notes = [];
  bool isLoading = false;

  Future<void> createNote(NoteModel note) async {
    await hiveRepo.createNote(note);
    notes = hiveRepo.getAllNote();
    notifyListeners();
  }

  Future<void> updateNote(NoteModel note) async {
    await hiveRepo.updateNote(note);
    notes = hiveRepo.getAllNote();
    notifyListeners();
  }

  Future<void> deleteNote(String id) async {
    await hiveRepo.deleteNote(id);
    notes = hiveRepo.getAllNote();
    notifyListeners();
  }

  Future<void> getAllNotes() async {
    isLoading = true;
    notifyListeners();
    notes = hiveRepo.getAllNote();
    isLoading = false;
    notifyListeners();
  }

  void loadAllNotes() {
    notes = hiveRepo.getAllNote();
  }
}
