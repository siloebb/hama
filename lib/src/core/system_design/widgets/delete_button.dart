import 'package:flutter/material.dart';

class HAMDeleteButton extends StatelessWidget {
  final Function() onPressed;
  const HAMDeleteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: onPressed,
    );
  }
}