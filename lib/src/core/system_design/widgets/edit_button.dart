import 'package:flutter/material.dart';

class HAMEditButton extends StatelessWidget {
  final Function() onPressed;
  const HAMEditButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: onPressed,
    );
  }
}