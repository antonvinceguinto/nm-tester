part of 'expired_subscription_bloc.dart';

class ExpiredSubscriptionState extends Equatable {
  const ExpiredSubscriptionState({
    this.status = GenericRequestStatusEnum.loading,
    this.userSubscription = const [],
  });

  final GenericRequestStatusEnum status;
  final List<UserSubscription> userSubscription;

  ExpiredSubscriptionState copyWith({
    GenericRequestStatusEnum? status,
    List<UserSubscription>? userSubscription,
  }) {
    return ExpiredSubscriptionState(
      status: status ?? this.status,
      userSubscription: userSubscription ?? this.userSubscription,
    );
  }

  @override
  List<Object> get props => [
        status,
        userSubscription,
      ];
}
