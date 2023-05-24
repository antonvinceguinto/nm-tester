part of 'acceptance_status_cubit.dart';

class AcceptanceStatusState extends Equatable {
  const AcceptanceStatusState({
    this.status = GenericRequestStatusEnum.initial,
    this.errorMessage,
    this.recentResponses,
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final List<String>? recentResponses;

  // copywith method
  AcceptanceStatusState copyWith({
    GenericRequestStatusEnum? status,
    String? errorMessage,
    List<String>? recentResponses,
  }) {
    return AcceptanceStatusState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      recentResponses: recentResponses ?? this.recentResponses,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        recentResponses ?? [],
      ];
}
