import 'package:flutter_test/flutter_test.dart';
import 'package:hama/src/domain/models/home.dart';
import 'package:hama/src/domain/repositories/home_repository.dart';
import 'package:hama/src/domain/usecases/home/get_homes_usecase.dart';
import 'package:hama/src/domain/usecases/use_cases.dart';
import 'package:mocktail/mocktail.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

main() {
  test('Get Homes UseCase Success', () async {
    final repository = HomeRepositoryMock();

    when(() => repository.getHomes()).thenAnswer((_) async => <Home>[]);

    final useCase = GetHomesUseCase(repository);

    final result = await useCase.call();

    expect(result.homes, isA<List<Home>>());
    expect(result.failure, null);
  });

  test('Get Homes UseCase', () async {
    final repository = HomeRepositoryMock();

    when(() => repository.getHomes()).thenThrow(Exception());

    final useCase = GetHomesUseCase(repository);

    final result = await useCase.call();

    expect(result.homes, null);
    expect(result.failure, isA<ServerFailure>());
  });
}
