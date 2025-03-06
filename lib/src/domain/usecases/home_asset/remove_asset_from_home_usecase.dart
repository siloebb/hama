import '../../repositories/home_asset_repository.dart';

class RemoveAssetFromHomeUseCase {
  final HomeAssetRepository repository;

  RemoveAssetFromHomeUseCase(this.repository);

  Future<void> call(String assetId, String homeId) async {
    return repository.removeAssetFromHome(assetId, homeId);
  }
}
