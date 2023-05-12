// ignore_for_file: public_member_api_docs, sort_constructors_first
class Food {
  String name;
  String imagePath;
  int price;
  Food({
    required this.name,
    required this.imagePath,
    required this.price,
  });
}

List<Food> foodList = [
  Food(name: 'Burger', imagePath: 'assets/images/burger1.png', price: 200),
  Food(name: 'Cake', imagePath: 'assets/images/cake1.png', price: 500),
  Food(name: 'Fries', imagePath: 'assets/images/fries1.png', price: 100),
  Food(name: 'Pasta', imagePath: 'assets/images/pasta1.png', price: 300),
  Food(name: 'Pizza', imagePath: 'assets/images/pizza1.png', price: 1000),
];
