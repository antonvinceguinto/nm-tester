part of 'main_menu_bloc.dart';

class MainMenuState extends Equatable {
  const MainMenuState({
    this.status = GenericRequestStatusEnum.loading,
    this.errorMessage,
    this.userPermissions = UserPermissionsModel.empty,
    this.recordCounts = const {},
    this.unreadMessagesCount = 0,
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final UserPermissionsModel userPermissions;
  final Map<String, int> recordCounts;
  final int unreadMessagesCount;

  Permissions get subPermissions =>
      userPermissions.subscriptions!.first.permissions!;

  bool get isAdmin => userPermissions.isAdmin;
  bool get isJobAddEditEnabled => userPermissions.isJobAddEditEnabled;
  bool get isJobAccessEnabled => userPermissions.isJobAccessEnabled;
  bool get isBookingAddEditEnabled => userPermissions.isBookingAddEditEnabled;
  bool get isBookingAccessEnabled => userPermissions.isBookingAccessEnabled;
  bool get isContactAccessEnabled => userPermissions.isContactAccessEnabled;
  bool get isContactAddEditEnabled => userPermissions.isContactAddEditEnabled;
  bool get isUserAccessEnabled => userPermissions.isUserAccessEnabled;
  bool get isChargeDetailsVisible =>
      subPermissions.ChargePricingDetailsVisible ?? false;
  bool get isJobChargesEnabled => userPermissions.jobChargesEnabled;
  bool get isChargeAccessEnabled => userPermissions.isChargeAccessEnabled;
  bool get isChargeAddEditEnabled => userPermissions.isChargeAddEditEnabled;
  bool get jobTemplatesEnabled => userPermissions.jobTemplatesEnabled;
  bool get isUnbilledChargeTotalsVisible =>
      subPermissions.UnbilledChargeTotalsVisible ?? false;

  MainMenuState copyWith({
    GenericRequestStatusEnum? status,
    String? errorMessage,
    UserPermissionsModel? userPermissions,
    Map<String, int>? recordCounts,
    int? unreadMessagesCount,
  }) {
    return MainMenuState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      userPermissions: userPermissions ?? this.userPermissions,
      recordCounts: recordCounts ?? this.recordCounts,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
    );
  }

  @override
  List<Object> get props => [
        status,
        userPermissions,
        recordCounts,
        errorMessage ?? '',
        unreadMessagesCount,
      ];
}
