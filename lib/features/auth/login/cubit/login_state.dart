import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = GenericRequestStatusEnum.initial,
    this.message = '',
  });

  final GenericRequestStatusEnum status;
  final String message;

  LoginState copyWith({
    GenericRequestStatusEnum? status,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, message];
}
