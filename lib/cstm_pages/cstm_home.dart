import 'package:flutter/material.dart';
import 'package:template01/models/user.dart';
import 'package:template01/components/cstm_home_com.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerHome extends StatefulWidget {
  final User user;

  const CustomerHome({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  final List<String> images = [
    'lib/images/Pine meat.jpeg',
    'lib/images/durain.jpeg',
    'lib/images/seafood.jpeg',
    // 添加更多图片的 URL
  ];

  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.6, // 设置视口占比为0.6
    );
    _startAutoPageChange();
  }

  void _startAutoPageChange() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentPage = (_currentPage + 1) % images.length;
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          _startAutoPageChange();
        });
      }
    });
  }

  void _launchTwitter() async {
    const url = 'https://twitter.com/utm_my';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchFacebook() async {
    const url = 'https://www.facebook.com/univteknologimalaysia';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Home Page'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: CustomDrawer(user: widget.user),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Welcome to the Pizza House!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              child: PageView.builder(
                itemCount: images.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Transform.scale(
                    scale: index == _currentPage ? 1 : 0.8, // 当前页全尺寸，其他页缩小
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10), // 添加水平间距
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover, // 更改为 cover 以填满容器
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'We are delighted to serve you with the best pizzas in town. Our pizzas are made with love and fresh ingredients, ensuring a delightful experience with every bite.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Explore our menu and enjoy your favorite pizza!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.alternate_email),
                  color: Colors.blue,
                  iconSize: 40,
                  onPressed: _launchTwitter,
                ),
                IconButton(
                  icon: Icon(Icons.facebook),
                  color: Colors.blue,
                  iconSize: 40,

                  onPressed: _launchFacebook,
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

