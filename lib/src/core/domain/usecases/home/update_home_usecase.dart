import 'package:hama/src/core/domain/usecases/use_case.dart';

import '../../models/home.dart';
import '../../repositories/home_repository.dart';
import '../use_cases_failure.dart';

typedef UpdateHomeResult = ({Home? home, Failure? failure});


class UpdateHomeUseCase extends UseCase<UpdateHomeResult>{
  final HomeRepository repository;
  final Home home;

  UpdateHomeUseCase(this.repository, this.home);

  @override
  Future<UpdateHomeResult> call() async {
    try{
      return (home: await repository.updateHome(home), failure: null);
    } catch(e){
      return (home: null, failure: const ServerFailure());
    }

  }
}
