import '../../repositories/home_repository.dart';

class DeleteHomeUseCase {
  final HomeRepository repository;

  DeleteHomeUseCase(this.repository);

  Future<void> call(String homeId) async {
    return repository.deleteHome(homeId);
  }
}
