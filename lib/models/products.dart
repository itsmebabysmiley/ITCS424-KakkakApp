class Product {
  final String image, name, city;
  final double price;
  final int id;
  final String description;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.city,
    required this.price,
    this.description = '',
  });

   @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Product && other.id == id;

}

List<Product> recommendProducts = [
  Product(
      id: 1,
      image: "assets/images/candy_1.png",
      name: "Cerry Candy",
      city: "Bangkok",
      price: 10.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus."
      ),
  Product(
      id: 2,
      image: "assets/images/candy_2.png",
      name: "Vinila double",
      city: "Bangkok",
      price: 20.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus."),
  Product(
      id: 3,
      image: "assets/images/capcake.png",
      name: "Capcake",
      city: "Bangkok",
      price: 30.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus."),
];

List<Product> maylikeProducts = [
  Product(
      id: 1,
      image: "assets/images/candy_1.png",
      name: "Cerry Candy",
      city: "Bangkok",
      price: 10.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus."),
  Product(
      id: 2,
      image: "assets/images/candy_2.png",
      name: "Vinila double",
      city: "Bangkok",
      price: 20.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus."),
  Product(
      id: 3,
      image: "assets/images/capcake.png",
      name: "Capcake",
      city: "Bangkok",
      price: 30.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus."),
  Product(
      id: 4,
      image: "assets/images/icecream.png",
      name: "ice-cream",
      city: "Bangkok",
      price: 10.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus."),
  Product(
      id: 5,
      image: "assets/images/rollypop.png",
      name: "Green rollypop yummy yummy jymmy youasdfasdfasdfasdfewrqwvxvse asdf as",
      city: "Bangkok",
      price: 20.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus."),
  Product(
      id: 6,
      image: "assets/images/rollypop2.png",
      name: "rollypop",
      city: "Bangkok",
      price: 30.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam convallis id lacus et lacinia. In dapibus, metus id dignissim varius, est tellus feugiat justo, et interdum neque dolor in massa. Vestibulum sit amet suscipit felis, sed molestie nulla. Morbi eu gravida ante, aliquet laoreet nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras congue urna lacus, vitae scelerisque magna placerat at. Morbi eget risus vel nulla cursus tempus."),
];
