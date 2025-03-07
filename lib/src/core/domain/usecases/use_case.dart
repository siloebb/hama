
import 'use_cases_failure.dart';

typedef UseCaseResult = ({Object? data, Failure? failure});

abstract class UseCase<UseCaseResult> {
  Future<UseCaseResult> call();
}