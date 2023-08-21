import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_button_status_state.dart';

class EditButtonStatusCubit extends Cubit<EditButtonStatusState> {
  EditButtonStatusCubit() : super(EditButtonStatusDisabled());

  checkButtonStatus(
      String noteTitleControllerCurrentText,
      String noteContentControllerCurrentText,
      String noteTitlePreviousText,
      String noteContentPreviousText) {
    bool isThereAndModification =
        noteContentControllerCurrentText != noteContentPreviousText ||
            noteTitleControllerCurrentText != noteTitlePreviousText;
    bool isContentNotEmpty = noteContentControllerCurrentText.isNotEmpty;
    if (isThereAndModification && isContentNotEmpty) {
      emit(EditButtonStatusEnabled());
    } else {
      emit(EditButtonStatusDisabled());
    }
  }
}
