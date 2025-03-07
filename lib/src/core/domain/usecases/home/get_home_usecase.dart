import 'package:hama/src/core/domain/usecases/use_cases_failure.dart';

import '../../models/home.dart';
import '../../repositories/home_repository.dart';
import '../use_case.dart';

typedef GetHomeResult = ({Home? home, Failure? failure});

class GetHomeUseCase extends UseCase<GetHomeResult> {
  final HomeRepository repository;
  final String homeId;

  GetHomeUseCase(this.repository, this.homeId);

  @override
  Future<GetHomeResult> call() async {
    try {
       final home = await repository.getHome(homeId);
       if(home == null) {
         return (home: null, failure: const NotFoundFailure());
       }else{
        return (home: home, failure: null);
      }
    } catch (e) {
      return (home: null, failure: const ServerFailure());
    }
  }
}
