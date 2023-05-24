import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/auth/login/cubit/login_cubit.dart';
import 'package:nextminute/features/auth/login/cubit/login_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

@RoutePage()
class PinPage extends StatelessWidget {
  const PinPage({super.key, this.isNewPin = false});

  static Page<dynamic> page() => const MaterialPage(child: PinPage());

  final bool isNewPin;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(
        authenticationRepository: context.read<AuthenticationRepositoryImpl>(),
      ),
      child: PinView(isNewPin: isNewPin),
    );
  }
}

class PinView extends StatefulWidget {
  const PinView({super.key, this.isNewPin = false});

  final bool isNewPin;

  @override
  State<PinView> createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  String newPin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NMColors.orange,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        children: [
          const NmLogo(
            color: Colors.white,
            height: 90,
          ),
          Expanded(
            child: _buildEnterPIN(),
          ),
        ],
      ),
    );
  }

  Widget _buildEnterPIN() {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == GenericRequestStatusEnum.error) {
          showOkAlertDialog(
            context: context,
            title: 'Error',
            message: state.message,
          );
        }

        if (state.status == GenericRequestStatusEnum.success) {
          if (mounted) {
            context.router.replaceAll(
              [
                const TabManagerRoute(),
              ],
            );
          }
        }
      },
      builder: (context, state) {
        if (state.status == GenericRequestStatusEnum.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        }

        return PasscodeScreen(
          passwordDigits: 4,
          backgroundColor: NMColors.orange,
          title: Text(
            widget.isNewPin ? 'Create a new PIN' : 'Enter PIN',
            style: NMTextStyles.h4(context)?.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          keyboardUIConfig: _keyboardUIConfig(context),
          passwordEnteredCallback: (String input) async {
            if (widget.isNewPin) {
              setState(() {
                newPin = input;
              });

              if (mounted) {
                await Navigator.push(
                  context,
                  PageRouteBuilder<void>(
                    pageBuilder: (_, __, ___) => _buildConfirmationPIN(),
                  ),
                );
              }
              return;
            }

            // Enter current PIN
            if (input == context.read<SharedPrefs>().userPin) {
              final email = context.read<SharedPrefs>().subscriberEmail;
              final password = context.read<SharedPrefs>().password;

              // Re-login the user again
              await context.read<LoginCubit>().login(
                    email: email,
                    password: password,
                  );

              return;
            } else {
              await showOkAlertDialog(
                context: context,
                message: 'Invalid PIN. Please try again.',
              );
            }
          },
          deleteButton: _deleteButton,
          shouldTriggerVerification: Stream.value(false),
          onForgotPasswordPressed: widget.isNewPin
              ? null
              : () {
                  if (mounted) {
                    context.router.replaceAll(
                      [
                        const LoginRoute(),
                      ],
                    );
                  }
                },
          forgotPassButton: widget.isNewPin
              ? const SizedBox.shrink()
              : FittedBox(
                  key: const Key('__forgot_pin_button__'),
                  child: Text(
                    'Forgot\nPIN?'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style:
                        NMTextStyles.b2(context)?.copyWith(color: Colors.white),
                  ),
                ),
          bottomWidget: widget.isNewPin
              ? const SizedBox.shrink()
              : TextButton(
                  key: const Key('__switch_user__'),
                  onPressed: () {
                    context.read<AppBloc>().add(
                          AppLogoutRequested(
                            AppStatus.unauthenticated,
                            context.read<SharedPrefs>(),
                          ),
                        );
                    Future.delayed(const Duration(milliseconds: 300), () {
                      Phoenix.rebirth(context);
                    });
                  },
                  child: Text(
                    'SWITCH USER',
                    style:
                        NMTextStyles.b2(context)?.copyWith(color: Colors.white),
                  ),
                ).paddingOnly(top: 8),
        );
      },
    );
  }

  Widget _buildConfirmationPIN() {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(
        authenticationRepository: context.read<AuthenticationRepositoryImpl>(),
      ),
      child: Scaffold(
        backgroundColor: NMColors.orange,
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == GenericRequestStatusEnum.error) {
              showOkAlertDialog(
                context: context,
                title: 'Error',
                message: state.message,
              );
              return;
            }

            if (state.status == GenericRequestStatusEnum.success) {
              if (mounted) {
                context.router.replaceAll(
                  [
                    const TabManagerRoute(),
                  ],
                );
              }
            }
          },
          builder: (context, state) {
            if (state.status == GenericRequestStatusEnum.loading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            }

            return Column(
              children: [
                const NmLogo(
                  color: Colors.white,
                  height: 90,
                ),
                Expanded(
                  child: PasscodeScreen(
                    passwordDigits: 4,
                    backgroundColor: NMColors.orange,
                    title: Text(
                      'Please confirm your PIN',
                      style: NMTextStyles.h4(context)?.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    keyboardUIConfig: _keyboardUIConfig(context),
                    passwordEnteredCallback: (String input) async {
                      if (newPin == input) {
                        context.read<SharedPrefs>().userPin = input;

                        final email =
                            context.read<SharedPrefs>().subscriberEmail;
                        final password = context.read<SharedPrefs>().password;

                        // Re-login the user to save authStatus
                        await context.read<LoginCubit>().login(
                              email: email,
                              password: password,
                            );
                        return;
                      } else {
                        await showOkAlertDialog(
                          context: context,
                          message: 'PINs do not match. Please try again.',
                        );
                      }
                    },
                    deleteButton: _deleteButton,
                    shouldTriggerVerification: Stream.value(false),
                    onForgotPasswordPressed: widget.isNewPin ? null : () {},
                    forgotPassButton: const SizedBox.shrink(),
                    bottomWidget: const SizedBox.shrink(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  final Widget _deleteButton = const Icon(
    key: Key('__delete_button__'),
    Icons.backspace_outlined,
    color: Colors.white,
    size: 32,
  );

  KeyboardUIConfig _keyboardUIConfig(BuildContext context) => KeyboardUIConfig(
        primaryColor: NMColors.orange,
        digitTextStyle: NMTextStyles.h4(context)!.copyWith(
          color: NMColors.orange,
          fontSize: 22,
        ),
        digitFillColor: Colors.white,
        keyboardSize: const Size(
          230,
          230,
        ),
      );
}
