import 'package:flutter_test/flutter_test.dart';
import 'package:hama/src/core/domain/models/address.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';
import 'package:hama/src/core/domain/usecases/home/update_home_usecase.dart';
import 'package:mocktail/mocktail.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

main() {
  late HomeRepositoryMock homeRepositoryMock;

  setUp(() {
    homeRepositoryMock = HomeRepositoryMock();
  });

  test('should call updateHome from HomeRepository', () async {
    final home = Home(
      id: '1',
      name: 'Home',
      address: Address(
        city: 'City',
        street: 'Street',
        state: 'state',
        zip: 'zip',
      ),
    );
    when(
      () => homeRepositoryMock.updateHome(home),
    ).thenAnswer((_) async => home);

    final useCase = UpdateHomeUseCase(homeRepositoryMock, home);

    await useCase.call();

    verify(() => homeRepositoryMock.updateHome(home)).called(1);
  });
}
