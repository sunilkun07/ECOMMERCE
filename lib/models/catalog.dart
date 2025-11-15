class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}

final products = {
  "item1": Item(
    "1",
    "Laptop",
    "A high performance laptop",
    999.99,
    "Silver",
    "https://cdn.gadgetbytenepal.com/wp-content/uploads/2024/04/Lenovo-IdeaPad-1-2022-Intel-Celeron-N4020.jpg",
  ),
  "item2": Item(
    "2",
    "Smartphone",
    "A latest model smartphone",
    699.99,
    "Black",
    "https://www.samsungplaza.com.np/public/files/AAB649B15E3BBCA-002-galaxy-zfold7-blueshadow-openback115.jpg",
  ),
  "item3": Item(
    "3",
    "Headphones",
    "Noise cancelling headphones",
    199.99,
    "White",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb1loMLH2jqh_gck5t-6Wl3940g7Lqgf8-lg&s",
  ),
  "item4": Item(
    "4",
    "Smartwatch",
    "A smartwatch with various features",
    299.99,
    "Gray",
    "https://images-cdn.ubuy.co.in/653dca4638b3b6351c03b03e-smart-watch-for-android-and-iphone.jpg",
  ),
  "item5": Item(
    "5",
    "Camera",
    "A digital camera for photography",
    499.99,
    "Black",
    "https://i.pinimg.com/736x/e7/5d/db/e75ddbda351d44e24b6b8099fa200aad.jpg",
  ),
};
