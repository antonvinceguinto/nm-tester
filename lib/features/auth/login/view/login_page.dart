import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/auth/login/cubit/login_cubit.dart';
import 'package:nextminute/features/auth/login/cubit/login_state.dart';
import 'package:nextminute/features/auth/widgets/form_field.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<dynamic> page() => const MaterialPage(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(
        authenticationRepository: context.read<AuthenticationRepositoryImpl>(),
      ),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          title: const Text('Login'),
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: AlwaysScroll(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const NmLogo(
                  height: 180,
                ),
                const SizedBox(height: 32),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NMFormField(
                        key: const Key('__email_field__'),
                        controller: _emailController,
                        label: 'Email',
                      ),
                      const SizedBox(height: 12),
                      NMFormField(
                        key: const Key('__pw_field__'),
                        controller: _passwordController,
                        label: 'Password',
                        obscureText: true,
                      ),
                      TextButton(
                        key: const Key('__forgot_password_button__'),
                        onPressed: () {
                          if (mounted) {
                            context.router.push(
                              ForgotPasswordRoute(
                                initialText: _emailController.text,
                              ),
                            );
                          }
                        },
                        child: const Text('Forgot Password?'),
                      ),
                      const SizedBox(height: 8),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state.status ==
                              GenericRequestStatusEnum.success) {
                            if (context
                                    .read<SharedPrefs>()
                                    .subscriberEmail
                                    .isEmpty ||
                                context.read<SharedPrefs>().userPin.isEmpty) {
                              //Dismiss keyboard
                              FocusScope.of(context).unfocus();

                              Future.delayed(
                                const Duration(milliseconds: 200),
                                () {
                                  context.router.push(
                                    PinRoute(isNewPin: true),
                                  );
                                },
                              );

                              return;
                            }

                            context.router.replace(
                              const TabManagerRoute(),
                            );
                          }

                          if (state.status == GenericRequestStatusEnum.error) {
                            showOkAlertDialog(
                              context: context,
                              title: 'Login Failed',
                              message:
                                  '''Please make sure your email and password are correct.''',
                            );
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            width: 500,
                            child: ElevatedButton(
                              key: const Key('__login_button__'),
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }

                                if (state.status ==
                                    GenericRequestStatusEnum.loading) {
                                  return;
                                }

                                await context.read<LoginCubit>().login(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    );
                              },
                              child: state.status ==
                                      GenericRequestStatusEnum.loading
                                  ? const Center(
                                      child: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child:
                                            CircularProgressIndicator.adaptive(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const Text('Login'),
                            ),
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 32),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
