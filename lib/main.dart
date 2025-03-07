import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';
import 'package:hama/src/di/providers.dart';
import 'package:hama/src/features/home_list/home_list_page.dart';
import 'package:hama/src/features/home_list/cubit/home_list_cubit.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: Injections.instance.repositoryProviders,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeListCubit>(
            create:
                (context) => HomeListCubit(
                  RepositoryProvider.of<HomeRepository>(context),
                )..load(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HAMA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // routes: {
      //   '/': (context) => const HomeListPage(),
      //   '/home/edit': (context) => const HomeEditPage(),
      // },
      home: const HomeListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
