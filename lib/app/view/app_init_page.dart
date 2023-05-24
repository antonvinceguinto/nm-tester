import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/features/auth/login/login.dart';
import 'package:nextminute/features/auth/pin/view/pin_page.dart';
import 'package:nextminute/features/tab_manager/view/tab_manager_page.dart';

@RoutePage()
class AppInitPage extends StatelessWidget {
  const AppInitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AppStatus>(
      state: context.select((AppBloc bloc) => bloc.state.status),
      onGeneratePages: (
        AppStatus status,
        List<Page<dynamic>> pages,
      ) {
        final authStatus = context.read<SharedPrefs>().authStatus;

        debugPrint('authStatus: $authStatus');

        // First app state
        if (authStatus == AppStatus.temporarilyAuthenticated.name ||
            status == AppStatus.temporarilyAuthenticated) {
          return [PinPage.page()];
        } else if (authStatus == AppStatus.unauthenticated.name ||
            status == AppStatus.unauthenticated) {
          return [LoginPage.page()];
        } else {
          return [TabManagerPage.page()];
        }
      },
    );
  }
}
