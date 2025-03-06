
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/presentation/presenters/home_list/home_list_cubit.dart';
import 'package:hama/src/presentation/widgets/home_button_card.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeListCubit, HomeListState>(
        builder: (context, state){
          if(state is HomeListLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is HomeListLoaded){
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index){
                return HomeButtonCard(home: state.list[index]);
              },
            );
          } else if(state is HomeListFailed){
            return Center(
              child: Text(state.message),
            );
          } else if(state is HomeListEmpty){
            return Center(
              child: Text('No data'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
