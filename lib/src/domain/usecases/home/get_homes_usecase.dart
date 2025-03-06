import 'package:hama/src/domain/usecases/use_cases.dart';

import '../../models/home.dart';
import '../../repositories/home_repository.dart';

typedef GetHomesResult = ({List<Home>? homes, Failure? failure});

class GetHomesUseCase {
  final HomeRepository repository;

  GetHomesUseCase(this.repository);

  Future<GetHomesResult> call() async {
    try {
      return (homes: await repository.getHomes(), failure: null);
    } catch (e) {
      return (homes: null, failure: const ServerFailure());
    }
  }
}
