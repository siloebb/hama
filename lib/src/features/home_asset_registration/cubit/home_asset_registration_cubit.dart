import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/domain/models/home_asset.dart';
import 'package:hama/src/core/domain/repositories/home_asset_repository.dart';
import 'package:hama/src/core/domain/usecases/home_asset/add_asset_to_home_usecase.dart';


part 'home_asset_registration_state.dart';

class HomeAssetRegistrationCubit extends Cubit<HomeAssetRegistrationState> {
  final HomeAssetRepository homeAssetRepository;

  HomeAssetRegistrationCubit(this.homeAssetRepository)
    : super(const HomeAssetRegistrationState());

  void selectAssetType(AssetType type) {
    emit(state.copyWith(selectedAssetType: type, assetName: type.label));
  }

  void setAssetName(String name) {
    emit(state.copyWith(assetName: name));
  }

  void createHomeAsset(String homeId) {
    emit(state.copyWith(step: FormAssetRegistrationStep.loading));
    AddAssetToHomeUseCase(
      homeAssetRepository,
      homeId: homeId,
      name: state.assetName,
      type: state.selectedAssetType!,
    ).call().then((result) {
      if (result.failure != null) {
        emit(
          state.copyWith(
            step: FormAssetRegistrationStep.failure,
            errorMessage: result.failure?.message,
          ),
        );
      } else {
        emit(state.copyWith(step: FormAssetRegistrationStep.success));
      }
    });
  }
}
