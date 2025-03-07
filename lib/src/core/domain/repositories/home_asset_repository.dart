import '../models/home_asset.dart';

abstract class HomeAssetRepository {
  Future<HomeAsset> addAssetToHome(HomeAsset asset);
  Future<HomeAsset> removeAssetFromHome(String assetId, String homeId);
  Future<List<HomeAsset>> getAssetsByHome(String homeId, {int limit = 10, int offset = 0});
}
