// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppInitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppInitPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ForgotPasswordPage(
          key: args.key,
          initialText: args.initialText,
        ),
      );
    },
    ResetEmailSentRoute.name: (routeData) {
      final args = routeData.argsAs<ResetEmailSentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResetEmailSentPage(
          key: args.key,
          message: args.message,
          messageTitle: args.messageTitle,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    PinRoute.name: (routeData) {
      final args =
          routeData.argsAs<PinRouteArgs>(orElse: () => const PinRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PinPage(
          key: args.key,
          isNewPin: args.isNewPin,
        ),
      );
    },
    MenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuPage(),
      );
    },
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    VersionHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VersionHistoryPage(),
      );
    },
    ChargesRoute.name: (routeData) {
      final args = routeData.argsAs<ChargesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChargesPage(
          key: args.key,
          job: args.job,
          task: args.task,
          scrollToHeader: args.scrollToHeader,
        ),
      );
    },
    AssigneeFilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AssigneeFilterPage(),
      );
    },
    JobsAssignCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<JobsAssignCustomerRouteArgs>(
          orElse: () => const JobsAssignCustomerRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobsAssignCustomerPage(
          key: args.key,
          isSelection: args.isSelection,
          isSite: args.isSite,
          parentContactId: args.parentContactId,
          onCustomerSelect: args.onCustomerSelect,
          isFromMenu: args.isFromMenu,
          isCreatedBy: args.isCreatedBy,
        ),
      );
    },
    ContactTypesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactTypesPage(),
      );
    },
    EditContactTypesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditContactTypesPage(),
      );
    },
    JobsAddCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<JobsAddCustomerRouteArgs>(
          orElse: () => const JobsAddCustomerRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobsAddCustomerPage(
          key: args.key,
          isSite: args.isSite,
          parentContactId: args.parentContactId,
        ),
      );
    },
    JobsSelectCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<JobsSelectCustomerRouteArgs>(
          orElse: () => const JobsSelectCustomerRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobsSelectCustomerPage(
          key: args.key,
          onCustomerSelect: args.onCustomerSelect,
          isSupplier: args.isSupplier,
          separateHardwareSuppliers: args.separateHardwareSuppliers,
        ),
      );
    },
    CustomerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CustomerDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomerDetailsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ContactMapRoute.name: (routeData) {
      final args = routeData.argsAs<ContactMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContactMapPage(
          key: args.key,
          contacts: args.contacts,
          isEmbedded: args.isEmbedded,
        ),
      );
    },
    JobsRoute.name: (routeData) {
      final args =
          routeData.argsAs<JobsRouteArgs>(orElse: () => const JobsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobsPage(
          key: args.key,
          onTap: args.onTap,
        ),
      );
    },
    AddJobRoute.name: (routeData) {
      final args = routeData.argsAs<AddJobRouteArgs>(
          orElse: () => const AddJobRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddJobPage(
          key: args.key,
          jobInfoLevel: args.jobInfoLevel,
        ),
      );
    },
    AcceptanceStatusRoute.name: (routeData) {
      final args = routeData.argsAs<AcceptanceStatusRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AcceptanceStatusPage(
          key: args.key,
          acceptanceComment: args.acceptanceComment,
          acceptanceStatus: args.acceptanceStatus,
          id: args.id,
          isTask: args.isTask,
        ),
      );
    },
    JobDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<JobDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobDetailsPage(
          key: args.key,
          job: args.job,
        ),
      );
    },
    SimpleMapRoute.name: (routeData) {
      final args = routeData.argsAs<SimpleMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SimpleMapPage(
          key: args.key,
          statusChangeLocation: args.statusChangeLocation,
          statusContactName: args.statusContactName,
          job: args.job,
          task: args.task,
        ),
      );
    },
    JobsFilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JobsFilterPage(),
      );
    },
    JobMapsRoute.name: (routeData) {
      final args = routeData.argsAs<JobMapsRouteArgs>(
          orElse: () => const JobMapsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobMapsPage(
          key: args.key,
          jobs: args.jobs,
          tasks: args.tasks,
          isEmbedded: args.isEmbedded,
        ),
      );
    },
    MessagesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MessagesPage(),
      );
    },
    QuotesDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<QuotesDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuotesDetailsPage(
          key: args.key,
          billableId: args.billableId,
        ),
      );
    },
    QuotesFilterRoute.name: (routeData) {
      final args = routeData.argsAs<QuotesFilterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuotesFilterPage(
          key: args.key,
          isQuote: args.isQuote,
          isInvoice: args.isInvoice,
          isOrder: args.isOrder,
          isSupplierInvoice: args.isSupplierInvoice,
        ),
      );
    },
    QuotesRoute.name: (routeData) {
      final args = routeData.argsAs<QuotesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuotesPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    QuotesSelectJobRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuotesSelectJobPage(),
      );
    },
    RecurrenceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RecurrencePage(),
      );
    },
    AddTaskRoute.name: (routeData) {
      final args = routeData.argsAs<AddTaskRouteArgs>(
          orElse: () => const AddTaskRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddTaskPage(
          key: args.key,
          taskInfoLevel: args.taskInfoLevel,
          updateMode: args.updateMode,
        ),
      );
    },
    TaskFilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TaskFilterPage(),
      );
    },
    TaskDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TaskDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskDetailsPage(
          key: args.key,
          task: args.task,
        ),
      );
    },
    ScheduledTaskRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduledTaskRouteArgs>(
          orElse: () => const ScheduledTaskRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScheduledTaskPage(
          key: args.key,
          isFromJobs: args.isFromJobs,
          isFromMenu: args.isFromMenu,
          jobId: args.jobId,
        ),
      );
    },
    TimesheetDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TimesheetDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TimesheetDetailsPage(
          key: args.key,
          datum: args.datum,
        ),
      );
    },
    TimeSheetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TimeSheetPage(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserProfilePage(
          key: args.key,
          subscriptionName: args.subscriptionName,
        ),
      );
    },
    TabManagerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabManagerPage(),
      );
    },
  };
}

