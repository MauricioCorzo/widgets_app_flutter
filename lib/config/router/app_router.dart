import 'package:go_router/go_router.dart'
    show CustomTransitionPage, GoRoute, GoRouter;
import 'package:widgets_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);
