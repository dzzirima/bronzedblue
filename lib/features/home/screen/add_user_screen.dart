import 'package:bronzedblue/common/widgets/custom_button.dart';
import 'package:bronzedblue/common/widgets/custom_textfield.dart';
import 'package:bronzedblue/features/home/screen/services/add_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddUserScreen extends StatefulWidget {
  static const String routeName = '/add-user-screen';
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final addUserKey = GlobalKey<FormState>();
  final AddUserService addUserService = AddUserService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
  }

  void addUser() {
    addUserService.addUser(
        context: context,
        email: _emailController.text,
        name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Add New User"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // const Text(
            //   'Bronzed Blue',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            // ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Form(
                  key: addUserKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hinttext: "Enter Name",
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
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: 'Add New User',
                        onTap: () {
                          if (addUserKey.currentState!.validate()) {
                            addUser();
                          }
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
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
