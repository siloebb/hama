import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/system_design/widgets/delete_button.dart';
import 'package:hama/src/core/system_design/widgets/edit_button.dart';
import 'package:hama/src/features/home_details/home_details_page.dart';
import 'package:hama/src/features/home_edit/home_edit_page.dart';
import 'package:hama/src/features/home_list/cubit/home_list_cubit.dart';

class HomeButtonCard extends StatelessWidget {
  final Home home;

  const HomeButtonCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeDetailsPage(home: home)),
        );
      },
      title: Text(home.name),
      subtitle: Text(home.address.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HAMEditButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeEditPage(home: home),
                ),
              );
            },
          ),
          HAMDeleteButton(
            onPressed:
                () => BlocProvider.of<HomeListCubit>(context).delete(home),
          ),
        ],
      ),
    );
  }
}
