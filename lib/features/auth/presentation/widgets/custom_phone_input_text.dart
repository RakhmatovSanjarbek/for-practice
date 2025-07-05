import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomPhoneInputText extends StatelessWidget {
  final TextEditingController controller;
  final String errorText;
  final Function(String)? onChanged;
  final MaskTextInputFormatter phoneFormatter;

  const CustomPhoneInputText({
    super.key,
    required this.controller,
    required this.errorText,
    required this.phoneFormatter,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "+998 ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  keyboardType: TextInputType.number,
                  inputFormatters: [phoneFormatter],
                  decoration: const InputDecoration(
                    hintText: '(__) ___-__-__',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey),
                    isCollapsed: true,
                  ),
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          errorText,
          style: const TextStyle(fontSize: 12, color: Colors.red),
        )
      ],
    );
  }
}
