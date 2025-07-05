import 'package:flutter/material.dart';

class CustomLoadingButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isEnabled;

  const CustomLoadingButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? const Color(0xFF1831B2) : const Color(
              0xffe7e7ef),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: isEnabled ? Colors.white: Colors.black),
        ),
      ),
    );
  }
}
