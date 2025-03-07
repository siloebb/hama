
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/system_design/widgets/loading_indicator.dart';
import 'package:hama/src/core/system_design/widgets/primary_button.dart';
import 'package:hama/src/features/home_edit/home_edit_page.dart';
import 'package:hama/src/features/home_list/cubit/home_list_cubit.dart';
import 'package:hama/src/features/home_list/widgets/home_button_card.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home List'),
        actions: [
          HAMPrimaryButton(
            label: 'New Home',
            icon: Icons.add,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeEditPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeListCubit, HomeListState>(
        builder: (context, state){
          if(state is HomeListLoading){
            return Center(
              child: HAMLoadingIndicator(),
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
