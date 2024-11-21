import 'package:go_router/go_router.dart';
import 'package:random_users/domain/entities/user.dart';
import 'package:random_users/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const UsersList(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final user = state.extra as User;
        return UserDetails(user: user);
      },
    ),
  ],
);
