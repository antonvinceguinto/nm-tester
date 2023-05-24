import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nextminute/core/utils/enums.dart';

part 'tab_state.dart';

class IndexCubit extends Cubit<IndexState> {
  IndexCubit() : super(const IndexState(0));

  void updateIndex(int index) => emit(state.copyWith(currentIndex: index));
}

class TabCubit extends Cubit<TabState> {
  TabCubit({required SharedPrefs sharedPrefs})
      : _sharedPrefs = sharedPrefs,
        super(const TabState());

  final SharedPrefs _sharedPrefs;

  void updateMenu() {
    HapticFeedback.lightImpact();
    _sharedPrefs.isNewMenu = !_sharedPrefs.isNewMenu;
    emit(state.copyWith(isNew: !state.isNew));
  }

  bool get isDarkMode =>
      Hive.box<bool>(BoxType.boxDarkMode.name()).get(BoxType.darkMode.name()) ??
      false;

  void toggleDarkMode() {
    final darkModeBox = Hive.box<bool>(BoxType.boxDarkMode.name());

    final isDarkMode = darkModeBox.get(BoxType.darkMode.name());

    if (isDarkMode == null) {
      darkModeBox.put(BoxType.darkMode.name(), true);
      return;
    }

    Hive.box<bool>(BoxType.boxDarkMode.name())
        .put(BoxType.darkMode.name(), !isDarkMode);
  }
}
