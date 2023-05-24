import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/main_menu/widgets/nm_menu_item.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainMenuBloc>.value(
      value: context.read<MainMenuBloc>()..add(const MainMenuFetchEvent()),
      child: const MenuView(),
    );
  }
}

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final oldMenus = [
    'Timesheets',
    'Jobs',
    'Scheduled Tasks',
    'Quotes',
    'Invoices',
    'Orders',
    'Supplier Invoices',
    'Pre-Built templates',
    'Contacts',
    'Live Price Book',
    'Sale Items',
    'Dashboard',
    'Reports',
    'Activity Log',
    'Settings',
    'Basic Setup',
    'About',
    'User Profile',
    'Logout',
  ];

  List<IconData> oldMenusIcons = [
    FontAwesomeIcons.solidClock,
    FontAwesomeIcons.gavel,
    FontAwesomeIcons.listCheck,
    FontAwesomeIcons.quoteLeft,
    FontAwesomeIcons.dollarSign,
    FontAwesomeIcons.box,
    FontAwesomeIcons.inbox,
    FontAwesomeIcons.cubes,
    FontAwesomeIcons.users,
    Icons.price_change_outlined,
    FontAwesomeIcons.barcode,
    FontAwesomeIcons.gaugeHigh,
    FontAwesomeIcons.chartLine,
    FontAwesomeIcons.heartPulse,
    FontAwesomeIcons.wrench,
    FontAwesomeIcons.bolt,
    Icons.info_outline,
    FontAwesomeIcons.user,
    FontAwesomeIcons.arrowRightFromBracket,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: const Key('__menu_refresh_indicator__'),
        onRefresh: () async =>
            context.read<MainMenuBloc>().add(const MainMenuFetchEvent()),
        child: BlocBuilder<TabCubit, TabState>(
          builder: (context, state) {
            return NMBlocConsumer<MainMenuBloc, MainMenuState>(
              builder: (context, state) {
                final recordCounts = state.recordCounts;

                return SingleChildScrollView(
                  key: const Key('__menu_list__'),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (context.watch<SharedPrefs>().isNewMenu)
                        _buildNewMenu(state.userPermissions, recordCounts)
                      else
                        _buildOldMenu(state.userPermissions, recordCounts),
                      if (context.read<SharedPrefs>().isNewMenu)
                        if (Platform.isIOS) const SizedBox(height: 24),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildNewMenu(
    UserPermissionsModel userPermissions,
    Map<String, int> recordCounts,
  ) {
    final visibility = userPermissions.mainMenuVisibility!;

    return GridView.count(
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      children: [
        if (visibility['TimesheetsVisible']!)
          NMMenuItem(
            onTap: () {
              context.router.push(const TimeSheetRoute());
            },
            title: 'Timesheets',
            icon: const FaIcon(FontAwesomeIcons.solidClock),
          ),
        if (visibility['JobsVisible']!)
          NMMenuItem(
            onTap: () {
              context.router.push(JobsRoute());
            },
            title: 'Jobs (${recordCounts['JobNonArchived'] ?? 0})',
            icon: const FaIcon(FontAwesomeIcons.gavel),
          ),
        if (visibility['BookingsVisible']!)
          NMMenuItem(
            onTap: () {
              context.router.push(
                ScheduledTaskRoute(isFromMenu: true),
              );
            },
            title: 'Scheduled\nTasks',
            icon: const FaIcon(FontAwesomeIcons.listCheck),
          ),
        if (visibility['QuotesVisible']!)
          NMMenuItem(
            onTap: () {
              context.router.push(
                QuotesRoute(type: 'Quote'),
              );
            },
            title: 'Quotes',
            icon: const FaIcon(FontAwesomeIcons.quoteLeft),
          ),
        if (visibility['InvoicesVisible']!)
          NMMenuItem(
            onTap: () {
              context.router.push(
                QuotesRoute(type: 'Invoice'),
              );
            },
            title: 'Invoices',
            icon: const FaIcon(FontAwesomeIcons.dollarSign),
          ),
        if (visibility['OrdersVisible']!)
          NMMenuItem(
            onTap: () {
              context.router.push(
                QuotesRoute(type: 'Order'),
              );
            },
            title: 'Orders',
            icon: const FaIcon(FontAwesomeIcons.box),
          ),
        if (visibility['SupplierInvoicesVisible']!)
          NMMenuItem(
            onTap: () {
              context.router.push(
                QuotesRoute(type: 'SupplierInvoice'),
              );
            },
            title: 'Supplier\nInvoices',
            icon: const FaIcon(FontAwesomeIcons.inbox),
          ),
        if (visibility['TemplatesVisible']!)
          NMMenuItem(
            title: 'Pre-Built templates (${recordCounts['Template'] ?? 0})',
            icon: const FaIcon(FontAwesomeIcons.cubes),
          ),
        if (visibility['ContactsVisible']!)
          NMMenuItem(
            onTap: () {
              context.router.push(
                JobsAssignCustomerRoute(isFromMenu: true),
              );
            },
            title: 'Contacts (${recordCounts['Contact'] ?? 0})',
            icon: const FaIcon(FontAwesomeIcons.users),
          ),
        if (visibility['LivePriceBookVisible']!)
          const NMMenuItem(
            title: 'Live Price\nBook',
            icon: FaIcon(Icons.price_change_outlined),
          ),
        if (visibility['SaleItemsVisible']!)
          const NMMenuItem(
            title: 'Sale Items',
            icon: FaIcon(FontAwesomeIcons.barcode),
          ),
        if (visibility['DashboardVisible']!)
          const NMMenuItem(
            title: 'Dashboard',
            icon: FaIcon(FontAwesomeIcons.gaugeHigh),
          ),
        if (visibility['ReportsVisible']!)
          const NMMenuItem(
            title: 'Reports',
            icon: FaIcon(FontAwesomeIcons.chartLine),
          ),
        if (visibility['ActivityLogVisible']!)
          const NMMenuItem(
            title: 'Activity Log',
            icon: FaIcon(FontAwesomeIcons.heartPulse),
          ),
        const NMMenuItem(
          title: 'Settings',
          icon: FaIcon(FontAwesomeIcons.wrench),
        ),
        if (visibility['AdminVisible']!)
          const NMMenuItem(
            title: 'Basic Setup',
            icon: FaIcon(
              FontAwesomeIcons.bolt,
              color: Colors.blue,
            ),
          ),
        NMMenuItem(
          onTap: () {
            context.router.push(const AboutRoute());
          },
          title: 'About',
          icon: Image.asset(
            'assets/images/logo/nm_logo_only.png',
            width: 35,
          ),
        ),
        NMMenuItem(
          onTap: () {
            context.router.push(
              UserProfileRoute(
                subscriptionName: userPermissions
                        .subscriptions?[0].subscription_public_name ??
                    '',
              ),
            );
          },
          title: 'User Profile',
          icon: const FaIcon(FontAwesomeIcons.user),
        ),
        NMMenuItem(
          onTap: () async {
            final res = await showOkCancelAlertDialog(
              context: context,
              title: 'You are now leaving the app',
              message: 'Are you sure you want to logout?',
              okLabel: 'Logout',
              isDestructiveAction: true,
            );

            if (res == OkCancelResult.ok) {
              if (mounted) {
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
          },
          title: 'Logout',
          icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
        ),
      ],
    );
  }

  Widget _buildOldMenu(
    UserPermissionsModel userPermissions,
    Map<String, int> recordCounts,
  ) {
    final visibility = userPermissions.mainMenuVisibility!;

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        if (visibility['TimesheetsVisible']!)
          _buildMenuItem(
            0,
            onTap: () {
              context.router.push(const TimeSheetRoute());
            },
          ),
        if (visibility['JobsVisible']!)
          _buildMenuItem(
            1,
            onTap: () {
              context.router.push(JobsRoute());
            },
            count: recordCounts['JobNonArchived'] ?? 0,
          ),
        if (visibility['BookingsVisible']!)
          _buildMenuItem(
            2,
            onTap: () {
              context.router.push(
                ScheduledTaskRoute(isFromMenu: true),
              );
            },
          ),
        if (visibility['QuotesVisible']!)
          _buildMenuItem(
            onTap: () {
              context.router.push(
                QuotesRoute(type: 'Quote'),
              );
            },
            3,
          ),
        if (visibility['InvoicesVisible']!)
          _buildMenuItem(
            onTap: () {
              context.router.push(
                QuotesRoute(type: 'Invoice'),
              );
            },
            4,
          ),
        if (visibility['OrdersVisible']!)
          _buildMenuItem(
            onTap: () {
              context.router.push(
                QuotesRoute(type: 'Order'),
              );
            },
            5,
          ),
        if (visibility['SupplierInvoicesVisible']!)
          _buildMenuItem(
            onTap: () {
              context.router.push(
                QuotesRoute(type: 'SupplierInvoice'),
              );
            },
            6,
          ),
        if (visibility['TemplatesVisible']!)
          _buildMenuItem(
            7,
            count: recordCounts['Template'] ?? 0,
          ),
        if (visibility['ContactsVisible']!)
          _buildMenuItem(
            8,
            onTap: () {
              context.router.push(
                JobsAssignCustomerRoute(isFromMenu: true),
              );
            },
            count: recordCounts['Contact'] ?? 0,
          ),
        if (visibility['LivePriceBookVisible']!)
          _buildMenuItem(
            9,
          ),
        if (visibility['SaleItemsVisible']!)
          _buildMenuItem(
            10,
          ),
        if (visibility['DashboardVisible']!)
          _buildMenuItem(
            11,
          ),
        if (visibility['ReportsVisible']!)
          _buildMenuItem(
            12,
          ),
        if (visibility['ActivityLogVisible']!)
          _buildMenuItem(
            13,
          ),
        _buildMenuItem(
          14,
        ),
        if (visibility['AdminVisible']!)
          _buildMenuItem(
            15,
          ),
        _buildMenuItem(
          16,
          onTap: () {
            context.router.push(const AboutRoute());
          },
        ),
        _buildMenuItem(
          17,
          onTap: () {
            context.router.push(
              UserProfileRoute(
                subscriptionName: userPermissions
                        .subscriptions?[0].subscription_public_name ??
                    '',
              ),
            );
          },
        ),
        _buildMenuItem(
          18,
          onTap: () async {
            final res = await showOkCancelAlertDialog(
              context: context,
              title: 'You are now leaving the app',
              message: 'Are you sure you want to logout?',
              isDestructiveAction: true,
              okLabel: 'Logout',
            );

            if (res == OkCancelResult.ok) {
              if (mounted) {
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
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    int index, {
    int? count,
    void Function()? onTap,
  }) {
    final isBasicSetup = oldMenus[index] == 'Basic Setup';

    return Column(
      children: [
        ListTile(
          key: Key(oldMenus[index]),
          onTap: onTap,
          visualDensity: VisualDensity.compact,
          contentPadding: const EdgeInsets.only(
            left: 22,
            right: 11,
            top: 8,
            bottom: 8,
          ),
          leading: oldMenus[index] == 'About'
              ? Image.asset(
                  'assets/images/logo/nm_logo_only.png',
                  width: 35,
                )
              : FaIcon(
                  oldMenusIcons[index],
                  size: 25,
                  color: isBasicSetup
                      ? Colors.blue
                      : context.isDarkMode
                          ? Colors.white
                          : Colors.grey.shade900,
                ),
          trailing: const Icon(Icons.chevron_right),
          title: Text(
            '${oldMenus[index]} ${count != null ? '($count)' : ''}',
            style: NMTextStyles.b2(context)?.copyWith(
              fontSize: 16,
              color: isBasicSetup
                  ? Colors.blue
                  : context.isDarkMode
                      ? Colors.white
                      : Colors.grey.shade900,
            ),
          ),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
