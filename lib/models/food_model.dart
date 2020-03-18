class Food {
  String imageUrl;
  String name;
  String description;
  double overviewScore;
  int timeFrom;
  int timeTo;
  int overviewAmount;
  int price;

  Food({
    this.imageUrl,
    this.name,
    this.description,
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
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ... It is a long established fact that a reader will be distracted by the readable content ... of Lorem Ipsum available, but the majority have suffered alteration in some form",
    overviewScore: 4.5,
    timeFrom: 25,
    timeTo: 30,
    overviewAmount: 100,
    price: 300,
  ),
  Food(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Горячий парень',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ... It is a long established fact that a reader will be distracted by the readable content ... of Lorem Ipsum available, but the majority have suffered alteration in some form",
    overviewScore: 4.5,
    timeFrom: 25,
    timeTo: 30,
    overviewAmount: 100,
    price: 300,
  ),
  Food(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Вкусняшка Миа',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ... It is a long established fact that a reader will be distracted by the readable content ... of Lorem Ipsum available, but the majority have suffered alteration in some form",
    overviewScore: 4.5,
    timeFrom: 25,
    timeTo: 30,
    overviewAmount: 100,
    price: 300,
  ),
  Food(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Сытый Питт',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ... It is a long established fact that a reader will be distracted by the readable content ... of Lorem Ipsum available, but the majority have suffered alteration in some form",
    overviewScore: 4.5,
    timeFrom: 25,
    timeTo: 30,
    overviewAmount: 100,
    price: 300,
  ),
];