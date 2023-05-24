part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  temporarilyAuthenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({required this.status});

  const AppState.authenticated() : this._(status: AppStatus.authenticated);

  const AppState.temporarilyAuthenticated()
      : this._(status: AppStatus.temporarilyAuthenticated);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;

  @override
  List<Object> get props => [status];
}
