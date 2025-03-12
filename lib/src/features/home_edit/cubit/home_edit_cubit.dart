import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/domain/models/address.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';
import 'package:hama/src/core/domain/usecases/home/add_home_usecase.dart';
import 'package:hama/src/core/domain/usecases/home/update_home_usecase.dart';


part 'home_edit_state.dart';

class HomeEditCubit extends Cubit<HomeEditState> {
  final HomeRepository homeRepository;

  HomeEditCubit(this.homeRepository) : super(HomeEditLoading());

  save({String? id, required String name, required Address address}) async {
    emit(HomeEditLoading());
    if (id == null || id.isEmpty) {
      AddHomeUseCase(homeRepository, name, address).call().then((
        AddHomeResult result,
      ) {
        if (result.failure != null) {
          emit(HomeEditFailed(result.failure!.message));
          return;
        } else {
          emit(HomeEditSuccess());
          return;
        }
      });
    } else {
      final home = Home(id: id, name: name, address: address);
      UpdateHomeUseCase(homeRepository, home).call().then((
        UpdateHomeResult result,
      ) {
        if (result.failure != null) {
          emit(HomeEditFailed(result.failure!.message));
          return;
        } else {
          emit(HomeEditSuccess());
          return;
        }
      });
    }
  }

  delete() {
    emit(HomeEditLoading());
    
  }
}
