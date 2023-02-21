import 'package:bronzedblue/common/widgets/custom_button.dart';
import 'package:bronzedblue/common/widgets/custom_textfield.dart';
import 'package:bronzedblue/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final Authservice authservice = Authservice();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() {
    authservice.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
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
                  key: _loginFormKey,
                  child: Column(
                    children: [
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
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: 'Login',
                          onTap: () {
                            if (_loginFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          })
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
