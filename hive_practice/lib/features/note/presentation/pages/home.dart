import 'package:flutter/material.dart';
import 'package:hive_practice/features/note/data/datasources/hive_note_service.dart';
import 'package:hive_practice/features/note/presentation/pages/add_note.dart';
import 'package:hive_practice/features/note/presentation/provider/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteProvider>().loadAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create note
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddNote(
                    isUpdate: false,
                  )),
        ),
      ),
      appBar: AppBar(),
      //provider cunsumer
      body: Consumer<NoteProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          if (provider.isLoading) {
            return CircularProgressIndicator();
          }
          if (provider.notes.isEmpty) {
            return Center(child: Text('add list'));
          }
          return ListView.builder(
            itemCount: provider.notes.length,
            itemBuilder: (context, index) {
              final note = provider.notes[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  //update button
                  leading: IconButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNote(
                                      isUpdate: true,
                                      noteModel: note,
                                    )),
                          ),
                      icon: Icon(Icons.edit)),
                  title: Text(note.title),
                  subtitle: Text(note.subTitle),
                  //delete
                  trailing: IconButton(
                      onPressed: () =>
                          context.read<NoteProvider>().deleteNote(note.id),
                      icon: Icon(Icons.delete)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
