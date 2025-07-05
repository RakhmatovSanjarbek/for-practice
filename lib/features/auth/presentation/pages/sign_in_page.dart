import 'package:flutter/material.dart';
import 'package:lady/features/auth/presentation/pages/sign_up_page.dart';
import 'package:lady/features/auth/presentation/widgets/custom_loading_button.dart';
import 'package:lady/features/auth/presentation/widgets/custom_phone_input_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                  "Hisobga kirish",
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
            Column(
              children: [
                CustomLoadingButton(
                  title: "Kirish",
                  onPressed: signIn,
                  isEnabled: isButtonEnabled,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Agar sizda hisob bo'lmasa",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: toSignUpPage,
                      child: const Text(
                        "Ro'yxardan o'tish",
                        style: TextStyle(color: Color(0xFF1831B2)),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void signIn() {
    setState(() {
      errorPhoneText = "Bu telefon raqam ro'yxatdan o'tmagan";
    });
  }

  void toSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
    );
  }

  void _onTextChanged(String value) {
    setState(() {
      isButtonEnabled = value.length >= 14;
    });
  }
}
