import 'package:agro_app/constant/image_constant.dart';
import 'package:agro_app/model/cart_model.dart';
import 'package:agro_app/provider/card_provider.dart';
import 'package:agro_app/screen/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final bool showDiscount;
  final bool soButton;
  final String image;

  const ProductCard(
      {Key? key,
      required this.name,
      required this.price,
      required this.showDiscount,
      required this.soButton,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(builder: (context, cardProvider, child) {
      int quantity = cardProvider.getQuantity(name);
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: Colors.black26),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.asset(image),
                  const Positioned(
                    top: 10,
                    left: 10,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  if (showDiscount)
                    Positioned(
                      top: 20,
                      right: 2,
                      child: Transform.rotate(
                        angle: 0.6,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4.7,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            "5% OFF",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                const Text("(243)"),
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            soButton
                ? ElevatedButton(
                    onPressed: () {
                      final cartItem =
                          CartItem(image: image, name: name, price: price);
                      Provider.of<CardProvider>(context, listen: false)
                          .addItem(cartItem);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShopingCartScreen()));
                    },
                    child: Text('Add to cart'))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12)),
                        child: GestureDetector(
                          onTap: () {
                            cardProvider.decrement(name);
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$quantity',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12)),
                        child: GestureDetector(
                          onTap: () {
                            cardProvider.increment(name);
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
          ],
        ),
      );
    });
  }
}
