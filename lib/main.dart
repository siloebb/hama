import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/data/repositories/home_repository_impl.dart';
import 'package:hama/src/domain/repositories/home_repository.dart';
import 'package:hama/src/presentation/pages/home_list_page.dart';
import 'package:hama/src/presentation/presenters/home_list/home_list_cubit.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepositoryImpl(),
        ),
      ],
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeList(),
    );
  }
}
