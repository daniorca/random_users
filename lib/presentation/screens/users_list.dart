import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:random_users/domain/entities/user.dart';
import 'package:random_users/presentation/providers/user_provider.dart';
// import 'package:random_users/presentation/screens/user_details.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: FutureBuilder(
          future: userProvider.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                final users = snapshot.data as List<User>;

                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];

                      return ListTile(
                          leading: Hero(
                            tag: user.id!,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.imageUrl!),
                            ),
                          ),
                          title: Text(user.name!),
                          subtitle: Text(user.email!),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                          onTap: () {
                            // Navigator.of(context).pushNamed('/details');

                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => UserDetails(user: user),
                            //   ),
                            // );
                            context.push('/details', extra: user);
                          });
                    });
              } else {
                return const Center(
                  child: Text('No Users Found!'),
                );
              }
            }
          }),
    );
  }
}
