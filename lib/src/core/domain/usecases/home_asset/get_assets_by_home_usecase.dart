import 'package:hama/src/core/domain/usecases/use_case.dart';
import 'package:hama/src/core/domain/usecases/use_cases_failure.dart';

import '../../models/home_asset.dart';
import '../../repositories/home_asset_repository.dart';

typedef GetHomeAssetsByHomeResult = ({
  List<HomeAsset>? homeAssets,
  Failure? failure,
});

class GetAssetsByHomeUseCase extends UseCase<GetHomeAssetsByHomeResult> {
  final String homeId;
  final HomeAssetRepository repository;
  final int limit;
  final int offset;

  GetAssetsByHomeUseCase(
    this.repository, {
    required this.homeId,
    this.limit = 0,
    this.offset = 0,
  });

  @override
  Future<GetHomeAssetsByHomeResult> call() async {
    try{
      final list = await repository.getAssetsByHome(homeId, limit: limit, offset: offset);
      return (homeAssets: list, failure: null);
    } catch(e){
      return (homeAssets: null, failure: ServerFailure());
    }
  }
}
