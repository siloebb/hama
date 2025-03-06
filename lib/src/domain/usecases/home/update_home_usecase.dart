import '../../models/home.dart';
import '../../repositories/home_repository.dart';

class UpdateHomeUseCase {
  final HomeRepository repository;

  UpdateHomeUseCase(this.repository);

  Future<void> call(Home home) async {
    return repository.updateHome(home);
  }
}
