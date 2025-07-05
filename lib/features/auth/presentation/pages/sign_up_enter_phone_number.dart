import 'package:flutter/material.dart';
import 'package:lady/features/auth/presentation/pages/enter_confirm_password_dialog_page.dart';
import 'package:lady/features/auth/presentation/widgets/custom_loading_button.dart';
import 'package:lady/features/auth/presentation/widgets/custom_phone_input_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpEnterPhoneNumber extends StatefulWidget {
  const SignUpEnterPhoneNumber({super.key});

  @override
  State<SignUpEnterPhoneNumber> createState() => _SignUpEnterPhoneNumberState();
}

class _SignUpEnterPhoneNumberState extends State<SignUpEnterPhoneNumber> {
  final TextEditingController _phoneController = TextEditingController();

  final MaskTextInputFormatter _phoneFormatter = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.lazy,
  );

  String errorPhoneText = '';
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3F3FF),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    "Telefon raqam kiriting",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomPhoneInputText(
                    controller: _phoneController,
                    errorText: errorPhoneText.toString(),
                    phoneFormatter: _phoneFormatter,
                    onChanged: _onTextChanged,
                  )
                ],
              ),
              CustomLoadingButton(
                title: "Tasdiqlang",
                onPressed: confirm,
                isEnabled: isButtonEnabled,
              )
            ],
          ),
        ));
  }

  String normalizePhoneNumber(String formattedNumber) {
    final digitsOnly = formattedNumber.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length != 9) {
      throw FormatException('Noto‘g‘ri format: $formattedNumber');
    }
    return '998$digitsOnly';
  }

  void confirm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnterConfirmPasswordDialogPage(
            phoneNumber: normalizePhoneNumber(_phoneController.text)),
        fullscreenDialog: true,
      ),
    );
  }

  void _onTextChanged(String value) {
    setState(() {
      isButtonEnabled = value.length >= 14;
    });
  }
}
