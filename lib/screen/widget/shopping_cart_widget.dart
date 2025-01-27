import 'package:agro_app/provider/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartItemWidget extends StatelessWidget {
  final int index;
  const ShoppingCartItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CardProvider>(context).cartItems[index];

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
          child: Image.asset(cartItems.image),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItems.name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const Text(
              'Fruit',
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "\$${cartItems.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  "\$6.0",
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: InkWell(
                      onTap: () {
                        Provider.of<CardProvider>(context, listen: false)
                            .decrementItemCart(index);
                      },
                      child: const Icon(Icons.remove)),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  cartItems.quantity.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: InkWell(
                      onTap: () {
                        Provider.of<CardProvider>(context, listen: false)
                            .incrementItemCart(index);
                      },
                      child: const Icon(Icons.add)),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
