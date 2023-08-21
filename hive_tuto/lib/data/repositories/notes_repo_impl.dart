import 'package:hive/hive.dart';
import 'package:hive_tuto/core/res/constants.dart';
import 'package:hive_tuto/data/models/note_model.dart';
import 'package:hive_tuto/data/repositories/base/create_note_repo.dart';
import 'package:hive_tuto/data/repositories/base/delete_note_repo.dart';
import 'package:hive_tuto/data/repositories/base/edit_note_repo.dart';
import 'package:hive_tuto/data/repositories/base/get_notes_repo.dart';

class NotesRepoImpl
    implements CreateNoteRepo, DeleteNoteRepo, GetNotesRepo, EditNoteRepo {
  final box = Hive.box(kNotesBox);

  @override
  Future<void> createNote(NoteModel note) async {
    // TODO: implement createNote
    await box.add(note);
  }

  @override
  Future<void> deleteNote(int id) async {
    // TODO: implement deleteNote
    await box.deleteAt(id);
  }

  @override
  List<NoteModel> getNotes() {
    // TODO: implement getNotes
    return box.values.toList().cast<NoteModel>();
  }

  @override
  Future<void> editNote(int index, NoteModel newNoteModel) async {
    // TODO: implement editNote

    await box.putAt(index, newNoteModel);
  }
}
