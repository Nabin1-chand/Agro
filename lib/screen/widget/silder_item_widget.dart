import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderItemWidget extends StatelessWidget {
  const SliderItemWidget({
    super.key,
    required this.contentList,
    required this.containerColor,
  });

  final List<Map<String, String>> contentList;
  final List<Color> containerColor;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: contentList.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            height: 170,
            width: 320,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: containerColor[index]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contentList[index]['title'] ?? "Not title",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  contentList[index]['offer'] ?? "No offer",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  contentList[index]['description'] ?? "No description",
                  style: const TextStyle(
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
            viewportFraction: 0.8));
  }
}
