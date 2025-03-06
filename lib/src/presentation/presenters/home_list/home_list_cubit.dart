import 'package:bloc/bloc.dart';
import 'package:hama/src/domain/models/home.dart';
import 'package:hama/src/domain/repositories/home_repository.dart';
import 'package:hama/src/domain/usecases/home/get_homes_usecase.dart';
import 'package:meta/meta.dart';

part 'home_list_state.dart';

class HomeListCubit extends Cubit<HomeListState> {
  final HomeRepository repository;

  HomeListCubit(this.repository) : super(HomeListLoading());

  load() async {
    emit(HomeListLoading());
    GetHomesUseCase(repository).call().then((GetHomesResult result) {
      if (result.failure != null) {
        emit(HomeListFailed(result.failure!.message));
        return;
      } else {
        if (result.homes!.isEmpty) {
          emit(HomeListEmpty());
          return;
        } else {
          emit(HomeListLoaded(result.homes!));
          return;
        }
      }
    });
  }
}
