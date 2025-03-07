import 'package:bloc/bloc.dart';
import 'package:hama/src/core/domain/models/home_asset.dart';
import 'package:hama/src/core/domain/repositories/home_asset_repository.dart';
import 'package:hama/src/core/domain/usecases/home_asset/get_assets_by_home_usecase.dart';
import 'package:hama/src/core/domain/usecases/home_asset/remove_asset_from_home_usecase.dart';
import 'package:meta/meta.dart';

part 'home_asset_list_state.dart';

class HomeAssetListCubit extends Cubit<HomeAssetListState> {
  final HomeAssetRepository repository;
  final String homeId;
  HomeAssetListCubit(this.repository, this.homeId)
    : super(HomeAssetListLoading());

  load() {
    emit(HomeAssetListLoading());
    GetAssetsByHomeUseCase(repository, homeId: homeId).call().then(
      (result) {
        if (result.failure != null) {
          emit(HomeAssetListFailed());
          return;
        } else {
          emit(HomeAssetListLoaded(result.homeAssets!));
        }
      },
      onError: (e) {
        emit(HomeAssetListFailed());
      },
    );
  }

  delete(HomeAsset homeAsset) {
    emit(HomeAssetListLoading());
    RemoveAssetFromHomeUseCase(
      repository,
      homeId: homeId,
      assetId: homeAsset.id,
    ).call().then((result) {
      if (result.failure != null) {
        emit(HomeAssetListFailed());
        return;
      } else {
        load();
      }
    });
  }
}
