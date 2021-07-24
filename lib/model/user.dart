import 'package:google_maps_flutter/google_maps_flutter.dart';

class User {
  final String uid;
  final String name;
  final String phone;
  final String password;
  final String houseNo;
  final String address;
  final LatLng latLng;
  final double rating;
  final Object comments;
  final String role;

  User(
      {required this.uid,
      required this.name,
      required this.phone,
      required this.password,
      required this.houseNo,
      required this.address,
      required this.latLng,
      required this.rating,
      required this.comments, 
      required this.role});

  User.fromJson(Map<String, Object?> json, String reference)
      : this(
          uid: reference,
          name: json['name']! as String,
          phone: json['phone']! as String,
          password: json['password']! as String,
          houseNo: json['houseNo']! as String,
          address: json['address']! as String,
          latLng: json['latLng']! as LatLng,
          comments: json['comments']!,
          rating: (json['rating']! as num) as double,
          role: json['role']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
      'houseNo': houseNo,
      'address': address,
      'latLng': latLng,
      'rating': rating,
      'comments': comments, 
      'role': role,
    };
  }
}
