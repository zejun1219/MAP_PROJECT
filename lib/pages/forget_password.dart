import 'package:flutter/material.dart';
import 'package:template01/pages/reset_password.dart';
import 'package:template01/paragraph/my_textfield.dart';
import 'package:template01/paragraph/my_button.dart';
import 'register.dart';
import 'package:template01/user.dart'; // 导入 reset_password.dart

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  String? errorMessage;

  void confirm() {
    String inputUsername = usernameController.text;
    String inputEmail = emailController.text;

    for (User user in users) {
      if (user.username == inputUsername && user.email == inputEmail) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResetPasswordPage(user: user)),
        );
        return;
      }
    }

    setState(() {
      errorMessage = 'This user does not exist';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forget Password',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/images/pizza.png',
                        height: 200,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Text
                  const Text(
                    'Retrieve Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Username TextField
                  MyTextfield(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // Email TextField
                  MyTextfield(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  // Confirm Button
                  MyButton(
                    onTap: confirm,
                    buttonText: 'Confirm',
                  ),

                  if (errorMessage != null)
                    Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
