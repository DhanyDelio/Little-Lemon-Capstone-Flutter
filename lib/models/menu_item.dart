class MenuItem {
  final int id;
  final String name;
  final String description;
  final String price;
  final String image;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] ?? '',
      name: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'].toString(),
      image: json['image'] ?? '',
    );
  }
}
