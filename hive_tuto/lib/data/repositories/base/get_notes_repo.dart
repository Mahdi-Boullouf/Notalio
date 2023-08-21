import 'package:hive_tuto/data/models/note_model.dart';

abstract class GetNotesRepo {
  List<NoteModel> getNotes();
}
