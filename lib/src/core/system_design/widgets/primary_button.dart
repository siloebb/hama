import 'package:flutter/material.dart';

class HAMPrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final IconData? icon;
  final bool isLoading;

  const HAMPrimaryButton({
    super.key,
    this.onPressed,
    required this.label,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      label: Text(label),
      icon: icon != null ? Icon(icon) : null,
      onPressed: isLoading ? null : onPressed,
    );
  }
}
