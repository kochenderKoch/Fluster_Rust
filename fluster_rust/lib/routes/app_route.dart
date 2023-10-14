import 'package:fluster_rust/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:fluster_rust/main/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey1 = GlobalKey<NavigatorState>();
final _sectionNavigatorKey4 = GlobalKey<NavigatorState>();

/// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  //errorBuilder: (context, state) => ErrorScreen(state.error),
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      //builder: (context, state) => const Placeholder(),
      redirect: (context, state) => '/home',
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const Placeholder(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey1,
          routes: <RouteBase>[
            GoRoute(
              redirect: handleAuthentication,
              path: '/home',
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey4,
          routes: <RouteBase>[
            GoRoute(
              redirect: handleAuthentication,
              path: '/settings',
              builder: (context, state) => const Placeholder(),
            ),
          ],
        ),
      ],
    ),
  ],
);

/// Check wether the User is logged in and authorized to see the screen
String? handleAuthentication(BuildContext context, GoRouterState state) {
  const isAuthenticated = false;
  debugPrint('Handle: $isAuthenticated');
  if (!isAuthenticated) {
    return null;
    //return '/login';
  }
}
