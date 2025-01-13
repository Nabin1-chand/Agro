import 'package:agro_app/constant/image_constant.dart';
import 'package:agro_app/screen/login_screen.dart';
import 'package:agro_app/widget/custom_button.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double currentPage = 0.0;
  final _pageController = PageController();

  List<Widget> _buildSlides() {
    return items.map((item) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            item['image'],
            // width: 220.0,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            item['title']!,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0XFF3F3D56),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              item['description']!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                letterSpacing: 1.2,
                height: 1.3,
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  List<Widget> _buildIndicatior() {
    return List.generate(
        items.length,
        (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 10.0,
              width: 10.0,
              decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Color(0XFF256075)
                    : Color(0XFF256075).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildSlides()[index];
                }),
            Positioned(
                bottom: 120.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicatior())),
            Positioned(
                bottom: 15.0,
                left: 0.0,
                right: 0.0,
                child: CustomButton(
                    text: 'GET STARTED',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    width: 300))
          ],
        ),
      ),
    );
  }
}

List items = [
  {
    "title": "Welcome to Tanam!",
    "description":
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    "image": ImageConstant.image1,
  },
  {
    "title": 'Welcome to Tanam!',
    "description":
        "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
    "image": ImageConstant.image2,
  },
  {
    "title": 'Welcome to Tanam!',
    "description":
        "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
    "image": ImageConstant.image2,
  }
];
