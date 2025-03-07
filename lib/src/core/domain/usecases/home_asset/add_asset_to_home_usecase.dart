import 'package:hama/src/core/domain/usecases/use_case.dart';
import 'package:hama/src/core/domain/usecases/use_cases_failure.dart';

import '../../models/home_asset.dart';
import '../../repositories/home_asset_repository.dart';

typedef AddAssetToHomeResult = ({HomeAsset? asset, Failure? failure});

class AddAssetToHomeUseCase extends UseCase<AddAssetToHomeResult> {
  final HomeAssetRepository repository;
  final String homeId;
  final String name;
  final AssetType type;

  AddAssetToHomeUseCase(
    this.repository, {
    required this.homeId,
    required this.name,
    required this.type,
  });

  @override
  Future<AddAssetToHomeResult> call() async {
    try {
      final assetTemp = HomeAsset(
        id: 'id',
        name: name,
        type: type,
        homeId: homeId,
      );
      final asset = await repository.addAssetToHome(assetTemp);
      return (asset: asset, failure: null);
    } on Failure catch (e) {
      return (asset: null, failure: e);
    }
  }
}
