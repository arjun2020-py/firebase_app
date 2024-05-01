import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.onPressed
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}
