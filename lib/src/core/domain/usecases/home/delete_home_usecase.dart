import 'package:hama/src/core/domain/usecases/use_case.dart';
import 'package:hama/src/core/domain/usecases/use_cases_failure.dart';

import '../../repositories/home_repository.dart';

typedef DeleteHomeResult = ({bool? success, Failure? failure});

class DeleteHomeUseCase extends UseCase {
  final HomeRepository repository;
  final String homeId;

  DeleteHomeUseCase(this.repository, this.homeId);

  @override
  Future<DeleteHomeResult> call() async {
    try{
      await repository.deleteHome(homeId);
      return (success: true, failure: null);
    } catch (e) {
      return (success: null, failure: ServerFailure());
    }
  }
}
