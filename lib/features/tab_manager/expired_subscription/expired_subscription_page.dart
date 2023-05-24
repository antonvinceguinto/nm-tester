import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/tab_manager/expired_subscription/bloc/expired_subscription_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/bottom_action_panel/nm_bottom_action_button.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

class ExpiredSubscriptionPage extends StatelessWidget {
  const ExpiredSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExpiredSubscriptionBloc>(
      create: (context) => ExpiredSubscriptionBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(const ExpiredSubscriptionFetchEvent()),
      child: const ExpiredSubscriptionView(),
    );
  }
}

class ExpiredSubscriptionView extends StatelessWidget {
  const ExpiredSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ExpiredSubscriptionBloc, ExpiredSubscriptionState>(
            builder: (context, state) {
              if (state.status == GenericRequestStatusEnum.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.userSubscription.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Can't find any subscription."),
                      _buildLogoutButton(context),
                    ],
                  ),
                );
              }

              final sub = state.userSubscription.firstWhere(
                (element) => element.subscription_is_good ?? false,
                orElse: () => state.userSubscription.first,
              );

              final userPermission =
                  context.read<MainMenuBloc>().state.userPermissions;

              return AlwaysScroll(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        key: const ValueKey('welcome'),
                        'Welcome, ${userPermission.subscriber_name_display}',
                      ),
                      const SizedBox(height: 8),
                      const Icon(
                        Icons.warning_rounded,
                        color: Colors.red,
                        size: 80,
                      ),
                      const SizedBox(height: 8),
                      const Text('Your trial has expired'),
                      const SizedBox(height: 8),
                      Text(
                        'Expiry Date:\n${sub.subscription_expiration_date?.formatSEJobDetails()}',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            sub.subscription_buy_now_button_text
                                    ?.toUpperCase() ??
                                'Buy Now',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'If assistance is required, please contact us at: support@nextminute.com',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'The NextMinute Team',
                      ),
                    ],
                  ),
                ).paddingAll(16),
              );
            },
          ),
        ),
        NMBottomMenuActions(
          hasMenu: false,
          actionButton: NMBottomActionButton(
            key: const ValueKey('logout'),
            label: 'Logout',
            onPressed: () => _logout(context),
          ),
        )
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return NMCupertinoButton(
      onPressed: () => _logout(context),
      child: Text(
        'LOGOUT',
        style: NMTextStyles.btn(context)?.copyWith(
          color: Colors.red,
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    final res = await showOkCancelAlertDialog(
      context: context,
      title: 'You are now leaving the app',
      message: 'Are you sure you want to logout?',
      okLabel: 'Logout',
      isDestructiveAction: true,
    );

    if (res == OkCancelResult.ok) {
      if (context.mounted) {
        context.read<AppBloc>().add(
              AppLogoutRequested(
                AppStatus.temporarilyAuthenticated,
                context.read<SharedPrefs>(),
              ),
            );
        await context.router.replaceAll([
          PinRoute(),
        ]);
      }
    }
  }
}
