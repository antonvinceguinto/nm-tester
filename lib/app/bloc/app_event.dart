part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

// class AppUserChanged extends AppEvent {
//   const AppUserChanged({required this.status});

//   final AppStatus status;

//   @override
//   List<Object> get props => [status];
// }

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested(
    this.status,
    this.sharedPrefs,
  );

  final AppStatus status;
  final SharedPrefs sharedPrefs;

  @override
  List<Object> get props => [status, sharedPrefs];
}
