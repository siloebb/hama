import '../../models/home.dart';
import '../../repositories/home_repository.dart';

class AddHomeUseCase {
  final HomeRepository repository;

  AddHomeUseCase(this.repository);

  Future<void> call(Home home) async {
    return repository.addHome(home);
  }
}
