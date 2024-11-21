import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_users/config/router/app_router.dart';
import 'package:random_users/presentation/providers/user_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => UserProvider()),
  //     ],
  //     child: const MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: UsersList(),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
