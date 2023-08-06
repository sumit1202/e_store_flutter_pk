class CatalogModel {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  CatalogModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory CatalogModel.fromMap(Map<String, dynamic> map) {
    return CatalogModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? 0,
      color: map['color'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
