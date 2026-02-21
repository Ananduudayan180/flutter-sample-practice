import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_practice/features/note/data/datasources/hive_note_service.dart';
import 'package:hive_practice/features/note/data/models/note_model.dart';
import 'package:hive_practice/features/note/presentation/pages/home.dart';
import 'package:hive_practice/features/note/presentation/provider/note_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('noteBox');
  runApp(ChangeNotifierProvider(
    create: (context) => NoteProvider(hiveRepo: HiveNoteService()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
