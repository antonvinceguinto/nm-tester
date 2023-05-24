part of 'main_menu_bloc.dart';

abstract class MainMenuEvent extends Equatable {
  const MainMenuEvent();

  @override
  List<Object> get props => [];
}

class MainMenuFetchEvent extends MainMenuEvent {
  const MainMenuFetchEvent();
}

class MainMenuRecordsFetchEvent extends MainMenuEvent {
  const MainMenuRecordsFetchEvent();
}

class FetchUnreadMessagesCountEvent extends MainMenuEvent {
  const FetchUnreadMessagesCountEvent();
}
