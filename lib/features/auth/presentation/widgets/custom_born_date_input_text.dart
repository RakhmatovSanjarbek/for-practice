import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomBornDateInputText extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const CustomBornDateInputText(
      {super.key, required this.controller, this.onChanged});

  @override
  State<CustomBornDateInputText> createState() =>
      _CustomBornDateInputTextState();
}

class _CustomBornDateInputTextState extends State<CustomBornDateInputText> {
  final bornDateFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'\d')},
      type: MaskAutoCompletionType.lazy);

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (pickedDate != null) {
      final formatted = DateFormat('dd/MM/yyyy').format(pickedDate);
      widget.controller.text = formatted;
      widget.onChanged?.call(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              inputFormatters: [bornDateFormatter],
              decoration: const InputDecoration(
                hintText: 'DD/MM/YYYY',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
                isCollapsed: true,
              ),
              onChanged: widget.onChanged,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: _selectDate,
            icon: const Icon(
              Icons.calendar_month,
              color: Color(0xFF1831B2),
            ),
          )
        ],
      ),
    );
  }
}
