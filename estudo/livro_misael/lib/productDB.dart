class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;
  var rating;

  static final columns = ["id", "name", "description", "price", "image"];

  Product(this.id, this.name, this.description, this.price, this.image,
      this.rating);

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(data['id'], data['name'], data['description'], data['proce'],
        data['image'], data['rating']);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "rating": rating
      };
}
