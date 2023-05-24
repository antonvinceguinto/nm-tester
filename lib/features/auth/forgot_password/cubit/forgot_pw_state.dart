import 'package:api_service/api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

class FPWState extends Equatable {
  const FPWState({
    required this.status,
    this.passwordResetModel = PasswordResetModel.empty,
    this.error = '',
  });

  final GenericRequestStatusEnum status;
  final PasswordResetModel passwordResetModel;
  final String error;

  FPWState copyWith({
    GenericRequestStatusEnum? status,
    PasswordResetModel? passwordResetModel,
    String? error,
  }) {
    return FPWState(
      status: status ?? this.status,
      passwordResetModel: passwordResetModel ?? this.passwordResetModel,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, passwordResetModel, error];
}
