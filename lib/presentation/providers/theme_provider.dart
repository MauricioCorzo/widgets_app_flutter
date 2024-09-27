import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

// cannot be modified
final colorListProvider = Provider((ref) => colorList);

final selectedThemeColorProvider = StateProvider((ref) => 0);
