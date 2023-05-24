import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/main_menu/view/menu_page.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';
import 'package:nextminute/features/tab_manager/expired_subscription/expired_subscription_page.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class TabManagerPage extends StatelessWidget {
  const TabManagerPage({super.key});

  static Page<dynamic> page() => const MaterialPage(child: TabManagerPage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IndexCubit>(
          create: (_) => IndexCubit(),
        ),
        BlocProvider<MainMenuBloc>.value(
          value: context.read<MainMenuBloc>()
            ..add(const MainMenuFetchEvent())
            ..add(const FetchUnreadMessagesCountEvent()),
        ),
      ],
      child: const TabManagerView(),
    );
  }
}

class TabManagerView extends StatefulWidget {
  const TabManagerView({super.key});

  @override
  State<TabManagerView> createState() => _TabManagerViewState();
}

class _TabManagerViewState extends State<TabManagerView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainMenuBloc, MainMenuState>(
      builder: (context, state) {
        final hasExpiredSubs = state.userPermissions.has_expired_subscriptions;
        final subscriptions = state.userPermissions.subscriptions;

        if (hasExpiredSubs == null || subscriptions == null) {
          return const NMScaffold(
            body: SizedBox.shrink(),
          );
        }

        final isExpired = hasExpiredSubs || subscriptions.isEmpty;

        return NMScaffold(
          leading: isExpired
              ? null
              : BlocBuilder<TabCubit, TabState>(
                  builder: (context, state) {
                    return NMCupertinoButton(
                      onPressed: context.read<TabCubit>().updateMenu,
                      child: context.watch<SharedPrefs>().isNewMenu
                          ? const Icon(FontAwesomeIcons.list)
                          : const Icon(FontAwesomeIcons.grip),
                    );
                  },
                ),
          actions: isExpired
              ? null
              : [
                  NMCupertinoButton(
                    onPressed: () {
                      context.router.push(const MessagesRoute());
                    },
                    child: badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                        elevation: 0,
                        badgeColor: state.unreadMessagesCount == 0
                            ? Colors.transparent
                            : Colors.red,
                      ),
                      badgeContent: state.unreadMessagesCount == 0
                          ? const SizedBox.shrink()
                          : Text(
                              state.unreadMessagesCount.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                      child: const Icon(
                        Icons.mail,
                        size: 28,
                      ),
                    ),
                  ),
                ],
          body: isExpired ? const ExpiredSubscriptionPage() : const MenuPage(),
        );
      },
    );
  }
}
