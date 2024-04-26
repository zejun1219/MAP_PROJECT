import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({Key? key}) : super(key: key);

  // Method to launch URLs
  void _launchURL(String url) async {
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.chat,
            size: 40.0,
          ),
          onPressed: () => _launchURL('https://wa.me/+601161220980'),
        ),
        SizedBox(width: 20), // 图标间距
        IconButton(
          icon: Icon(
            Icons.face,
            size: 40.0,
          ),
          onPressed: () => _launchURL(
              'https://www.facebook.com/profile.php?id=100069972000599'),
        ),
      ],
    );
  }
}
