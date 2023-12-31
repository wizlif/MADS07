import 'package:go_router/go_router.dart';
import 'package:nssf_interview/features/favorites/screens/favorites_map_page.dart';
import 'package:nssf_interview/features/favorites/screens/favorites_page.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';
import 'package:nssf_interview/features/home/screens/home_page.dart';

// final GlobalKey<NavigatorState> _shellNavigator =
//     GlobalKey(debugLabel: 'shell');

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesPage(),
    ),
    GoRoute(
      path: '/favorites-map',
      builder: (context, state) => FavoritesMapPage(
        favorites: state.extra! as List<GeoInfo>,
      ),
    ),
  ],
  initialLocation: '/',
);
