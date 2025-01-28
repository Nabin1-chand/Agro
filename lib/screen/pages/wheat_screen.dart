import 'package:agro_app/constant/image_constant.dart';
import 'package:flutter/material.dart';

class WheatScreen extends StatefulWidget {
  const WheatScreen({super.key});

  @override
  State<WheatScreen> createState() => _WheatScreenState();
}

class _WheatScreenState extends State<WheatScreen> {
  bool isLoading = false;
  final List<Map<String, dynamic>> fruitList = [
    {
      'name': 'Green Wheat',
      'image': ImageConstant.wheat1,
      'price': 21.0,
    },
    {
      'name': 'Fresh Wheat',
      'image': ImageConstant.wheat2,
      'price': 3.0,
    },
    {
      'name': 'Wheat',
      'image': ImageConstant.wheat3,
      'price': 9.0,
    },
  ];

  final searchController = TextEditingController();
  List<Map<String, dynamic>> filteredWheatList = [];
  void _filterFruits(String query) {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        filteredWheatList = fruitList
            .where((fish) =>
                fish['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredWheatList = fruitList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Fish',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            Spacer(),
            Icon(Icons.more_vert),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: _filterFruits,
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
            SizedBox(
              height: 25,
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AgroCollectionWidget(
                            name: filteredWheatList[index]['name']!,
                            image: filteredWheatList[index]['image'],
                            price: filteredWheatList[index]['price']!,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          );
                        },
                        itemCount: filteredWheatList.length),
                  )
          ],
        ),
      ),
    );
  }
}

class AgroCollectionWidget extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  const AgroCollectionWidget({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 160, 154, 154),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    height: 150,
                    image,
                    fit: BoxFit.contain,
                  )),
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                // Text("\$${subtotal.toStringAsFixed(2)}"),
                Row(
                  children: [
                    Text(price.toString()),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "\$2",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.discount),
                    Text(
                      'Dis.10% Off',
                      style: TextStyle(color: Colors.brown),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 45, 139, 48),
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        color: Colors.white,
                        Icons.shopping_cart,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
