class Cart {
  int? id;
  int? userId;
  DateTime? date;
  List? products;
  Cart({
    this.id,
    this.userId,
    this.date,
    this.products,
  });
  factory Cart.fromJson(Map<String, dynamic> obj) {
    return Cart(
      id: obj['id'],
      userId: obj['userId'],
      date: obj['date'],
      products: obj['products'],
    );
  }
}