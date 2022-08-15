import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/app/modules/authentication/presenter/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          right: 28,
          left: 28,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Hello Again!',
            style: GoogleFonts.openSans(
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Welcome back, you\'ve\nbeen missed!',
            style: GoogleFonts.openSans(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          TextField(
              onChanged: controller.setEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'e-mail',
              ),
              cursorColor: Colors.black),
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: controller.setPassword,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'password',
            ),
            cursorColor: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Forgot your password?',
                style: GoogleFonts.openSans(
                    color: Colors.blue[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.right,
              ),
            ),
            onTap: () => Modular.to.pushNamed('/login/change_password'),
          ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                controller.enterEmail();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Text(
                'SIGN IN',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'New here? Sign up',
              style: GoogleFonts.openSans(
                  color: Colors.blue[600],
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            onTap: () => Modular.to.pushNamed('/login/sign_up'),
          )
        ]),
      ),
    );
  }
}
