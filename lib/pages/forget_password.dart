import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/reset_password.dart';
import 'package:flutter_application_1/paragraph/my_textfield.dart';
import 'package:flutter_application_1/paragraph/my_button.dart';
import 'register.dart'; // 导入 reset_password.dart

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

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
                    controller: TextEditingController(),
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  // Email TextField
                  MyTextfield(
                    controller: TextEditingController(),
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  // Confirm Button
                  MyButton(
                    buttonText: 'Confirm',
                    onTap: () {
                      // 点击确认按钮后的逻辑
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ResetPasswordPage(), // 跳转到 ResetPasswordPage 页面
                        ),
                      );
                    },
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
