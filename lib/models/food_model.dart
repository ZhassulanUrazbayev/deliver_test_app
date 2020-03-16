class Food {
  String imageUrl;
  String name;
  double overviewScore;
  int timeFrom;
  int timeTo;
  int overviewAmount;
  int price;

  Food({
    this.imageUrl,
    this.name,
    this.overviewScore,
    this.timeFrom,
    this.timeTo,
    this.overviewAmount,
    this.price,
  });
}

final List<Food> foods = [
  Food(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Дерзкая Марго',
    overviewScore: 4.5,
    timeFrom: 25,
    timeTo: 30,
    overviewAmount: 100,
    price: 300,
  ),
  Food(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Горячий парень',
    overviewScore: 4.5,
    timeFrom: 25,
    timeTo: 30,
    overviewAmount: 100,
    price: 300,
  ),
  Food(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Вкусняшка Миа',
    overviewScore: 4.5,
    timeFrom: 25,
    timeTo: 30,
    overviewAmount: 100,
    price: 300,
  ),
  Food(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Сытый Питт',
    overviewScore: 4.5,
    timeFrom: 25,
    timeTo: 30,
    overviewAmount: 100,
    price: 300,
  ),
];