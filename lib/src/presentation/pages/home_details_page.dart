import 'package:flutter/material.dart';
import 'package:hama/src/domain/models/home.dart';

class HomeDetailsPage extends StatefulWidget {
  final Home home;
  const HomeDetailsPage({super.key, required this.home});

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(widget.home.image != null) Image.network(widget.home.image!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.home.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.home.address,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}