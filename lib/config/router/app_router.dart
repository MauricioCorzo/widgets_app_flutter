import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'
    show CustomTransitionPage, GoRoute, GoRouter;
import 'package:widgets_app/presentation/screens/animated/animated_screen.dart';
import 'package:widgets_app/presentation/screens/screens.dart'
    show
        AppTutorialScreen,
        ButtonsScreen,
        CardsScreen,
        HomeScreen,
        ProgressScreen,
        SnackBarScreen,
        UiControlsScreen;

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      pageBuilder: (context, state) {
        //Custom page transition example
        return cupertinolikePageTransition(child: const CardsScreen());
      },
      // builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      pageBuilder: (context, state) {
        //Custom page transition example
        return cupertinolikePageTransition(child: const ProgressScreen());
      },
      // builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackBarScreen.name,
      pageBuilder: (context, state) {
        //Custom page transition example
        return cupertinolikePageTransition(child: const SnackBarScreen());
      },
      // builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      pageBuilder: (context, state) {
        //Custom page transition example
        return cupertinolikePageTransition(child: const AnimatedScreen());
      },
      // builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      pageBuilder: (context, state) {
        //Custom page transition example
        return cupertinolikePageTransition(child: const UiControlsScreen());
      },
      // builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name,
      pageBuilder: (context, state) {
        //Custom page transition example
        return cupertinolikePageTransition(child: const AppTutorialScreen());
      },
      // builder: (context, state) => const CardsScreen(),
    ),
  ],
);

CustomTransitionPage<dynamic> cupertinolikePageTransition(
    {required Widget child}) {
  return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
