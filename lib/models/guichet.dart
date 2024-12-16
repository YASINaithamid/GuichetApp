import 'dart:convert';

class Guichet {
  String icon;
  String name;
  String role;
  String status;
  bool isFavorite;

  Guichet({
    required this.icon,
    required this.name,
    required this.role,
    required this.status,
    this.isFavorite = false,
  });

  factory Guichet.fromJson(Map<String, dynamic> json) {
    return Guichet(
      icon: json['icon'],
      name: json['name'],
      role: json['role'],
      status: json['status'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'name': name,
      'role': role,
      'status': status,
      'isFavorite': isFavorite,
    };
  }
}
