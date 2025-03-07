import 'package:hama/src/core/domain/usecases/use_cases_failure.dart';

import '../../models/home.dart';
import '../../repositories/home_repository.dart';
import '../use_case.dart';

typedef GetHomesResult = ({List<Home>? homes, Failure? failure});

class GetHomesUseCase extends UseCase<GetHomesResult> {
  final HomeRepository repository;

  GetHomesUseCase(this.repository);

  @override
  Future<GetHomesResult> call() async {
    try {
      return (homes: await repository.getHomes(), failure: null);
    } catch (e) {
      return (homes: null, failure: const ServerFailure());
    }
  }
}
