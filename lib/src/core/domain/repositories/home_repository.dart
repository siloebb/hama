import 'package:hama/src/core/domain/models/address.dart';

import '../models/home.dart';

abstract class HomeRepository {
  Future<Home> addHome(String name, Address address);
  Future<Home> updateHome(Home home);
  Future<void> deleteHome(String homeId);
  Future<List<Home>> getHomes();
  Future<Home?> getHome(String homeId);
}
