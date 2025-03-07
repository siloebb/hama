
import 'package:hama/src/core/domain/models/home_asset.dart';
import 'package:hama/src/core/domain/repositories/home_asset_repository.dart';

class HomeAssetRepositoryImpl extends HomeAssetRepository {
  @override
  Future<HomeAsset> addAssetToHome(HomeAsset asset) async {
    await Future.delayed(Duration(seconds: 1));
    tempAssets.add(asset);
    return asset;
  }

  @override
  Future<List<HomeAsset>> getAssetsByHome(String homeId, {int limit = 10, int offset = 0}) {
    return Future.value(tempAssets.where((e) => e.homeId == homeId).toList());
  }

  @override
  Future<HomeAsset> removeAssetFromHome(String assetId, String homeId) {
    final asset = tempAssets.firstWhere((e) => e.id == assetId);
    tempAssets.remove(asset);
    return Future.value(asset);
  }
}

final tempAssets = [
  HomeAsset(id: '1', name: 'Appliance', type: AssetType.appliance, homeId: '1'),
  HomeAsset(id: '2', name: 'Solar Panel', type: AssetType.solarPanel, homeId: '1'),
  HomeAsset(id: '3', name: 'HVAC', type: AssetType.hvac, homeId: '2'),
  HomeAsset(id: '4', name: 'Plubing', type: AssetType.plumbing, homeId: '2'),
  HomeAsset(id: '5', name: 'Electrical', type: AssetType.electrical, homeId: '1'),
];
