import 'package:hama/src/domain/models/home.dart';
import 'package:hama/src/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl();

  @override
  Future<void> addHome(Home home) {
    // TODO: implement addHome
    throw UnimplementedError();
  }

  @override
  Future<void> deleteHome(String homeId) {
    // TODO: implement deleteHome
    throw UnimplementedError();
  }

  @override
  Future<List<Home>> getHomes() {
    return Future.value([
      Home(id: '1', name: 'White House', address: 'Far Away'),
      Home(id: '2', name: 'Pink House', address: 'Far Far Away'),
    ]);
  }

  @override
  Future<void> updateHome(Home home) {
    // TODO: implement updateHome
    throw UnimplementedError();
  }
}
