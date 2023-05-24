part of 'version_history_bloc.dart';

class VersionHistoryState extends Equatable {
  const VersionHistoryState({
    this.status = GenericRequestStatusEnum.initial,
    this.versionHistory,
  });

  final GenericRequestStatusEnum status;
  final List<VersionHistoryModel>? versionHistory;

  VersionHistoryState copyWith({
    GenericRequestStatusEnum? status,
    List<VersionHistoryModel>? versionHistory,
  }) {
    return VersionHistoryState(
      status: status ?? this.status,
      versionHistory: versionHistory ?? this.versionHistory,
    );
  }

  @override
  List<Object> get props => [
        status,
        versionHistory ?? [],
      ];
}
