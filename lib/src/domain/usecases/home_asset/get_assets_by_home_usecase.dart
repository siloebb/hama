import '../../models/home_asset.dart';
import '../../repositories/home_asset_repository.dart';

class GetAssetsByHomeUseCase {
  final HomeAssetRepository repository;

  GetAssetsByHomeUseCase(this.repository);

  Future<List<HomeAsset>> call(String homeId, {
    int limit = 10,
    int offset = 0,
  }) async {
    return repository.getAssetsByHome(homeId, limit: limit, offset: offset);
  }
}
