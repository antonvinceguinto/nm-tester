import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextminute/app/view/app_init_page.dart';
import 'package:nextminute/features/auth/forgot_password/view/forgot_password_page.dart';
import 'package:nextminute/features/auth/forgot_password/view/reset_email_sent_page.dart';
import 'package:nextminute/features/auth/login/login.dart';
import 'package:nextminute/features/auth/pin/view/pin_page.dart';
import 'package:nextminute/features/menu/main_menu/view/menu_page.dart';
import 'package:nextminute/features/menu/sub_menus/charges/view/charges_page.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/acceptance_status/view/acceptance_status_page.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/view/simple_map_page.dart';
import 'package:nextminute/features/menu/sub_menus/messages/view/messages_page.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/quote_details/view/quotes_details_page.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/view/quotes_filter_page.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/view/quotes_page.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/view/quotes_select_job_page.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/recurrence_page.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/view/add_task_page.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/tab_manager/view/tab_manager_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppInitRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetEmailSentRoute.page),
        AutoRoute(page: PinRoute.page),
        AutoRoute(page: MenuRoute.page),
        AutoRoute(page: TabManagerRoute.page),
        AutoRoute(page: TimeSheetRoute.page),
        AutoRoute(page: TimesheetDetailsRoute.page),
        AutoRoute(page: UserProfileRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: AboutRoute.page),
        AutoRoute(page: JobsRoute.page),
        AutoRoute(page: JobsFilterRoute.page),
        AutoRoute(page: JobsSelectCustomerRoute.page),
        AutoRoute(page: JobsAssignCustomerRoute.page),
        AutoRoute(page: AssigneeFilterRoute.page),
        AutoRoute(page: JobsAddCustomerRoute.page),
        AutoRoute(page: ContactTypesRoute.page),
        AutoRoute(page: EditContactTypesRoute.page),
        AutoRoute(page: JobDetailsRoute.page),
        AutoRoute(page: ChargesRoute.page),
        AutoRoute(page: SimpleMapRoute.page),
        AutoRoute(page: AcceptanceStatusRoute.page),
        AutoRoute(page: JobMapsRoute.page),
        AutoRoute(page: AddJobRoute.page),
        AutoRoute(page: CustomerDetailsRoute.page),
        AutoRoute(page: ContactMapRoute.page),
        AutoRoute(page: VersionHistoryRoute.page),
        AutoRoute(page: ScheduledTaskRoute.page),
        AutoRoute(page: TaskFilterRoute.page),
        AutoRoute(page: TaskDetailsRoute.page),
        AutoRoute(page: MessagesRoute.page),
        AutoRoute(page: AddTaskRoute.page),
        AutoRoute(page: RecurrenceRoute.page),
        AutoRoute(page: QuotesRoute.page),
        AutoRoute(page: QuotesFilterRoute.page),
        AutoRoute(page: QuotesSelectJobRoute.page),
        AutoRoute(page: QuotesDetailsRoute.page),
      ];
}
