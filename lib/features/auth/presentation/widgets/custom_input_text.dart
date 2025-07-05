import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const CustomInputText(
      {super.key, required this.controller, required this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Expanded(
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.grey),
          ),
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
