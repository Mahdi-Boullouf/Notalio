part of 'edit_button_status_cubit.dart';

@immutable
sealed class EditButtonStatusState {}

final class EditButtonStatusDisabled extends EditButtonStatusState {}

final class EditButtonStatusEnabled extends EditButtonStatusState {}
