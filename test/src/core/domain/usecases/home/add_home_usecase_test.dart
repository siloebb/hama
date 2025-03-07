
import 'package:flutter_test/flutter_test.dart';
import 'package:hama/src/core/domain/models/address.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';
import 'package:hama/src/core/domain/usecases/home/add_home_usecase.dart';
import 'package:hama/src/core/domain/usecases/use_cases_failure.dart';
import 'package:mocktail/mocktail.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

main(){

  final city = 'city';
  final state = 'state';
  final street = 'street';
  final zip = 'zip';

  final Address address = Address(
    city: city,
    state: state,
    street: street,
    zip: zip,
  );

  test('Add Home UseCase Success', () async {
    final repository = HomeRepositoryMock();

    when(() => repository.addHome(any(), address)).thenAnswer((_) async => Home(
      id: 'id',
      name: 'name',
      address: address,
    ));
    final useCase = AddHomeUseCase(repository, 'name', address);

    final result = await useCase.call();

    expect(result.home, isA<Home>());
    expect(result.failure, null);
  });

  test('Add Home UseCase', () async {
    final repository = HomeRepositoryMock();

    when(() => repository.addHome('name', address)).thenThrow(Exception());
    final useCase = AddHomeUseCase(repository, 'name', address);

    final result = await useCase.call();

    expect(result.home, null);
    expect(result.failure, isA<ServerFailure>());
  });
  

}