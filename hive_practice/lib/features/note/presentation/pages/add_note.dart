import 'package:flutter/material.dart';
import 'package:hive_practice/features/note/data/models/note_model.dart';
import 'package:hive_practice/features/note/presentation/components/my_button.dart';
import 'package:hive_practice/features/note/presentation/components/my_text_field.dart';
import 'package:hive_practice/features/note/presentation/provider/note_provider.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  final bool isUpdate;
  final NoteModel? noteModel;
  const AddNote({super.key, required this.isUpdate, this.noteModel});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      isUpdate();
    }
  }

  void isUpdate() {
    titleController.text = widget.noteModel!.title;
    subTitleController.text = widget.noteModel!.subTitle;
  }

//create note
  void createNote() {
    final note = NoteModel.create(
        title: titleController.text, subTitle: subTitleController.text);
    context.read<NoteProvider>().createNote(note);
  }

//update note
  void updateNote() {
    final note = NoteModel.create(
        title: titleController.text,
        subTitle: subTitleController.text,
        id: widget.noteModel!.id);
    context.read<NoteProvider>().updateNote(note);
  }

//UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Column(
          children: [
            MyTextField(controller: titleController, hintText: 'title'),
            MyTextField(
              controller: subTitleController,
              hintText: 'description',
            ),
            MyButton(
                buttonName: 'add note',
                onTap: () {
                  widget.isUpdate ? updateNote() : createNote();
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
