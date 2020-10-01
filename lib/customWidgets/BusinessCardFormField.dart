import 'package:flutter/material.dart';

Container makeContainer(TextEditingController _controller, Color cursorColor, Color textColor, String labelText, TextInputType textInputType, TextInputAction textInputAction) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
    child: TextFormField(
      controller: _controller,
      cursorColor: cursorColor,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: textInputType,
      textInputAction: textInputAction,
    ),
  );
}