import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';
import 'package:hama/src/core/domain/usecases/home/delete_home_usecase.dart';
import 'package:hama/src/core/domain/usecases/home/get_homes_usecase.dart';


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

  delete(Home home) {
    emit(HomeListLoading());
    DeleteHomeUseCase(repository, home.id).call().then((DeleteHomeResult result) {
      if (result.failure != null) {
        emit(HomeListFailed(result.failure!.message));
        return;
      } else {
        load();
        return;
      }
    });
  }

}
