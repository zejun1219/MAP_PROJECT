import 'package:flutter/material.dart';
import 'package:flutter_application_1/paragraph/my_textfield.dart';
import 'package:flutter_application_1/paragraph/my_button.dart';
import 'Login.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
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
                'Reset Password',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // New Password TextField
              MyTextfield(
                controller: TextEditingController(),
                hintText: 'New password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              // Confirm Password TextField
              MyTextfield(
                controller: TextEditingController(),
                hintText: 'Confirm password',
                obscureText: true,
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
                        builder: (context) => LoginPage()), // 跳转到 Login.dart 页面
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
