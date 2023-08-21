import 'package:hive_tuto/data/models/note_model.dart';

abstract class EditNoteRepo {
  Future<void> editNote(int index, NoteModel newNoteModel);
}
