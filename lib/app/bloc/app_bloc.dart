import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nextminute/core/utils/enums.dart';

part 'app_event.dart';
part 'app_state.dart';

AppState authStatus(SharedPrefs sharedPrefs) {
  switch (sharedPrefs.authStatus) {
    case 'authenticated':
      return const AppState.authenticated();
    case 'temporarilyAuthenticated':
      return const AppState.temporarilyAuthenticated();
    case 'unauthenticated':
      return const AppState.unauthenticated();
    default:
      return const AppState.unauthenticated();
  }
}

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required SharedPrefs sharedPrefs})
      : _sharedPrefs = sharedPrefs,
        super(authStatus(sharedPrefs)) {
    // on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
  }

  final SharedPrefs _sharedPrefs;

  Future<void> _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    if (event.status == AppStatus.temporarilyAuthenticated) {
      _sharedPrefs.authStatus = AppStatus.temporarilyAuthenticated.name;
      emit(const AppState.temporarilyAuthenticated());
    }

    if (event.status == AppStatus.unauthenticated) {
      await _sharedPrefs.clearSharedPrefs();

      // ---- Hive ----
      await Hive.box<JobsListModel>(BoxType.boxJobsList.name()).clear();

      emit(const AppState.unauthenticated());
    }
  }
}
