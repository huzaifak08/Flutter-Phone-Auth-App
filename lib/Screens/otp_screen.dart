import 'package:flutter/material.dart';
import 'package:phone_auth_app/Provider/auth_provider.dart';
import 'package:phone_auth_app/Screens/user_info_screen.dart';
import 'package:phone_auth_app/Utils/utils.dart';
import 'package:phone_auth_app/Widget/custom_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Provider:

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.purple.shade50, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/image2.png'),
                  ),
                  const SizedBox(height: 20),
                  const Text('Verification',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter the OTP send to your phone number",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  ),
                  const SizedBox(height: 20),
                  Pinput(
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.purple.shade200)),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                    controller: otpController,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: CustomButton(
                      onPressed: () {
                        if (otpController != null) {
                          verifyOtp(context, otpController.text);
                        } else {
                          showSnackBar(context, 'Enter 6-Digit code');
                        }
                      },
                      text: 'Verify',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Didn't recieve any code?",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Resend New Code",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) async {}
}
