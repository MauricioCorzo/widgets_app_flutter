import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Counter",
    subTitle: "Counter + Riverpod",
    link: "/counter",
    icon: Icons.plus_one,
  ),
  MenuItem(
    title: "Buttons",
    subTitle: "Multiple flutter buttons",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: "Cards",
    subTitle: "Styled container",
    link: "/cards",
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: "Progress Indicators",
    subTitle: "Generales y controlados",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: "Snackbars and Dialogs",
    subTitle: "Info to user on screen",
    link: "/snackbars",
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: "Animated container",
    subTitle: "Statefull container animated widget",
    link: "/animated",
    icon: Icons.animation,
  ),
  MenuItem(
    title: "UI Controls + Tiles",
    subTitle: "Series of controls in Flutter",
    link: "/ui-controls",
    icon: Icons.checklist_sharp,
  ),
  MenuItem(
    title: "App introduction",
    subTitle: "Little tutorial about the app",
    link: "/tutorial",
    icon: Icons.video_collection_rounded,
  ),
  MenuItem(
    title: "Infinite Scroll",
    subTitle: "Infinite list and pull to refresh",
    link: "/infinite",
    icon: Icons.image_outlined,
  ),
  MenuItem(
    title: "Change Theme",
    subTitle: "Swich app theme",
    link: "/theme-changer",
    icon: Icons.color_lens_outlined,
  ),
];
