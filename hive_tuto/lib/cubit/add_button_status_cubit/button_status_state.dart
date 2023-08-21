part of 'button_status_cubit.dart';

@immutable
sealed class ButtonStatusState {}

final class ButtonStatusEnabled extends ButtonStatusState {}

final class ButtonStatusDisabled extends ButtonStatusState {}
