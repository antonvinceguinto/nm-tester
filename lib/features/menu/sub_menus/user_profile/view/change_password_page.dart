import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/user_profile/cubit/user_profile_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/user_profile/cubit/user_profile_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';

@RoutePage()
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserProfileCubit>(
      create: (context) => UserProfileCubit(
        authenticationRepository: context.read<AuthenticationRepositoryImpl>(),
      ),
      child: const ChangePasswordView(),
    );
  }
}

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const Key('__old_pw_field__'),
                controller: _oldPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  labelText: 'Old Password',
                ),
                validator: validator,
              ),
              const SizedBox(height: 8),
              TextFormField(
                key: const Key('__new_pw_field__'),
                controller: _newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  labelText: 'New Password',
                ),
                validator: validator,
              ),
              const SizedBox(height: 8),
              TextFormField(
                key: const Key('__confirm_pw_field__'),
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  labelText: 'Confirm Password',
                ),
                validator: validator,
              ),
              const SizedBox(height: 16),
              BlocConsumer<UserProfileCubit, UPState>(
                listener: (context, state) {
                  if (state.status == GenericRequestStatusEnum.success) {
                    showOkAlertDialog(
                      context: context,
                      title: state.passwordResetModel.MessageTitle ?? 'Success',
                      message: state.passwordResetModel.Message,
                    ).then(
                      (value) => {
                        Future.delayed(
                          const Duration(milliseconds: 200),
                          () => context.router.pop(),
                        ),
                      },
                    );
                  } else if (state.status == GenericRequestStatusEnum.error) {
                    showOkAlertDialog(
                      context: context,
                      title: 'Error',
                      message: state.errorMessage,
                    );
                  }
                },
                builder: (context, state) => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: const Key('__change_pw_button__'),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      if (_newPasswordController.text.trim() !=
                          _confirmPasswordController.text.trim()) {
                        showOkAlertDialog(
                          context: context,
                          title: 'Passwords do not match',
                          message: 'Please try again',
                        );
                        return;
                      }

                      context.read<UserProfileCubit>().changePassword(
                            oldPassword: _oldPasswordController.text.trim(),
                            newPassword: _newPasswordController.text.trim(),
                            confirmPassword:
                                _confirmPasswordController.text.trim(),
                          );
                    },
                    child: state.status == GenericRequestStatusEnum.loading
                        ? const NMSmallLoadingIndicator()
                        : const Text('Change Password'),
                  ),
                ),
              )
            ],
          ),
        ),
      ).paddingAll(16),
    );
  }

  String? validator(String? value) {
    return InputValidator.isPassword(value!);
  }
}
