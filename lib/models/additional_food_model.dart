class AdditionalFood {
  String imageUrl;
  String name;
  String description;
  int price;

  AdditionalFood({
    this.imageUrl,
    this.name,
    this.description,
    this.price,
  });
}
final List<AdditionalFood> additionalFoods = [
  AdditionalFood(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Дерзкая Марго',
    description: "Lorem Ipsum is simply dummy text",
    price: 300,
  ),
  AdditionalFood(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Горячий парень',
    description: "Lorem Ipsum is simply dummy text",
    price: 300,
  ),
  AdditionalFood(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Вкусняшка Миа',
    description: "Lorem Ipsum is simply dummy text",
    price: 300,
  ),
  AdditionalFood(
    imageUrl: 'https://www.kbc.co.ke/wp-content/uploads/2019/07/food-cover.jpg',
    name: 'Сытый Питт',
    description: "Lorem Ipsum is simply dummy text",
    price: 300,
  ),
];