import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> contentList = [
    {
      'title': 'Happy Weekend',
      'offer': '20 % off',
      'description': 'for All Menus',
    },
    {
      'title': 'Summer Sale',
      'offer': '30 % off',
      'description': 'on Drinks & Desserts',
    },
    {
      'title': 'Winter Special',
      'offer': '15 % off',
      'description': 'on Hot Beverages',
    },
    {
      'title': 'Limited Time Offer',
      'offer': '10 % off',
      'dexription': 'on All Orders'
    },
  ];

  final List<Color> containerColor = [
    const Color.fromARGB(255, 130, 170, 240),
    const Color.fromARGB(255, 91, 233, 162),
    const Color.fromARGB(255, 79, 177, 129),
    const Color.fromARGB(255, 196, 170, 201),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 10,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Khagendra',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: TextStyle(
                color: const Color(0xff020202),
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Color.fromARGB(255, 202, 218, 235),
                  ),
                ),
                hintText: "Search beverages or foods",
                hintStyle: const TextStyle(
                    color: Color(0xffb2b2b2),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    decorationThickness: 6),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CarouselSlider.builder(
                itemCount: contentList.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    height: 170,
                    width: 320,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: containerColor[index]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contentList[index]['title'] ?? "Not title",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          contentList[index]['offer'] ?? "No offer",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          contentList[index]['description'] ?? "No description",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                    height: 190,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8))
          ],
        ),
      ),
    );
  }
}
