import 'package:flutter/material.dart';

import '../models/food.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.list});
  final List<Food> list;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalPrice = 0;
  int discoutedPrice = 0;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    for (var element in widget.list) {
      int elementPrice = element.price;
      totalPrice = totalPrice + elementPrice;
    }
    discoutedPrice = totalPrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(totalPrice);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (context, index) =>
                  CartItem(food: widget.list[index]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width - 15,
              height: 190,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Price :',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          totalPrice.toString(),
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 220,
                              height: 50,
                              child: TextField(
                                controller: textEditingController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    label: const Text('Coupon')),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (textEditingController.text ==
                                          'CouponOne' &&
                                      discoutedPrice > 500) {
                                    setState(() {
                                      discoutedPrice = discoutedPrice - 500;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Token Appllied!')));
                                  } else if (textEditingController.text ==
                                          'CouponTwo' &&
                                      discoutedPrice > 1000) {
                                    setState(() {
                                      discoutedPrice = discoutedPrice - 500;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Token Appllied!')));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Coupon Not Applied!')));
                                  }
                                },
                                child: const Text('Apply'))
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Discounted Price :',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          discoutedPrice.toString(),
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.food});
  final Food food;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 1,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 50, child: Image.asset(food.imagePath)),
                  Text(food.name),
                  Text('1x${food.price}'),
                  Text(food.price.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
