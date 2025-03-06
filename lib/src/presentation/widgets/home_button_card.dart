import 'package:flutter/material.dart';
import 'package:hama/src/domain/models/home.dart';
import 'package:hama/src/presentation/pages/home_details_page.dart';

class HomeButtonCard extends StatelessWidget {
  final Home home;
  const HomeButtonCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailsPage(home: home),
            ),
          );
        },
        title: Text(home.name),
        subtitle: Text(home.address),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}