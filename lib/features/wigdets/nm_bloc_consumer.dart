import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class NMBlocConsumer<B extends StateStreamable<S>, S> extends StatelessWidget {
  const NMBlocConsumer({
    super.key,
    required this.builder,
    this.listener,
    this.onSuccess,
    this.loadingWidget,
    this.isPaginated = false,
  });

  final BlocWidgetBuilder<S> builder;
  final void Function(S state)? onSuccess;
  final void Function(BuildContext, S)? listener;
  final Widget? loadingWidget;
  final bool isPaginated;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      listener: listener ??
          (context, state) {
            {
              final status = (state as dynamic).status;
              try {
                if (status == GenericRequestStatusEnum.error) {
                  final errMsg = '${(state as dynamic).errorMessage}';

                  debugPrint('(NM Bloc Widget) err $errMsg');

                  showOkAlertDialog(
                    context: context,
                    title: 'Oops!',
                    message: (state as dynamic).errorMessage?.toString() ??
                        'Something went wrong',
                  ).then((value) {
                    // TODO(anton): Do this via Dio Interceptor
                    if (errMsg == 'Unauthorized: Please login again') {
                      context.read<AppBloc>().add(
                            AppLogoutRequested(
                              AppStatus.temporarilyAuthenticated,
                              context.read<SharedPrefs>(),
                            ),
                          );
                      context.router.replaceAll([PinRoute()]);
                    }
                  });
                } else if (status == GenericRequestStatusEnum.success) {
                  onSuccess?.call(state);
                }
              } catch (e) {
                debugPrint('(NM Bloc Widget) err $e');
              }
            }
          },
      builder: (context, state) {
        switch ((state as dynamic).status) {
          case GenericRequestStatusEnum.loading:
            return isPaginated
                ? builder(context, state)
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(
                      child: loadingWidget ?? const NMLoadingWidget(),
                    ),
                  );
          case GenericRequestStatusEnum.success:
            return builder(context, state);
          case GenericRequestStatusEnum.error:
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.errorMessage?.toString() ?? 'Something went wrong',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            );
          case GenericRequestStatusEnum.initial:
            return builder(context, state);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
