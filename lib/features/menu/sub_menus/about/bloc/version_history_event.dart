part of 'version_history_bloc.dart';

class VersionHistoryEvent extends Equatable {
  const VersionHistoryEvent({
    required this.versionId,
  });

  final String versionId;

  @override
  List<Object> get props => [
        versionId,
      ];
}