/// generated route for
/// [AppInitPage]
class AppInitRoute extends PageRouteInfo<void> {
  const AppInitRoute({List<PageRouteInfo>? children})
      : super(
          AppInitRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppInitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    Key? key,
    required String initialText,
    List<PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(
            key: key,
            initialText: initialText,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<ForgotPasswordRouteArgs> page =
      PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({
    this.key,
    required this.initialText,
  });

  final Key? key;

  final String initialText;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key, initialText: $initialText}';
  }
}

/// generated route for
/// [ResetEmailSentPage]
class ResetEmailSentRoute extends PageRouteInfo<ResetEmailSentRouteArgs> {
  ResetEmailSentRoute({
    Key? key,
    required String message,
    required String messageTitle,
    List<PageRouteInfo>? children,
  }) : super(
          ResetEmailSentRoute.name,
          args: ResetEmailSentRouteArgs(
            key: key,
            message: message,
            messageTitle: messageTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetEmailSentRoute';

  static const PageInfo<ResetEmailSentRouteArgs> page =
      PageInfo<ResetEmailSentRouteArgs>(name);
}

class ResetEmailSentRouteArgs {
  const ResetEmailSentRouteArgs({
    this.key,
    required this.message,
    required this.messageTitle,
  });

  final Key? key;

  final String message;

  final String messageTitle;

  @override
  String toString() {
    return 'ResetEmailSentRouteArgs{key: $key, message: $message, messageTitle: $messageTitle}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PinPage]
class PinRoute extends PageRouteInfo<PinRouteArgs> {
  PinRoute({
    Key? key,
    bool isNewPin = false,
    List<PageRouteInfo>? children,
  }) : super(
          PinRoute.name,
          args: PinRouteArgs(
            key: key,
            isNewPin: isNewPin,
          ),
          initialChildren: children,
        );

  static const String name = 'PinRoute';

  static const PageInfo<PinRouteArgs> page = PageInfo<PinRouteArgs>(name);
}

class PinRouteArgs {
  const PinRouteArgs({
    this.key,
    this.isNewPin = false,
  });

  final Key? key;

  final bool isNewPin;

  @override
  String toString() {
    return 'PinRouteArgs{key: $key, isNewPin: $isNewPin}';
  }
}

/// generated route for
/// [MenuPage]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VersionHistoryPage]
class VersionHistoryRoute extends PageRouteInfo<void> {
  const VersionHistoryRoute({List<PageRouteInfo>? children})
      : super(
          VersionHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'VersionHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChargesPage]
class ChargesRoute extends PageRouteInfo<ChargesRouteArgs> {
  ChargesRoute({
    Key? key,
    required JobInfoLevelModel? job,
    required TaskInfoLevelModel? task,
    required String? scrollToHeader,
    List<PageRouteInfo>? children,
  }) : super(
          ChargesRoute.name,
          args: ChargesRouteArgs(
            key: key,
            job: job,
            task: task,
            scrollToHeader: scrollToHeader,
          ),
          initialChildren: children,
        );

  static const String name = 'ChargesRoute';

  static const PageInfo<ChargesRouteArgs> page =
      PageInfo<ChargesRouteArgs>(name);
}

class ChargesRouteArgs {
  const ChargesRouteArgs({
    this.key,
    required this.job,
    required this.task,
    required this.scrollToHeader,
  });

  final Key? key;

  final JobInfoLevelModel? job;

  final TaskInfoLevelModel? task;

  final String? scrollToHeader;

  @override
  String toString() {
    return 'ChargesRouteArgs{key: $key, job: $job, task: $task, scrollToHeader: $scrollToHeader}';
  }
}

/// generated route for
/// [AssigneeFilterPage]
class AssigneeFilterRoute extends PageRouteInfo<void> {
  const AssigneeFilterRoute({List<PageRouteInfo>? children})
      : super(
          AssigneeFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssigneeFilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobsAssignCustomerPage]
class JobsAssignCustomerRoute
    extends PageRouteInfo<JobsAssignCustomerRouteArgs> {
  JobsAssignCustomerRoute({
    Key? key,
    bool isSelection = false,
    bool isSite = false,
    int? parentContactId,
    void Function(CustomerDatum)? onCustomerSelect,
    bool isFromMenu = false,
    bool isCreatedBy = false,
    List<PageRouteInfo>? children,
  }) : super(
          JobsAssignCustomerRoute.name,
          args: JobsAssignCustomerRouteArgs(
            key: key,
            isSelection: isSelection,
            isSite: isSite,
            parentContactId: parentContactId,
            onCustomerSelect: onCustomerSelect,
            isFromMenu: isFromMenu,
            isCreatedBy: isCreatedBy,
          ),
          initialChildren: children,
        );

  static const String name = 'JobsAssignCustomerRoute';

  static const PageInfo<JobsAssignCustomerRouteArgs> page =
      PageInfo<JobsAssignCustomerRouteArgs>(name);
}

class JobsAssignCustomerRouteArgs {
  const JobsAssignCustomerRouteArgs({
    this.key,
    this.isSelection = false,
    this.isSite = false,
    this.parentContactId,
    this.onCustomerSelect,
    this.isFromMenu = false,
    this.isCreatedBy = false,
  });

  final Key? key;

  final bool isSelection;

  final bool isSite;

  final int? parentContactId;

  final void Function(CustomerDatum)? onCustomerSelect;

  final bool isFromMenu;

  final bool isCreatedBy;

  @override
  String toString() {
    return 'JobsAssignCustomerRouteArgs{key: $key, isSelection: $isSelection, isSite: $isSite, parentContactId: $parentContactId, onCustomerSelect: $onCustomerSelect, isFromMenu: $isFromMenu, isCreatedBy: $isCreatedBy}';
  }
}

/// generated route for
/// [ContactTypesPage]
class ContactTypesRoute extends PageRouteInfo<void> {
  const ContactTypesRoute({List<PageRouteInfo>? children})
      : super(
          ContactTypesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactTypesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditContactTypesPage]
class EditContactTypesRoute extends PageRouteInfo<void> {
  const EditContactTypesRoute({List<PageRouteInfo>? children})
      : super(
          EditContactTypesRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditContactTypesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobsAddCustomerPage]
class JobsAddCustomerRoute extends PageRouteInfo<JobsAddCustomerRouteArgs> {
  JobsAddCustomerRoute({
    Key? key,
    bool isSite = false,
    int? parentContactId,
    List<PageRouteInfo>? children,
  }) : super(
          JobsAddCustomerRoute.name,
          args: JobsAddCustomerRouteArgs(
            key: key,
            isSite: isSite,
            parentContactId: parentContactId,
          ),
          initialChildren: children,
        );

  static const String name = 'JobsAddCustomerRoute';

  static const PageInfo<JobsAddCustomerRouteArgs> page =
      PageInfo<JobsAddCustomerRouteArgs>(name);
}

class JobsAddCustomerRouteArgs {
  const JobsAddCustomerRouteArgs({
    this.key,
    this.isSite = false,
    this.parentContactId,
  });

  final Key? key;

  final bool isSite;

  final int? parentContactId;

  @override
  String toString() {
    return 'JobsAddCustomerRouteArgs{key: $key, isSite: $isSite, parentContactId: $parentContactId}';
  }
}

/// generated route for
/// [JobsSelectCustomerPage]
class JobsSelectCustomerRoute
    extends PageRouteInfo<JobsSelectCustomerRouteArgs> {
  JobsSelectCustomerRoute({
    Key? key,
    void Function(CustomerDatum)? onCustomerSelect,
    bool isSupplier = false,
    bool separateHardwareSuppliers = false,
    List<PageRouteInfo>? children,
  }) : super(
          JobsSelectCustomerRoute.name,
          args: JobsSelectCustomerRouteArgs(
            key: key,
            onCustomerSelect: onCustomerSelect,
            isSupplier: isSupplier,
            separateHardwareSuppliers: separateHardwareSuppliers,
          ),
          initialChildren: children,
        );

  static const String name = 'JobsSelectCustomerRoute';

  static const PageInfo<JobsSelectCustomerRouteArgs> page =
      PageInfo<JobsSelectCustomerRouteArgs>(name);
}

class JobsSelectCustomerRouteArgs {
  const JobsSelectCustomerRouteArgs({
    this.key,
    this.onCustomerSelect,
    this.isSupplier = false,
    this.separateHardwareSuppliers = false,
  });

  final Key? key;

  final void Function(CustomerDatum)? onCustomerSelect;

  final bool isSupplier;

  final bool separateHardwareSuppliers;

  @override
  String toString() {
    return 'JobsSelectCustomerRouteArgs{key: $key, onCustomerSelect: $onCustomerSelect, isSupplier: $isSupplier, separateHardwareSuppliers: $separateHardwareSuppliers}';
  }
}

/// generated route for
/// [CustomerDetailsPage]
class CustomerDetailsRoute extends PageRouteInfo<CustomerDetailsRouteArgs> {
  CustomerDetailsRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          CustomerDetailsRoute.name,
          args: CustomerDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomerDetailsRoute';

  static const PageInfo<CustomerDetailsRouteArgs> page =
      PageInfo<CustomerDetailsRouteArgs>(name);
}

class CustomerDetailsRouteArgs {
  const CustomerDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CustomerDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [ContactMapPage]
class ContactMapRoute extends PageRouteInfo<ContactMapRouteArgs> {
  ContactMapRoute({
    Key? key,
    required List<CustomerDatum> contacts,
    bool isEmbedded = false,
    List<PageRouteInfo>? children,
  }) : super(
          ContactMapRoute.name,
          args: ContactMapRouteArgs(
            key: key,
            contacts: contacts,
            isEmbedded: isEmbedded,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactMapRoute';

  static const PageInfo<ContactMapRouteArgs> page =
      PageInfo<ContactMapRouteArgs>(name);
}

class ContactMapRouteArgs {
  const ContactMapRouteArgs({
    this.key,
    required this.contacts,
    this.isEmbedded = false,
  });

  final Key? key;

  final List<CustomerDatum> contacts;

  final bool isEmbedded;

  @override
  String toString() {
    return 'ContactMapRouteArgs{key: $key, contacts: $contacts, isEmbedded: $isEmbedded}';
  }
}

/// generated route for
/// [JobsPage]
class JobsRoute extends PageRouteInfo<JobsRouteArgs> {
  JobsRoute({
    Key? key,
    void Function(JobInfoLevelModel)? onTap,
    List<PageRouteInfo>? children,
  }) : super(
          JobsRoute.name,
          args: JobsRouteArgs(
            key: key,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'JobsRoute';

  static const PageInfo<JobsRouteArgs> page = PageInfo<JobsRouteArgs>(name);
}

class JobsRouteArgs {
  const JobsRouteArgs({
    this.key,
    this.onTap,
  });

  final Key? key;

  final void Function(JobInfoLevelModel)? onTap;

  @override
  String toString() {
    return 'JobsRouteArgs{key: $key, onTap: $onTap}';
  }
}

/// generated route for
/// [AddJobPage]
class AddJobRoute extends PageRouteInfo<AddJobRouteArgs> {
  AddJobRoute({
    Key? key,
    JobInfoLevelModel? jobInfoLevel,
    List<PageRouteInfo>? children,
  }) : super(
          AddJobRoute.name,
          args: AddJobRouteArgs(
            key: key,
            jobInfoLevel: jobInfoLevel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddJobRoute';

  static const PageInfo<AddJobRouteArgs> page = PageInfo<AddJobRouteArgs>(name);
}

class AddJobRouteArgs {
  const AddJobRouteArgs({
    this.key,
    this.jobInfoLevel,
  });

  final Key? key;

  final JobInfoLevelModel? jobInfoLevel;

  @override
  String toString() {
    return 'AddJobRouteArgs{key: $key, jobInfoLevel: $jobInfoLevel}';
  }
}

/// generated route for
/// [AcceptanceStatusPage]
class AcceptanceStatusRoute extends PageRouteInfo<AcceptanceStatusRouteArgs> {
  AcceptanceStatusRoute({
    Key? key,
    required String? acceptanceComment,
    required String? acceptanceStatus,
    required int id,
    bool isTask = false,
    List<PageRouteInfo>? children,
  }) : super(
          AcceptanceStatusRoute.name,
          args: AcceptanceStatusRouteArgs(
            key: key,
            acceptanceComment: acceptanceComment,
            acceptanceStatus: acceptanceStatus,
            id: id,
            isTask: isTask,
          ),
          initialChildren: children,
        );

  static const String name = 'AcceptanceStatusRoute';

  static const PageInfo<AcceptanceStatusRouteArgs> page =
      PageInfo<AcceptanceStatusRouteArgs>(name);
}

class AcceptanceStatusRouteArgs {
  const AcceptanceStatusRouteArgs({
    this.key,
    required this.acceptanceComment,
    required this.acceptanceStatus,
    required this.id,
    this.isTask = false,
  });

  final Key? key;

  final String? acceptanceComment;

  final String? acceptanceStatus;

  final int id;

  final bool isTask;

  @override
  String toString() {
    return 'AcceptanceStatusRouteArgs{key: $key, acceptanceComment: $acceptanceComment, acceptanceStatus: $acceptanceStatus, id: $id, isTask: $isTask}';
  }
}

/// generated route for
/// [JobDetailsPage]
class JobDetailsRoute extends PageRouteInfo<JobDetailsRouteArgs> {
  JobDetailsRoute({
    Key? key,
    required JobInfoLevelModel job,
    List<PageRouteInfo>? children,
  }) : super(
          JobDetailsRoute.name,
          args: JobDetailsRouteArgs(
            key: key,
            job: job,
          ),
          initialChildren: children,
        );

  static const String name = 'JobDetailsRoute';

  static const PageInfo<JobDetailsRouteArgs> page =
      PageInfo<JobDetailsRouteArgs>(name);
}

class JobDetailsRouteArgs {
  const JobDetailsRouteArgs({
    this.key,
    required this.job,
  });

  final Key? key;

  final JobInfoLevelModel job;

  @override
  String toString() {
    return 'JobDetailsRouteArgs{key: $key, job: $job}';
  }
}

/// generated route for
/// [SimpleMapPage]
class SimpleMapRoute extends PageRouteInfo<SimpleMapRouteArgs> {
  SimpleMapRoute({
    Key? key,
    required LatLng statusChangeLocation,
    required String statusContactName,
    JobInfoLevelModel? job,
    TaskInfoLevelModel? task,
    List<PageRouteInfo>? children,
  }) : super(
          SimpleMapRoute.name,
          args: SimpleMapRouteArgs(
            key: key,
            statusChangeLocation: statusChangeLocation,
            statusContactName: statusContactName,
            job: job,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'SimpleMapRoute';

  static const PageInfo<SimpleMapRouteArgs> page =
      PageInfo<SimpleMapRouteArgs>(name);
}

class SimpleMapRouteArgs {
  const SimpleMapRouteArgs({
    this.key,
    required this.statusChangeLocation,
    required this.statusContactName,
    this.job,
    this.task,
  });

  final Key? key;

  final LatLng statusChangeLocation;

  final String statusContactName;

  final JobInfoLevelModel? job;

  final TaskInfoLevelModel? task;

  @override
  String toString() {
    return 'SimpleMapRouteArgs{key: $key, statusChangeLocation: $statusChangeLocation, statusContactName: $statusContactName, job: $job, task: $task}';
  }
}

/// generated route for
/// [JobsFilterPage]
class JobsFilterRoute extends PageRouteInfo<void> {
  const JobsFilterRoute({List<PageRouteInfo>? children})
      : super(
          JobsFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobsFilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobMapsPage]
class JobMapsRoute extends PageRouteInfo<JobMapsRouteArgs> {
  JobMapsRoute({
    Key? key,
    List<JobInfoLevelModel>? jobs,
    List<TaskInfoLevelModel>? tasks,
    bool isEmbedded = false,
    List<PageRouteInfo>? children,
  }) : super(
          JobMapsRoute.name,
          args: JobMapsRouteArgs(
            key: key,
            jobs: jobs,
            tasks: tasks,
            isEmbedded: isEmbedded,
          ),
          initialChildren: children,
        );

  static const String name = 'JobMapsRoute';

  static const PageInfo<JobMapsRouteArgs> page =
      PageInfo<JobMapsRouteArgs>(name);
}

class JobMapsRouteArgs {
  const JobMapsRouteArgs({
    this.key,
    this.jobs,
    this.tasks,
    this.isEmbedded = false,
  });

  final Key? key;

  final List<JobInfoLevelModel>? jobs;

  final List<TaskInfoLevelModel>? tasks;

  final bool isEmbedded;

  @override
  String toString() {
    return 'JobMapsRouteArgs{key: $key, jobs: $jobs, tasks: $tasks, isEmbedded: $isEmbedded}';
  }
}

/// generated route for
/// [MessagesPage]
class MessagesRoute extends PageRouteInfo<void> {
  const MessagesRoute({List<PageRouteInfo>? children})
      : super(
          MessagesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessagesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuotesDetailsPage]
class QuotesDetailsRoute extends PageRouteInfo<QuotesDetailsRouteArgs> {
  QuotesDetailsRoute({
    Key? key,
    required int billableId,
    List<PageRouteInfo>? children,
  }) : super(
          QuotesDetailsRoute.name,
          args: QuotesDetailsRouteArgs(
            key: key,
            billableId: billableId,
          ),
          initialChildren: children,
        );

  static const String name = 'QuotesDetailsRoute';

  static const PageInfo<QuotesDetailsRouteArgs> page =
      PageInfo<QuotesDetailsRouteArgs>(name);
}

class QuotesDetailsRouteArgs {
  const QuotesDetailsRouteArgs({
    this.key,
    required this.billableId,
  });

  final Key? key;

  final int billableId;

  @override
  String toString() {
    return 'QuotesDetailsRouteArgs{key: $key, billableId: $billableId}';
  }
}

/// generated route for
/// [QuotesFilterPage]
class QuotesFilterRoute extends PageRouteInfo<QuotesFilterRouteArgs> {
  QuotesFilterRoute({
    Key? key,
    required bool isQuote,
    required bool isInvoice,
    required bool isOrder,
    required bool isSupplierInvoice,
    List<PageRouteInfo>? children,
  }) : super(
          QuotesFilterRoute.name,
          args: QuotesFilterRouteArgs(
            key: key,
            isQuote: isQuote,
            isInvoice: isInvoice,
            isOrder: isOrder,
            isSupplierInvoice: isSupplierInvoice,
          ),
          initialChildren: children,
        );

  static const String name = 'QuotesFilterRoute';

  static const PageInfo<QuotesFilterRouteArgs> page =
      PageInfo<QuotesFilterRouteArgs>(name);
}

class QuotesFilterRouteArgs {
  const QuotesFilterRouteArgs({
    this.key,
    required this.isQuote,
    required this.isInvoice,
    required this.isOrder,
    required this.isSupplierInvoice,
  });

  final Key? key;

  final bool isQuote;

  final bool isInvoice;

  final bool isOrder;

  final bool isSupplierInvoice;

  @override
  String toString() {
    return 'QuotesFilterRouteArgs{key: $key, isQuote: $isQuote, isInvoice: $isInvoice, isOrder: $isOrder, isSupplierInvoice: $isSupplierInvoice}';
  }
}

/// generated route for
/// [QuotesPage]
class QuotesRoute extends PageRouteInfo<QuotesRouteArgs> {
  QuotesRoute({
    Key? key,
    required String type,
    List<PageRouteInfo>? children,
  }) : super(
          QuotesRoute.name,
          args: QuotesRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'QuotesRoute';

  static const PageInfo<QuotesRouteArgs> page = PageInfo<QuotesRouteArgs>(name);
}

class QuotesRouteArgs {
  const QuotesRouteArgs({
    this.key,
    required this.type,
  });

  final Key? key;

  final String type;

  @override
  String toString() {
    return 'QuotesRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [QuotesSelectJobPage]
class QuotesSelectJobRoute extends PageRouteInfo<void> {
  const QuotesSelectJobRoute({List<PageRouteInfo>? children})
      : super(
          QuotesSelectJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuotesSelectJobRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecurrencePage]
class RecurrenceRoute extends PageRouteInfo<void> {
  const RecurrenceRoute({List<PageRouteInfo>? children})
      : super(
          RecurrenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecurrenceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddTaskPage]
class AddTaskRoute extends PageRouteInfo<AddTaskRouteArgs> {
  AddTaskRoute({
    Key? key,
    TaskInfoLevelModel? taskInfoLevel,
    String updateMode = '',
    List<PageRouteInfo>? children,
  }) : super(
          AddTaskRoute.name,
          args: AddTaskRouteArgs(
            key: key,
            taskInfoLevel: taskInfoLevel,
            updateMode: updateMode,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static const PageInfo<AddTaskRouteArgs> page =
      PageInfo<AddTaskRouteArgs>(name);
}

class AddTaskRouteArgs {
  const AddTaskRouteArgs({
    this.key,
    this.taskInfoLevel,
    this.updateMode = '',
  });

  final Key? key;

  final TaskInfoLevelModel? taskInfoLevel;

  final String updateMode;

  @override
  String toString() {
    return 'AddTaskRouteArgs{key: $key, taskInfoLevel: $taskInfoLevel, updateMode: $updateMode}';
  }
}

/// generated route for
/// [TaskFilterPage]
class TaskFilterRoute extends PageRouteInfo<void> {
  const TaskFilterRoute({List<PageRouteInfo>? children})
      : super(
          TaskFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskFilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaskDetailsPage]
class TaskDetailsRoute extends PageRouteInfo<TaskDetailsRouteArgs> {
  TaskDetailsRoute({
    Key? key,
    required TaskInfoLevelModel task,
    List<PageRouteInfo>? children,
  }) : super(
          TaskDetailsRoute.name,
          args: TaskDetailsRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskDetailsRoute';

  static const PageInfo<TaskDetailsRouteArgs> page =
      PageInfo<TaskDetailsRouteArgs>(name);
}

class TaskDetailsRouteArgs {
  const TaskDetailsRouteArgs({
    this.key,
    required this.task,
  });

  final Key? key;

  final TaskInfoLevelModel task;

  @override
  String toString() {
    return 'TaskDetailsRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [ScheduledTaskPage]
class ScheduledTaskRoute extends PageRouteInfo<ScheduledTaskRouteArgs> {
  ScheduledTaskRoute({
    Key? key,
    bool isFromJobs = false,
    bool isFromMenu = false,
    int? jobId,
    List<PageRouteInfo>? children,
  }) : super(
          ScheduledTaskRoute.name,
          args: ScheduledTaskRouteArgs(
            key: key,
            isFromJobs: isFromJobs,
            isFromMenu: isFromMenu,
            jobId: jobId,
          ),
          initialChildren: children,
        );

  static const String name = 'ScheduledTaskRoute';

  static const PageInfo<ScheduledTaskRouteArgs> page =
      PageInfo<ScheduledTaskRouteArgs>(name);
}

class ScheduledTaskRouteArgs {
  const ScheduledTaskRouteArgs({
    this.key,
    this.isFromJobs = false,
    this.isFromMenu = false,
    this.jobId,
  });

  final Key? key;

  final bool isFromJobs;

  final bool isFromMenu;

  final int? jobId;

  @override
  String toString() {
    return 'ScheduledTaskRouteArgs{key: $key, isFromJobs: $isFromJobs, isFromMenu: $isFromMenu, jobId: $jobId}';
  }
}

/// generated route for
/// [TimesheetDetailsPage]
class TimesheetDetailsRoute extends PageRouteInfo<TimesheetDetailsRouteArgs> {
  TimesheetDetailsRoute({
    Key? key,
    required ListWeeklySummaryModel datum,
    List<PageRouteInfo>? children,
  }) : super(
          TimesheetDetailsRoute.name,
          args: TimesheetDetailsRouteArgs(
            key: key,
            datum: datum,
          ),
          initialChildren: children,
        );

  static const String name = 'TimesheetDetailsRoute';

  static const PageInfo<TimesheetDetailsRouteArgs> page =
      PageInfo<TimesheetDetailsRouteArgs>(name);
}

class TimesheetDetailsRouteArgs {
  const TimesheetDetailsRouteArgs({
    this.key,
    required this.datum,
  });

  final Key? key;

  final ListWeeklySummaryModel datum;

  @override
  String toString() {
    return 'TimesheetDetailsRouteArgs{key: $key, datum: $datum}';
  }
}

/// generated route for
/// [TimeSheetPage]
class TimeSheetRoute extends PageRouteInfo<void> {
  const TimeSheetRoute({List<PageRouteInfo>? children})
      : super(
          TimeSheetRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimeSheetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    Key? key,
    required String subscriptionName,
    List<PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(
            key: key,
            subscriptionName: subscriptionName,
          ),
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const PageInfo<UserProfileRouteArgs> page =
      PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({
    this.key,
    required this.subscriptionName,
  });

  final Key? key;

  final String subscriptionName;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, subscriptionName: $subscriptionName}';
  }
}

/// generated route for
/// [TabManagerPage]
class TabManagerRoute extends PageRouteInfo<void> {
  const TabManagerRoute({List<PageRouteInfo>? children})
      : super(
          TabManagerRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabManagerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
