import 'package:bloc/bloc.dart';
import 'package:hive_tuto/data/models/note_model.dart';
import 'package:hive_tuto/data/repositories/notes_repo_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this.notesRepoImpl) : super(NoteInitial());
  final NotesRepoImpl notesRepoImpl;
  addNote(NoteModel note) {
    emit(AddNoteLoading());
    notesRepoImpl
        .createNote(note)
        .then((value) => emit(AddNoteCompleted(note)));
  }

  deleteNote(int id) {
    emit(DeleteNoteLoading());
    notesRepoImpl.deleteNote(id).then((value) => emit(DeleteNoteCompleted(id)));
  }

  getNotes() async {
    emit(GetNotesLoading());
    Future.delayed(const Duration(milliseconds: 600))
        .then((value) => emit(GetNotesCompleted(notesRepoImpl.getNotes())));
  }

  Future editNote(int index, NoteModel newNoteModel) async {
    emit(UpdateNoteLoading());
    await notesRepoImpl.editNote(index, newNoteModel).then((value) =>
        emit(UpdateNoteCompleted(noteIndex: index, newNote: newNoteModel)));
  }
}
