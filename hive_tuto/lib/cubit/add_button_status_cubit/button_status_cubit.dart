import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_status_state.dart';

class ButtonStatusCubit extends Cubit<ButtonStatusState> {
  ButtonStatusCubit() : super(ButtonStatusDisabled());

  checkButtonStatus(String text) {
    if (text.isEmpty) {
      emit(ButtonStatusDisabled());
    } else {
      emit(ButtonStatusEnabled());
    }
  }
}
