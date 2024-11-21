import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_users/domain/entities/user.dart';

class UserProvider extends ChangeNotifier {
  Future<List<User>?> getUsers() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> usersJson = json.decode(response.body);

      return usersJson.map((json) {
        final user = User.fromJson(json);

        int randomNumber = Random().nextInt(70);
        user.imageUrl = 'https://i.pravatar.cc/300?img=$randomNumber';

        return user;
      }).toList();
    } else {
      return null;
    }
  }
}
