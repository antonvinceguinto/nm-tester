import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/enums.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/cubit/assignee_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/blocs/select_c_bloc/select_customer_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/index.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_cubits/importance_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_cubits/task_status_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_cubits/user_category_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/bloc/job_details_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/cubit/at_recurrence_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';
import 'package:nm_repository/nm_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthenticationRepositoryImpl authenticationRepository,
    required NMRepositoryImpl nmRepository,
    required SharedPrefs sharedPrefs,
  })  : _authenticationRepository = authenticationRepository,
        _nmRepository = nmRepository,
        _sharedPrefs = sharedPrefs;

  final AuthenticationRepositoryImpl _authenticationRepository;
  final NMRepositoryImpl _nmRepository;
  final SharedPrefs _sharedPrefs;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _nmRepository),
        RepositoryProvider.value(value: _sharedPrefs),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainMenuBloc>(
            create: (context) => MainMenuBloc(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<TabCubit>(
            create: (_) => TabCubit(sharedPrefs: _sharedPrefs),
          ),
          BlocProvider<AppBloc>(
            create: (_) => AppBloc(sharedPrefs: _sharedPrefs),
          ),
          BlocProvider<JobsBloc>(
            create: (context) => JobsBloc(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<JobDetailsBloc>(
            create: (context) => JobDetailsBloc(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<JobsFilterCubit>(
            create: (_) => JobsFilterCubit(),
          ),
          BlocProvider<AssigneeFilterCubit>(
            create: (context) => AssigneeFilterCubit(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<SelectCustomerBloc>(
            create: (context) => SelectCustomerBloc(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<ContactTypesBloc>(
            create: (context) => ContactTypesBloc(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<JobStatusCubit>(
            create: (context) => JobStatusCubit(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<JobTypeCubit>(
            create: (context) => JobTypeCubit(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<PricingTypeCubit>(
            create: (context) => PricingTypeCubit(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<PriorityCubit>(
            create: (context) => PriorityCubit(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<UserCategoryCubit>(
            create: (context) => UserCategoryCubit(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<ImportanceCubit>(
            create: (context) => ImportanceCubit(),
          ),
          BlocProvider<AddJobBloc>(
            create: (context) => AddJobBloc(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<ScheduledTaskBloc>(
            create: (context) => ScheduledTaskBloc(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<TaskFilterStatusCubit>(
            create: (_) => TaskFilterStatusCubit(),
          ),
          BlocProvider<TaskStatusCubit>(
            create: (_) => TaskStatusCubit(
              nmRepositoryImpl: _nmRepository,
            ),
          ),
          BlocProvider<TaskFilterBloc>(
            create: (_) => TaskFilterBloc(),
          ),
          BlocProvider<ATRecurrenceCubit>(
            create: (_) => ATRecurrenceCubit(),
          ),
          BlocProvider<QuotesFiltersCubit>(
            create: (_) => QuotesFiltersCubit(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>(BoxType.boxDarkMode.name()).listenable(),
      builder: (BuildContext context, Box<dynamic> box, Widget? child) {
        final darkMode =
            box.get(BoxType.darkMode.name(), defaultValue: false) as bool;

        return MaterialApp.router(
          theme: darkMode
              ? NextMinuteTheme.darkTheme()
              : NextMinuteTheme.lightTheme(),
          // darkTheme: NextMinuteTheme.darkTheme(),
          routerConfig: _appRouter.config(),
          builder: (context, child) {
            return Scaffold(
              body: _body(child!),
              // body: !widget.isDev
              //     ? _body(child!)
              //     : AnimatedStack(
              //         buttonIcon: Icons.settings,
              //         backgroundColor: Colors.black.withOpacity(0.9),
              //         fabBackgroundColor: NMColors.orange,
              //         buttonAnimationDuration:
              //             const Duration(milliseconds: 150),
              //         slideAnimationDuration: const
              //              Duration(milliseconds: 500),
              //         columnWidget: Column(
              //           children: [
              //             _buildUrlButton(
              //               title: 'MENU',
              //               onTap: () {
              //                 context.read<TabCubit>().updateMenu();
              //               },
              //             ),
              //             const SizedBox(height: 8),
              //             _buildUrlButton(
              //               title: 'DARK',
              //               onTap: () {
              //                 context.read<TabCubit>().toggleDarkMode();
              //               },
              //             ),
              //             // const SizedBox(height: 8),
              //             // _buildUrlButton(
              //             //   title: 'TEST1',
              //             //   url: AppConfig.test1,
              //             // ),
              //             // const SizedBox(height: 8),
              //             // _buildUrlButton(
              //             //   title: 'PROD',
              //             //   url: AppConfig.production,
              //             // ),
              //           ],
              //         ),
              //         bottomWidget: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'Current endpoint:\n$currentUrl',
              //               textAlign: TextAlign.start,
              //               style: NMTextStyles.b2(context)?.copyWith(
              //                 color: Colors.white,
              //                 fontSize: 12,
              //               ),
              //             ),
              //           ],
              //         ),
              //         foregroundWidget: _body(child!),
              //       ),
            );
          },
        );
      },
    );
  }

  Widget _body(Widget child) {
    return Column(
      children: [
        Expanded(
          child: child,
        ),
        // NMCupertinoButton(
        //   onPressed: () {},
        //   padding: EdgeInsets.zero,
        //   child: Container(
        //     color: NMColors.orange,
        //     padding: EdgeInsets.only(bottom:
        // Platform.isIOS ? 16 : 0),
        //     height: 60,
        //     width: double.infinity,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           'Timer running for JOB-1026',
        //           style: NMTextStyles.b2(context)?.copyWith(
        //             color: Colors.white,
        //           ),
        //         ),
        //         Text(
        //           '0 min 20 sec (Click to stop)',
        //           style: NMTextStyles.b2(context)?.copyWith(
        //             color: Colors.white,
        //             fontSize: 12,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }

  // Widget _buildUrlButton({
  //   required String title,
  //   String? url,
  //   void Function()? onTap,
  // }) {
  //   return InkWell(
  //     onTap: onTap ??
  //         () {
  //           context.read<SharedPrefs>().currentEndpointUrl = url!;
  //           Phoenix.rebirth(context);
  //         },
  //     child: Container(
  //       width: double.infinity,
  //       height: 50,
  //       padding: const EdgeInsets.symmetric(horizontal: 8),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(
  //           NMBorderRadius.defaultBorderRadius,
  //         ),
  //       ),
  //       child: Center(
  //         child: Text(
  //           title,
  //           style: NMTextStyles.b2(context)?.copyWith(
  //             fontSize: 14,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
