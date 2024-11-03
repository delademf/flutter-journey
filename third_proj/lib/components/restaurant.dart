class Restaurant {
  final String name;
  final String image;
  final int id;

  Restaurant({required this.name, required this.image, required this.id});

  factory Restaurant.fromJson(Map<String,dynamic> json){
    return Restaurant(
      name:
      json['name'] ?? 'Unknown',
      image: json['image'] ?? '',
      id: json['id'] ?? '',
    );
  } 
}