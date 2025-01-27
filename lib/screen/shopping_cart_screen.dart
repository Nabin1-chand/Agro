import 'package:agro_app/provider/card_provider.dart';
import 'package:agro_app/screen/widget/shopping_cart_widget.dart';
import 'package:agro_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopingCartScreen extends StatelessWidget {
  const ShopingCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CardProvider>(context).cartItems;
    final subtotal = Provider.of<CardProvider>(context).subTotal;
    final tax = Provider.of<CardProvider>(context).tax;
    final total = Provider.of<CardProvider>(context).total;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shopping Cart',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            Spacer(),
            Icon(Icons.more_vert),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ShoppingCartItemWidget(
                    index: index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      Divider(
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\$${subtotal.toStringAsFixed(2)}"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("\$${tax.toStringAsFixed(2)}"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\$${subtotal.toStringAsFixed(2)}"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("\$${tax.toStringAsFixed(2)}"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 200, 233, 201)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Apply Promotion Code'),
                  Text(
                    '2 Proms',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                text: 'CHECKOUT',
                onPressed: () {},
                width: MediaQuery.of(context).size.width)
          ],
        ),
      ),
    );
  }
}
