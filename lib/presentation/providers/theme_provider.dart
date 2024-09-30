import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

// cannot be modified
final colorListProvider = Provider((ref) => colorList);

final selectedThemeColorProvider = StateProvider((ref) => 0);

//Object of type AppTheme

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  //state = new AppTheme() instance
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    //new state is a copy off last state with differents final properties
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
