import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecorations(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 2)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.deepPurple)
            : null);
  }
}
