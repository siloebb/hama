import '../models/home.dart';

abstract class HomeRepository {
  Future<void> addHome(Home home);
  Future<void> updateHome(Home home);
  Future<void> deleteHome(String homeId);
  Future<List<Home>> getHomes();
}
