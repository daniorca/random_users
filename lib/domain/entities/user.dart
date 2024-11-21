import 'package:random_users/domain/entities/address.dart';
import 'package:random_users/domain/entities/company.dart';

class User {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;
  String? imageUrl;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company,
      this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"] ?? '',
        username: json["username"],
        email: json["email"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
      );
}
