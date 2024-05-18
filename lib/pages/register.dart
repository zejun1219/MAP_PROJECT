import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:template01/paragraph/my_textfield.dart';
import 'package:template01/paragraph/my_button.dart';
import 'login.dart';
import 'package:template01/user.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  String? errorMessage;

//text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void registerPage() {
    String inputUsername = usernameController.text;
    String inputPassword = passwordController.text;
    String inputPhone = phoneNumberController.text;
    String inputEmail = emailController.text;

    for (User user in users) {
      if (user.username == inputUsername) {
        setState(() {
          errorMessage = 'user already exsit, please register account again';
        });
        return;
      }
    }

    users.add(User(
      username: inputUsername,
      password: inputPassword,
      phone: inputPhone,
      email: inputEmail,
      createTime: DateTime.now(),
    ));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
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
                  height: 20,
                ),

                //welcome
                Text(
                  'Welcome to join us',
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
                const SizedBox(height: 10),
                //email
                MyTextfield(
                  controller: emailController,
                  hintText: ' email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                //phone
                MyTextfield(
                  controller: phoneNumberController,
                  hintText: ' phone',
                  obscureText: false,
                ),
                const SizedBox(height: 50),
                //sign in
                MyButton(
                  buttonText: 'Sign Up',
                  onTap: () {
                    registerPage(); // 调用注册逻辑
                  },
                ),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account?'),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign in now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const SizedBox(height: 10),

                const SizedBox(height: 50),

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
                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
