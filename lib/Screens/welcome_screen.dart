import 'package:flutter/material.dart';
import 'package:phone_auth_app/Provider/auth_provider.dart';
import 'package:phone_auth_app/Screens/home_screen.dart';
import 'package:phone_auth_app/Screens/register_screen.dart';
import 'package:phone_auth_app/Widget/custom_widget.dart';
import 'package:provider/provider.dart';

import '../Utils/utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Provider:
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image1.png',
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text('Lets get Started',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                'Never a better time than now to start.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  text: 'Get Started',
                  onPressed: () async {
                    if (ap.isSignedIn == true) {
                      ap.getDataFromSP().whenComplete(() {
                        nextScreenReplacement(context, const HomeScreen());
                      });
                    } else {
                      nextScreenReplacement(context, const RegisterScreen());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
