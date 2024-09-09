import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTile({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      shadowColor: theme.primary,
      child: ListTile(
        leading: Icon(
          menuItem.icon,
          color: theme.primary,
        ),
        title: Text(menuItem.title),
        subtitle: Text(menuItem.subTitle),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: theme.primary,
        ),
        onTap: () {
          // Navigator.of(context).push(
          //   CupertinoPageRoute(
          //     builder: (context) => const ButtonsScreen(),
          //   ),
          // );

          // Navigator.pushNamed(context, menuItem.link);

          context.push(menuItem.link);

          // context.pushNamed(name)
        },
        splashColor: const Color.fromARGB(255, 138, 193, 238),
      ),
    );
  }
}
