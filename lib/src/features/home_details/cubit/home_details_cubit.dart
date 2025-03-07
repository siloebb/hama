import 'package:bloc/bloc.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';
import 'package:hama/src/core/domain/usecases/home/get_home_usecase.dart';
import 'package:meta/meta.dart';

part 'home_details_state.dart';

class HomeDetailsCubit extends Cubit<HomeDetailsState> {
  final HomeRepository homeRepository;
  final String homeId;
  HomeDetailsCubit(this.homeRepository, {required this.homeId})
    : super(HomeDetailsLoading());

  load() {
    emit(HomeDetailsLoading());
    GetHomeUseCase(homeRepository, homeId).call().then((result) {
      if (result.failure != null) {
        emit(HomeDetailsFailed(result.failure?.message));
        return;
      } else {
        emit(HomeDetailsLoaded(result.home!));
        return;
      }
    });
  }
}
