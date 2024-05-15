import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.textEditingController,
    required this.hinttext,
    this.ispass = false,
  });

  final TextEditingController textEditingController;
  final String hinttext;
  final bool ispass;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hinttext,
        filled: true,
        focusedBorder:
            OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
        border:
            OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
      ),
      obscureText: ispass,
    );
  }
}
