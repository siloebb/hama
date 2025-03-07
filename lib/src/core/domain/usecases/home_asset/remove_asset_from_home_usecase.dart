import 'package:hama/src/core/domain/usecases/use_case.dart';
import 'package:hama/src/core/domain/usecases/use_cases_failure.dart';

import '../../repositories/home_asset_repository.dart';

typedef RemoveAssetFromHomeResult = ({bool? success, Failure? failure});

class RemoveAssetFromHomeUseCase extends UseCase<RemoveAssetFromHomeResult> {
  final HomeAssetRepository repository;
  final String assetId;
  final String homeId;

  RemoveAssetFromHomeUseCase(
    this.repository, {
    required this.assetId,
    required this.homeId,
  });

  @override
  Future<RemoveAssetFromHomeResult> call() async {
    try {
      await repository.removeAssetFromHome(assetId, homeId);
      return (success: true, failure: null);
    } on Failure catch (e) {
      return (success: false, failure: e);
    }
  }
}
