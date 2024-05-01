import 'package:flutter/material.dart';

class CustomElevButtonWidget extends StatelessWidget {
  const CustomElevButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.buttonColor,
      required this.widthSize
      });
  final String text;
  final void Function()? onPressed;
  final Color buttonColor;
  final double widthSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * widthSize,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
          onPressed: onPressed,
          child: Text(
            text,
          )),
    );
  }
}
