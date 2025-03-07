part of 'home_details_cubit.dart';

@immutable
sealed class HomeDetailsState {}

final class HomeDetailsLoading extends HomeDetailsState {}

final class HomeDetailsLoaded extends HomeDetailsState {
  final Home home;

  HomeDetailsLoaded(this.home);
}

final class HomeDetailsFailed extends HomeDetailsState {
  final String? message;

  HomeDetailsFailed(this.message);
}
