import 'package:bronzedblue/common/widgets/custom_button.dart';
import 'package:bronzedblue/common/widgets/custom_textfield.dart';
import 'package:bronzedblue/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signUp-screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _SignUpFormKey = GlobalKey<FormState>();
  final Authservice authservice = Authservice();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _mobileNumberController.dispose();
  }

  void signUpUser() {
    authservice.signUpUser(
        context: context,
        email: _emailController.text,
        username: _usernameController.text,
        password: _passwordController.text,
        mobileNumber: _mobileNumberController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Bronzed Blue',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Form(
                  key: _SignUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _usernameController,
                        hinttext: "Enter Username",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hinttext: "Enter Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hinttext: "Enter Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _mobileNumberController,
                        hinttext: "Enter Mobile Number",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: 'Sign Up',
                        onTap: () {
                          if (_SignUpFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      )),
    );
  }
}
