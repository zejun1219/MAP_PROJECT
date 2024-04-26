// 08 reset main function
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/register.dart';
import 'package:flutter_application_1/pages/reset_password.dart';
import 'package:flutter_application_1/pages/contact_us.dart';
import 'package:flutter_application_1/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 243, 242, 244)),
        useMaterial3: true,
      ),
      home: LoginPage(),
      routes: {
        '/loginPage': (context) => LoginPage(),
        '/register': (context) => register(),
        '/contactUsPage': (context) => ContactUsPage(),
        '/resetPasswordPage': (context) => ResetPasswordPage(),
        //'/myProfilePage': (context) => MyProfilePage()
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/homePage':
            final User user = settings.arguments as User; // 从arguments中提取User参数
            return MaterialPageRoute(
                builder: (context) => HomePage(user: user));
          default:
            return null;
        }
      },
    );
  }
}
