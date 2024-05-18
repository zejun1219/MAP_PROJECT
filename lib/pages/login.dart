import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:template01/paragraph/my_textfield.dart';
import 'package:template01/paragraph/my_button.dart';
import 'home_page.dart';
import 'register.dart';
import 'package:template01/user.dart';
import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = ''; // 添加一个错误消息的状态
//sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          //保护屏幕不被超出
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                //logo

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/pizza.png',
                      height: 200,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                //welcome
                Text(
                  'Welcome to pizzeria',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: 50,
                ),
                //username
                MyTextfield(
                  controller: usernameController,
                  hintText: ' username',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                //password
                MyTextfield(
                  controller: passwordController,
                  hintText: ' password',
                  obscureText: true,
                ),

                //forgot password
                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Forget password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                //sign in button
                MyButton(
                  buttonText: "Sign In",
                  onTap: () {
                    bool userExists = false;
                    for (User user in users) {
                      if (usernameController.text == user.username &&
                          passwordController.text == user.password) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(user: user)),
                        );
                        userExists = true;
                        break;
                      }
                      if (!userExists) {
                        setState(() {
                          errorMessage =
                              'Account does not exist, please register an account';
                        });
                      }
                    }
                  },
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => register(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign up now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                //continue with google
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(color: Colors.grey[700]),
                          )),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //google button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/Google.png',
                      height: 72,
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
