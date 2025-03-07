import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/data/repositories/home_asset_repository_impl.dart';
import 'package:hama/src/core/data/repositories/home_repository_impl.dart';
import 'package:hama/src/core/domain/repositories/home_asset_repository.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';

class Injections {

  static final Injections instance = Injections._internal();

  factory Injections() {
    return instance;
  }

  Injections._internal();

  List<RepositoryProvider> repositoryProviders = [
    RepositoryProvider<HomeRepository>(
      create: (context) => HomeRepositoryImpl(),
    ),
    RepositoryProvider<HomeAssetRepository>(
      create: (context) => HomeAssetRepositoryImpl(),
      lazy: true,
    ),
  ];
}
