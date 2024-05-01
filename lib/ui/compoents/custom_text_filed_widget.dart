import 'package:flutter/material.dart';

class CustomTextfiledWidget extends StatelessWidget {
  const CustomTextfiledWidget({super.key, required this.hintText,required this.controller});
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintText),
    );
  }
}
