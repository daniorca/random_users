import 'package:flutter/material.dart';
import 'package:random_users/domain/entities/user.dart';

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(user.name!),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Hero(
                  tag: user.id!,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.imageUrl!),
                    radius: 50,
                  ),
                ),
              ),
            ),
            UserData(value: user.name!, label: 'Name'),
            UserData(value: user.username!, label: 'UserName'),
            UserData(value: user.email!, label: 'Email'),
            UserData(value: user.phone!, label: 'Phone'),
            UserData(value: user.website!, label: 'Website'),
            UserData(value: user.company!.name!, label: 'Company'),
            UserData(value: user.address!.street!, label: 'Address'),
          ],
        ));
  }
}

class UserData extends StatelessWidget {
  final String value;
  final String label;

  const UserData({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
