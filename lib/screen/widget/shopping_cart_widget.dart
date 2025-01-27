import 'package:agro_app/provider/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartItemWidget extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const ShoppingCartItemWidget({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: const Color.fromARGB(179, 124, 121, 121),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(image),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              'Fruit',
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "\$6.0",
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '3',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
