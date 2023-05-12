import 'package:flutter/material.dart';
import 'package:task/models/food.dart';
import 'package:task/screens/cart.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final List<Food> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo'), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartScreen(list: list),
              ));
            },
            icon: const Icon(Icons.shopping_cart_outlined))
      ]),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: foodList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  list.add(foodList[index]);
                  print(list.length);
                },
                child: FoodItemWidget(
                  imagePath: foodList[index].imagePath,
                  name: foodList[index].name,
                  price: foodList[index].price,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//food item widget
class FoodItemWidget extends StatelessWidget {
  FoodItemWidget(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.price});
  String imagePath;
  String name;
  int price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 8, left: 8),
      child: Center(
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      CircleAvatar(radius: 50, child: Image.asset(imagePath)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$price rs',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
