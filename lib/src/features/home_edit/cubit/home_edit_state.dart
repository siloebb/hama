part of 'home_edit_cubit.dart';

@immutable
sealed class HomeEditState {}

final class HomeEditLoading extends HomeEditState {}

final class HomeEditSuccess extends HomeEditState {}

final class HomeEditFailed extends HomeEditState {
  final String message;

  HomeEditFailed(this.message);
}
