import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:template01/admin_pages/admin_page.dart';
import 'package:template01/cstm_pages/cstm_home.dart';
import 'package:template01/models/authService.dart';
import 'package:template01/pages/forget_password.dart';
import 'package:template01/paragraph/my_textfield.dart';
import 'package:template01/paragraph/my_button.dart';
// import '../admin_pages/home_page.dart';
import '../admin_pages/register.dart';
import 'package:template01/models/user.dart';
// import '../admin_pages/forget_password.dart';

// import 'package:flutter/material.dart';
// import 'package:template01/admin_pages/admin_page.dart';
// import 'package:template01/pages/forget_password.dart';
// import 'package:template01/paragraph/my_textfield.dart';
// import 'package:template01/paragraph/my_button.dart';
// import 'package:template01/models/user.dart';
// import 'package:template01/auth_service.dart'; // 引入 AuthService

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService authService = AuthService(); // 实例化 AuthService

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

  void signUserIn() {
    String username = usernameController.text.isEmpty ? 'guest' : usernameController.text;
    String password = passwordController.text.isEmpty ? '123' : passwordController.text;

    User? user = authService.authenticateUser(username, password);

    if (user != null) {
      if (user.role == 'ADMIN') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminHome(user: user)),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerHome(user:user)),
        );
      }
    } else {
      setState(() {
        errorMessage = 'Account does not exist, please register an account';
      });
    }
  }

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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/pizza.png',
                      height: 200,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome to pizzeria',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 50),
                MyTextfield(
                  controller: usernameController,
                  hintText: 'username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
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
                MyButton(
                  buttonText: "Sign In",
                  onTap: signUserIn,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                       // Navigator.push(
                          // context,
                          // MaterialPageRoute(
                          //   builder: (context) => RegisterPage(),
                          // ),
                       // );
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
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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


