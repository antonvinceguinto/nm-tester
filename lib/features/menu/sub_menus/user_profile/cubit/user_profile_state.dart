import 'package:api_service/api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

class UPState extends Equatable {
  const UPState({
    this.status = GenericRequestStatusEnum.loading,
    this.passwordResetModel = PasswordResetModel.empty,
    this.errorMessage,
  });

  final GenericRequestStatusEnum status;
  final PasswordResetModel passwordResetModel;
  final String? errorMessage;

  UPState copyWith({
    GenericRequestStatusEnum? status,
    PasswordResetModel? passwordResetModel,
    String? errorMessage,
  }) {
    return UPState(
      status: status ?? this.status,
      passwordResetModel: passwordResetModel ?? this.passwordResetModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        passwordResetModel,
        errorMessage ?? '',
      ];
}
