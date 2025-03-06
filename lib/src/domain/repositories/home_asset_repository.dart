import '../models/home_asset.dart';

abstract class HomeAssetRepository {
  Future<void> addAssetToHome(HomeAsset asset, String homeId);
  Future<void> removeAssetFromHome(String assetId, String homeId);
  Future<List<HomeAsset>> getAssetsByHome(String homeId, {int limit = 10, int offset = 0});
}
