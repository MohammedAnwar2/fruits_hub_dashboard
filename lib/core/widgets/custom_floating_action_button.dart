import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
  });
  final Function(BuildContext context) onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        onPressed(context);
      },
      child: const Icon(Icons.add),
    );
  }
}