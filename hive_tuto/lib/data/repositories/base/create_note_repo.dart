import '../../models/note_model.dart';

abstract class CreateNoteRepo {
  Future<void> createNote(NoteModel note);
}
