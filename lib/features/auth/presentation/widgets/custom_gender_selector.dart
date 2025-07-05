import 'package:flutter/material.dart';

class CustomGenderSelector extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  const CustomGenderSelector({super.key, this.onChanged});

  @override
  State<CustomGenderSelector> createState() => _CustomGenderSelectorState();
}

class _CustomGenderSelectorState extends State<CustomGenderSelector> {
  final List<String> gender = ['Erkak', 'Ayol'];
  String? selectorGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: const Text("Jinsni tanlang"),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          value: selectorGender,
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFF1831B2),
          ),
          onChanged: (value) {
            setState(() {
              selectorGender = value;
            });
            widget.onChanged?.call(value!);
          },
          items: gender.map((gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
        ),
      ),
    );
  }
}
