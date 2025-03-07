
import 'package:flutter_test/flutter_test.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';
import 'package:hama/src/core/domain/usecases/home/delete_home_usecase.dart';
import 'package:mocktail/mocktail.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

main(){
  final repository = HomeRepositoryMock();
  test('Should call deleteHome with correct values', () async {
    final useCase = DeleteHomeUseCase(repository, 'any_id');
    
    useCase.call();
    
    verify(() => repository.deleteHome('any_id')).called(1);
  });

  test('Should throw if deleteHome throws', () async {    
    final useCase = DeleteHomeUseCase(repository, 'any_id');
    
    when(() => repository.deleteHome('any_id')).thenThrow(Exception());
    
    final future = useCase.call();
    
    expect(future, throwsA(TypeMatcher<Exception>()));
  });
}