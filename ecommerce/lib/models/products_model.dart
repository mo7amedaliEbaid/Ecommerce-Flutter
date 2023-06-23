class Product {
   int? id;
   String? title;
   double? price;
   String? description;
   String? image;
   Map? rating;
   String? category;
   int quantity;

  Product({
      this.id,
     this.title,
     this.price,
      this.description,
       this.image,
    this.rating,
     this.category,
      this.quantity=0,
  });


  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"]??null,
    title: json["title"]??null,
    price: json["price"].toDouble()??null,
    description: json["description"]??null,
    image: json["image"]??null,
   // quantity: json["quantity"]??null,
    rating: json['rating']??null,
    category: json['category']??null,
  );
   Map<String, dynamic> toJson() => {
     "id": id??0,
     "title": title??"",
     "price": price??0,
     "description": description??"",
     "quantity": quantity??"",
    // "category": categoryValues.reverse[category],
     "image": image??"",
   //  "rating": rating.toJson(),
   };
   factory Product.fromItem(Product item, int quantity) {
     return Product(
       id: item.id,
       title: item.title,
       description: item.description,
       price: item.price,
       category: item.category,
       image: item.image,
   //    rating: item.rating,
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
     //  rating: item.rating,
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
  //     rating: item.rating,
       quantity: quantity,
     );
   }

  static List<Product> productsFromSnapshot(List newSnapshot) {
    return newSnapshot.map((json) {
      return Product.fromJson(json);
    }).toList();
  }


}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}