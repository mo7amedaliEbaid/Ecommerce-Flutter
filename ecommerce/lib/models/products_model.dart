class Product {
   int id;
   String title;
   double price;
   String description;
   String image;
   Map rating;
   String category;
   int quantity;

  Product({
    required  this.id,
    required this.title,
    required this.price,
    required  this.description,
    required   this.image,
    required this.rating,
    required this.category,
     this.quantity=0,
  });


  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    image: json["image"],
    rating: json['rating'],
    category: json['category'],
  );
   factory Product.fromItem(Product item, int quantity) {
     return Product(
       id: item.id,
       title: item.title,
       description: item.description,
       price: item.price,
       category: item.category,
       image: item.image,
       rating: item.rating,
       quantity: quantity,
     );
   }
   factory Product.fromDetails(Product item, int quantity) {
     return Product(
       id: item.id,
       title: item.title,
       description: item.description,
       price: item.price,
       category: item.category,
       image: item.image,
       rating: item.rating,
       quantity: quantity,
     );
   }
   factory Product.fromItemfav(Product item, int quantity) {
     return Product(
       id: item.id,
       title: item.title,
       description: item.description,
       price: item.price,
       category: item.category,
       image: item.image,
       rating: item.rating,
       quantity: quantity,
     );
   }

  static List<Product> productsFromSnapshot(List newSnapshot) {
    return newSnapshot.map((json) {
      return Product.fromJson(json);
    }).toList();
  }


}

