import 'package:flutter/material.dart';
import 'package:flutter_clear_architecture/app/config/router/my_routes.dart';
import 'package:flutter_clear_architecture/app/modules/home/presentation/pages/home_detail_screen.dart';
import 'package:flutter_clear_architecture/app/modules/home/presentation/pages/home_screen.dart';
import 'package:flutter_clear_architecture/app/modules/profile/presentation/pages/profile_screen.dart';
import 'package:go_router/go_router.dart';

import '../../modules/main/presentation/pages/main_screen.dart';

class MyRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static router() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: '/home',
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                    name: MyRoutes.home,
                    path: '/home',
                    builder: (context, state) => const HomeScreen(),
                    routes: [
                      GoRoute(
                          parentNavigatorKey: rootNavigatorKey,
                          name: MyRoutes.homedetail,
                          path: 'home-detail/:nilai',
                          builder: (context, state) {
                            int nilai =
                                int.parse("${state.pathParameters['nilai']}");
                            return HomeDetail(
                              nilai: nilai,
                            );
                          })
                    ]),
              ],
            ),
            StatefulShellBranch(routes: <RouteBase>[
              GoRoute(
                name: MyRoutes.profile,
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ]),
            StatefulShellBranch(routes: <RouteBase>[
              GoRoute(
                name: MyRoutes.profile,
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
              
            ])
          ],
        ),
      ],
    );
  }
}
