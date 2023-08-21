import 'package:hive_flutter/adapters.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime? addedDate;

  NoteModel(this.title, {required this.content, required this.addedDate});

  NoteModel updateNoteModelInfo(String? newTitle, String newContent) {
    return NoteModel(newTitle, content: newContent, addedDate: addedDate);
  }
}
