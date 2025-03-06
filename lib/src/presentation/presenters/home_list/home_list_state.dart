part of 'home_list_cubit.dart';

@immutable
sealed class HomeListState {}

final class HomeListLoading extends HomeListState {}

final class HomeListLoaded extends HomeListState {
  final List<Home> list;

  HomeListLoaded(this.list);
}

final class HomeListFailed extends HomeListState {
  final String message;

  HomeListFailed(this.message);
}

final class HomeListEmpty extends HomeListState {}
