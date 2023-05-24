import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/auth/forgot_password/cubit/forgot_pw_cubit.dart';
import 'package:nextminute/features/auth/forgot_password/cubit/forgot_pw_state.dart';
import 'package:nextminute/features/auth/widgets/form_field.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({
    super.key,
    required this.initialText,
  });

  final String initialText;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPWCubit>(
      create: (context) => ForgotPWCubit(
        authenticationRepository: context.read<AuthenticationRepositoryImpl>(),
      ),
      child: ForgotPasswordView(initialText: initialText),
    );
  }
}

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({
    super.key,
    required this.initialText,
  });

  final String initialText;

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: SafeArea(
        child: AlwaysScroll(
          child: Column(
            children: [
              const SizedBox(height: 32),
              const NmLogo(),
              const SizedBox(height: 32),
              const Text(
                'Please enter you username below. When you press Next, '
                'we will send you an email with a link to reset your '
                'password.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NMFormField(
                      key: const Key('__nm_field__'),
                      controller: _emailController,
                      label: 'Email',
                    ),
                    const SizedBox(height: 16),
                    BlocConsumer<ForgotPWCubit, FPWState>(
                      listener: (context, state) {
                        if (state.status == GenericRequestStatusEnum.success) {
                          context.router.replaceAll(
                            [
                              ResetEmailSentRoute(
                                messageTitle:
                                    state.passwordResetModel.MessageTitle ?? '',
                                message: state.passwordResetModel.Message ?? '',
                              ),
                            ],
                          );
                        }

                        if (state.status == GenericRequestStatusEnum.error) {
                          showOkAlertDialog(
                            context: context,
                            title: 'Something went wrong',
                            message: 'Please check your email and try again.',
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state.status == GenericRequestStatusEnum.loading) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }

                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            key: const Key('__forgot_email_button__'),
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              BlocProvider.of<ForgotPWCubit>(context)
                                  .forgotPassword(
                                email: _emailController.text,
                              );
                            },
                            child: const Text('Next'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 32),
        ),
      ),
    );
  }
}
