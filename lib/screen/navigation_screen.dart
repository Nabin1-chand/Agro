import 'package:agro_app/screen/fav_screen.dart';
import 'package:agro_app/screen/home_screen.dart';
import 'package:agro_app/screen/shopping_cart_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  List<Widget> _selectedScreen = [
    HomeScreen(),
    ShopingCartScreen(),
    FavouriteScreen(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 10,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        elevation: 3,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Make it circular
                  color: Colors.blue, // Set background color
                ),
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            label: '',
          ),
        ],
      ),
      body: Center(
        child: _selectedScreen.elementAt(_selectedIndex),
      ),
    );
  }
}
