import 'package:flutter/material.dart';
import 'package:lady/features/auth/presentation/widgets/custom_born_date_input_text.dart';
import 'package:lady/features/auth/presentation/widgets/custom_input_text.dart';
import 'package:lady/features/auth/presentation/widgets/custom_gender_selector.dart';
import 'package:lady/features/auth/presentation/widgets/custom_region_selector.dart';

import '../widgets/custom_loading_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameTextController = TextEditingController();
  final bornDateController = TextEditingController();
  String? selectedGender;
  String? selectedRegion;
  String? selectedDistrict;
  bool isButtonEnabled = false;

  void checkFormValid() {
    setState(() {
      isButtonEnabled = nameTextController.text.length >= 5 &&
          bornDateController.text.trim().isNotEmpty &&
          selectedGender != null &&
          selectedRegion != null &&
          selectedDistrict != null;
    });
  }

  @override
  void initState() {
    super.initState();
    nameTextController.addListener(checkFormValid);
    bornDateController.addListener(checkFormValid);
  }

  @override
  void dispose() {
    nameTextController.dispose();
    bornDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3FF),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 16),
                CustomInputText(
                  controller: nameTextController,
                  hintText: "Ism",
                  onChanged: (_) => checkFormValid(),
                ),
                const SizedBox(height: 16),
                CustomBornDateInputText(
                  controller: bornDateController,
                  onChanged: (_) => checkFormValid(),
                ),
                const SizedBox(height: 16),
                CustomGenderSelector(
                  onChanged: (val) {
                    selectedGender = val;
                    checkFormValid();
                  },
                ),
                const SizedBox(height: 16),
                CustomRegionSelector(
                  onChanged: (region, district) {
                    selectedRegion = region;
                    selectedDistrict = district;
                    checkFormValid();
                  },
                )
              ],
            ),
            Column(
              children: [
                CustomLoadingButton(
                  title: "Kirish",
                  onPressed: signUp,
                  isEnabled: isButtonEnabled,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Agar sizda hisob bo'lsa",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: signUpPageClose,
                      child: const Text(
                        "Kirish",
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

  void signUp() {}

  void signUpPageClose() {
    Navigator.pop(context);
  }
}
