part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class AddNoteLoading extends NoteState {}

final class AddNoteCompleted extends NoteState {
  final NoteModel note;

  AddNoteCompleted(this.note);
}

class DeleteNoteLoading extends NoteState {}

class DeleteNoteCompleted extends NoteState {
  final int noteIndex;

  DeleteNoteCompleted(this.noteIndex);
}

class UpdateNoteLoading extends NoteState {}

class UpdateNoteCompleted extends NoteState {
  final int noteIndex;
  final NoteModel newNote;

  UpdateNoteCompleted({required this.noteIndex, required this.newNote});
}

class GetNotesLoading extends NoteState {}

class GetNotesCompleted extends NoteState {
  final List<NoteModel> notesList;

  GetNotesCompleted(this.notesList);
}
