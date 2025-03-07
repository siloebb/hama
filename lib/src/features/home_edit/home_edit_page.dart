import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/domain/models/address.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/domain/repositories/home_repository.dart';
import 'package:hama/src/features/home_edit/cubit/home_edit_cubit.dart';
import 'package:hama/src/features/home_list/cubit/home_list_cubit.dart';
import 'package:hama/src/features/home_edit/widgets/home_form.dart';

class HomeEditPage extends StatefulWidget {
  final Home? home;

  const HomeEditPage({super.key, this.home});

  @override
  State<HomeEditPage> createState() => _HomeEditPageState();
}

class _HomeEditPageState extends State<HomeEditPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HomeEditCubit(RepositoryProvider.of<HomeRepository>(context)),
      child: Scaffold(
        appBar: AppBar(title: Text('Home Edit')),
        body: BlocConsumer<HomeEditCubit, HomeEditState>(
          listener: (context, state) {
            if (state is HomeEditSuccess) {
              BlocProvider.of<HomeListCubit>(context).load();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  HomeForm(
                    home: widget.home,
                    onSubmit: (String? id, String name, Address address) {
                      BlocProvider.of<HomeEditCubit>(
                        context,
                      ).save(id: id, name: name, address: address);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
