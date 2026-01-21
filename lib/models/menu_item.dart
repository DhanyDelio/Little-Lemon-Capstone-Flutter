class MenuItem {
  final int id;
  final String title;
  final String category;
  final String description;
  final String price;
  final String image;

  MenuItem({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      price: json['price'].toString(),
      image: json['image'] ?? 0.toDouble(),
    );
  }
}
