import 'package:agro_app/screen/widget/product_widget.dart';
import 'package:flutter/material.dart';

class CategoriesItemWidget extends StatelessWidget {
  const CategoriesItemWidget({
    super.key,
    required this.products,
  });

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
          childAspectRatio: 9 / 15),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          name: products[index]['name']!,
          price: products[index]['price']!,
          image: products[index]['image']!,
          showDiscount: products[index]['showDiscount'] ?? false,
          soButton: products[index]['soButton'] ?? false,
        );
      },
    );
  }
}
