import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lady/features/auth/presentation/widgets/custom_loading_button.dart';
import 'package:lady/features/dashboard/presentation/pages/dashboard_page.dart';

class EnterConfirmPasswordDialogPage extends StatefulWidget {
  final String phoneNumber;

  const EnterConfirmPasswordDialogPage({super.key, required this.phoneNumber});

  @override
  State<EnterConfirmPasswordDialogPage> createState() =>
      _EnterConfirmPasswordDialogPageState();
}

class _EnterConfirmPasswordDialogPageState
    extends State<EnterConfirmPasswordDialogPage> {
  Timer? _timer;
  int _remainingSeconds = 120;
  String _timeText = '02:00';
  bool isEnabled = false;

  List<TextEditingController> _controllers = [];
  List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    startTimer();
    _controllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
  }

  void startTimer() {
    _timer?.cancel();
    _remainingSeconds = 120;
    _updateTimeText();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds--;
        _updateTimeText();
        if (_remainingSeconds <= 0) {
          _timer?.cancel();
        }
      });
    });
  }


  void _updateTimeText() {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    _timeText = '$minutes:$seconds';
  }

  void checkAllFilled() {
    final allFilled = _controllers.every((c) => c.text.length == 1);
    setState(() {
      isEnabled = allFilled;
    });
  }

  Widget buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 56,
          height: 56,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              hintText: '-',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 5) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else {
                  FocusScope.of(context).unfocus();
                }
              } else {
                if (index > 0) {
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }
              }
              checkAllFilled();
            },
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
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
              children: [
                const SizedBox(height: 32),
                Text(
                  maskPhoneNumber(widget.phoneNumber),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                buildOtpFields(),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _timeText == "00:00" ? () {
                    startTimer();
                  } : null,
                  child: _timeText == "00:00"
                      ? const Text("Kodni qayta olish uchun bosing")
                      : Text("Kodni qayta olish $_timeText"),
                ),
              ],
            ),
            CustomLoadingButton(title: "Tasdiqlash", onPressed: (){
              Fluttertoast.showToast(
                msg: getCodeFromFields(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black87,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const DashboardPage()));
            }, isEnabled: isEnabled)
          ],
        ),
      ),
    );
  }

  String maskPhoneNumber(String phone) {
    if (phone.length != 12 || !phone.startsWith('998')) {
      return phone;
    }
    const countryCode = '+998';
    final region = phone.substring(3, 5);
    final visibleEnd = phone.substring(10);
    return '$countryCode $region *** ** $visibleEnd';
  }

  String getCodeFromFields() {
    return _controllers.map((c) => c.text).join();
  }
}
