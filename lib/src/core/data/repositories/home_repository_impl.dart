import 'package:hama/src/core/domain/models/address.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl();

  @override
  Future<Home> addHome(String name, Address address) {
    final home = Home(id: (_nextId++).toString(), name: name, address: address);
    homeList.add(home);
    return Future.value(home);
  }

  @override
  Future<void> deleteHome(String homeId) {
    homeList.removeWhere((e) => e.id == homeId);
    return Future.value();
  }

  @override
  Future<List<Home>> getHomes() async {
    await Future.delayed(Duration(seconds: 1));
    return homeList;
  }

  @override
  Future<Home> updateHome(Home home) {
    homeList.removeWhere((e) => e.id == home.id);
    homeList.add(home);
    return Future.value(home);
  }

  int _nextId = 3;

  final homeList = [
    Home(
      id: '1',
      name: 'White House',
      address: Address(
        street: '1600 Pennsylvania Ave NW',
        city: 'Washington',
        state: 'DC',
        zip: '20500',
      ),
    ),
    Home(
      id: '2',
      name: 'Pink House',
      address: Address(
        street: '1601 Pennsylvania Ave NW',
        city: 'Washington',
        state: 'DC',
        zip: '20500',
      ),
    ),
  ];

  @override
  Future<Home> getHome(String homeId) {
    return Future.value(
      homeList.firstWhere(
        (e) => e.id == homeId,
        orElse: () => throw Exception('Home not found'),
      ),
    );
  }
}
