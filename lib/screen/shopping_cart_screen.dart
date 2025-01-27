import 'package:agro_app/provider/card_provider.dart';
import 'package:agro_app/screen/widget/shopping_cart_widget.dart';
import 'package:agro_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopingCartScreen extends StatelessWidget {
  // final String name;
  // final double price;
  // final String image;
  const ShopingCartScreen({
    super.key,
    // required this.name,
    // required this.price,
    // required this.image
  });

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CardProvider>(context).cartItems;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        title: Row(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ShoppingCartItemWidget(
                    name: cartItems[index].name,
                    price: cartItems[index].price,
                    image: cartItems[index].image,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                },
              ),
              SizedBox(
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
                        Text('Subtotal'),
                        Text('TAX(2%)'),
                        Text(
                          'Total',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$ 4.0",
                        ),
                        Text(
                          "\$ 4.0",
                        ),
                        Text(
                          "\$ 4.0",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 200, 233, 201)),
                child: Row(
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
              SizedBox(
                height: 10,
              ),
              CustomButton(
                  text: 'CHECKOUT',
                  onPressed: () {},
                  width: MediaQuery.of(context).size.width)
            ],
          ),
        ),
      ),
    );
  }
}
