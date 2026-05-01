import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mundo_mobile/features/ai/ai_screen.dart';
import 'package:mundo_mobile/features/booking/booking_screen.dart';
import 'package:mundo_mobile/features/profile/profile_screen.dart';
import 'package:mundo_mobile/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/search/search_screen.dart';
import '../../main_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/splash',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MundoSplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      // GoRoute(
      //   path: "/ai",
      //   // parentNavigatorKey: _rootNavigatorKey,
      //   builder: (_, _) => const AiScreen(),
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: '/', builder: (context, state) => const HomeScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/search', builder: (context, state) => const SearchScreen())],
          ),
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: '/ai',
          //       parentNavigatorKey: _rootNavigatorKey,
          //       builder: (context, state) => const AiScreen(),
          //     ),
          //   ],
          // ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/ai', builder: (context, state) => const AiScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/booking', builder: (context, state) => const BookingScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen())],
          ),
        ],
      ),
    ],
  );
}
