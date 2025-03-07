import 'package:hama/src/core/domain/models/address.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/domain/usecases/use_cases_failure.dart';

import '../../repositories/home_repository.dart';
import '../use_case.dart';

typedef AddHomeResult = ({Home? home, Failure? failure});

class AddHomeUseCase extends UseCase<AddHomeResult> {
  final HomeRepository repository;
  final String name;
  final Address address;

  AddHomeUseCase(this.repository, this.name, this.address);

  Future<AddHomeResult> call() async {
    try {
      return (home: await repository.addHome(name, address), failure: null);
    } catch (e) {
      return (home: null, failure: const ServerFailure());
    }
  }
}
