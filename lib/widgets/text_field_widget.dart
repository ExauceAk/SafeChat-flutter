import 'package:flutter/material.dart';

Widget buildTextField(
  TextEditingController fieldController,
  String label, {
  bool isPassword = false,
}) {
  return SizedBox(
    height: 48,
    child: TextField(
      obscureText: isPassword,
      controller: fieldController,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.blueGrey),
        filled: true,
        fillColor: Color(0xFFf6f6f6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
