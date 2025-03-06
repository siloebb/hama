import '../../models/home_asset.dart';
import '../../repositories/home_asset_repository.dart';

class AddAssetToHomeUseCase {
  final HomeAssetRepository repository;

  AddAssetToHomeUseCase(this.repository);

  Future<void> call(HomeAsset asset, String homeId) async {
    return repository.addAssetToHome(asset, homeId);
  }
}
