import 'package:go_router/go_router.dart';
import 'package:nssf_interview/features/home/screens/home_page.dart';

// final GlobalKey<NavigatorState> _shellNavigator =
//     GlobalKey(debugLabel: 'shell');

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
  initialLocation: '/',
);
