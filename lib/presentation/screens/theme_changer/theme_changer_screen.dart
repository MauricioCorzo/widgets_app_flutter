import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = "theme_changer_screen";

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedThemeColorIndex = ref.watch(selectedThemeColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colorList[index];
        return RadioListTile(
            title: Text(
              "Este Color",
              style: TextStyle(color: color),
            ),
            subtitle: Text("${color.value}"),
            activeColor: color,
            value: index,
            groupValue: selectedThemeColorIndex,
            onChanged: (value) {
              ref.read(selectedThemeColorProvider.notifier).state = value!;
            });
      },
    );
  }
}
