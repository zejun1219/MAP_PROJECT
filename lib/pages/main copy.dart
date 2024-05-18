import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 239, 32)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content:
              Text('Login attempt with Username: ${_usernameController.text}'),
        );
      },
    );
  }

  void _goToSignUp() {
    // Navigate to the sign-up page. Replace the below line with actual navigation code.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Navigate to sign-up page'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome To Pizzria!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        // Add functionality to toggle password visibility
                      },
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('LOGIN'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity,
                        50), // double.infinity is the width and 50 is the height
                  ),
                ),
                SizedBox(height: 15),
                TextButton(
                  onPressed: _goToSignUp,
                  child: Text('Don\'t have an account? Sign up'),
                  style: TextButton.styleFrom(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
