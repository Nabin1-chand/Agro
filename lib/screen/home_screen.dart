import 'package:agro_app/constant/image_constant.dart';
import 'package:agro_app/screen/pages/fish_screen.dart';
import 'package:agro_app/screen/pages/fruit_screen.dart';
import 'package:agro_app/screen/pages/pizza_screen.dart';
import 'package:agro_app/screen/search_product.dart';
import 'package:agro_app/screen/widget/categroies_widget.dart';
import 'package:agro_app/screen/widget/product_widget.dart';
import 'package:agro_app/screen/widget/silder_item_widget.dart';
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
      'description': 'on All Orders'
    },
  ];
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Fruits',
      'subtitle': '45 items',
      'image': ImageConstant.fruitIcon,
      'page': const FruitScreen(),
      'color': const Color.fromARGB(255, 130, 170, 240),
    },
    {
      'title': 'Fish',
      'subtitle': '30 items',
      'image': ImageConstant.fishIcon,
      'page': const FishScreen(),
      'color': const Color.fromARGB(255, 91, 233, 162),
    },
    {
      'title': 'Pizza',
      'subtitle': '12',
      'image': ImageConstant.pizzaIcon,
      'page': const PizzaScreen(),
      'color': Colors.pinkAccent
    },
    {
      'title': 'Vegetable',
      'subtitle': '10',
      'image': ImageConstant.vegetableIcon,
      'page': const PizzaScreen(),
      'color': const Color.fromARGB(255, 255, 156, 189)
    },
    {
      'title': 'Wheat',
      'subtitle': '3',
      'image': ImageConstant.wheatIcon,
      'page': const PizzaScreen(),
      'color': const Color.fromARGB(255, 167, 139, 148)
    },
  ];
  final List<Color> containerColor = [
    const Color.fromARGB(255, 130, 170, 240),
    const Color.fromARGB(255, 91, 233, 162),
    const Color.fromARGB(255, 79, 177, 129),
    const Color.fromARGB(255, 196, 170, 201),
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Chicken Village',
      'price': 50.00,
      'image': ImageConstant.chickenVillage,
      'showDiscount': true
    },
    {
      'name': 'Pizza Hut',
      'price': 40.00,
      'image': ImageConstant.pizzaHut,
      'soButton': true,
      'showDiscount': false
    },
    {
      'name': 'Burger King',
      'price': 35.00,
      'image': ImageConstant.burgerKing,
      'showDiscount': true,
      'soButton': true
    },
    {
      'name': 'Tomato',
      'price': 20.00,
      'image': ImageConstant.tomato,
      'showDiscount': false
    },
    {
      'name': 'Fresh Grapes',
      'price': 35.00,
      'image': ImageConstant.freshGraphes,
      'soButton': true
    },
    // {'name': 'Fresh Avocados', 'price': 35.00, 'soButton': true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 10,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good Morning',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Khagendra',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchProduct()));
                },
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xff020202),
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
                    focusedBorder: const OutlineInputBorder(
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
              ),
              const SizedBox(
                height: 15,
              ),
              SliderItemWidget(
                  contentList: contentList, containerColor: containerColor),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        final page = categories[index]['page'];
                        if (page != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => page),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Page not available')),
                          );
                        }
                      },
                      child: Container(
                        width: 120,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: categories[index]['color']!,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Image.asset(
                              categories[index]['image']!,
                            ),
                            Text(
                              categories[index]['title'] ?? 'Unknown',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Text(
                              categories[index]['subtitle'] ?? 'No items',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
              const Text(
                'Popular Deals',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              CategoriesItemWidget(products: products),
            ],
          ),
        ),
      ),
    );
  }
}
