import 'package:flutter/material.dart';
import 'package:login/screen/auth_page.dart';
import 'package:login/screen/signup_screen.dart';
import 'package:login/widget/custom_scaffold.dart';
import 'package:login/widget/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Column(
      children: [
        Flexible(
          flex: 8,
            child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 40.0,
          ),
          child: Center(
              child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(children: [
              TextSpan(
                text: 'Welcome!',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                  text: '\nPlease register or login to continue',
                  style: TextStyle(
                    fontSize: 18,
                  ))
            ]),
          )),
        )),
        const Flexible(
          flex: 0,

            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                        children: [
              Expanded(
                child: WelcomeButton(
                  buttonText: 'Sign in',
                  onTap: AuthPage(),
                  color: Colors.transparent,
                  textColor: Colors.white,
                ),
              ),
              Expanded(
                child: WelcomeButton(
                  buttonText: 'Sign up',
                  onTap: SignUpScreen(),
                  color: Colors.white,
                  textColor: Colors.blue,
                ),
              ),
                        ],
                      ),
            ))
      ],
    ));
  }
}




