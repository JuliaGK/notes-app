import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/app/modules/authentication/presenter/pages/sign_up/sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final controller = Modular.get<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          right: 28,
          left: 28,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Welcome!',
            style: GoogleFonts.openSans(
              fontSize: 38,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Create an account bellow',
            style: GoogleFonts.openSans(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
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
            cursorColor: Colors.black,
          ),
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
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                controller.signUp();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(240, 50),
              ),
              child: Text(
                'SIGN UP',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}