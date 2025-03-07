import 'package:flutter/material.dart';

class HAMSecondaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final IconData? icon;
  final bool isLoading;

  const HAMSecondaryButton({
    super.key,
    this.onPressed,
    required this.label,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      label: Text(label),
      icon: icon != null ? Icon(icon) : null,
      onPressed: isLoading ? null : onPressed,
    );
  }
}
