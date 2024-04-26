import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  // Method to launch URLs
  void _launchURL(String url) async {
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                'lib/images/pizza.png',
                height: 80,
              ), // Place your WhatsApp icon in the assets folder
              onPressed: () => _launchURL(
                  'https://wa.me/yourphonenumber'), // Replace with your phone number
            ),
            SizedBox(width: 20), // Space between icons
            IconButton(
              icon: Image.asset(
                'lib/images/pizza.png',
                height: 80,
              ), // Place your Facebook icon in the assets folder
              onPressed: () => _launchURL(
                  'https://www.facebook.com/yourprofile'), // Replace with your profile link
            ),
          ],
        ),
      ),
    );
  }
}
//hah