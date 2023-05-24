part of 'tab_cubit.dart';

class IndexState extends Equatable {
  const IndexState(this.currentIndex);

  final int currentIndex;

  IndexState copyWith({
    int? currentIndex,
  }) =>
      IndexState(
        currentIndex ?? this.currentIndex,
      );

  @override
  List<Object> get props => [currentIndex];
}

class TabState extends Equatable {
  const TabState({
    this.isNew = false,
  });

  final bool isNew;

  TabState copyWith({
    bool? isNew,
  }) =>
      TabState(
        isNew: isNew ?? this.isNew,
      );

  @override
  List<Object> get props => [
        isNew,
      ];
}
