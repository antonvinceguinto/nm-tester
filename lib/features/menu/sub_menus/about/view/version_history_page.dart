import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/about/bloc/version_history_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class VersionHistoryPage extends StatelessWidget {
  const VersionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VersionHistoryBloc>(
      create: (context) => VersionHistoryBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(
          const VersionHistoryEvent(versionId: '22.12.2.1'),
        ),
      child: const VersionHistoryView(),
    );
  }
}

class VersionHistoryView extends StatelessWidget {
  const VersionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Version History'),
      ),
      body: AlwaysScroll(
        child: NMBlocConsumer<VersionHistoryBloc, VersionHistoryState>(
          builder: (context, state) {
            if (state.status == GenericRequestStatusEnum.loading ||
                state.versionHistory == null) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final versionHistory = state.versionHistory;

            return Column(
              children: [
                const SizedBox(height: 16),
                ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: versionHistory!.length,
                  itemBuilder: (context, index) {
                    final version = versionHistory[index];
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '''What's New in Nextminute ${version.appversion_version} (${DateFormat('dd MMM yyyy').format(version.appversion_date!)})''',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 16),
                          HtmlWidget(
                            version.appversion_html,
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ).paddingAll(16),
                    ).paddingSymmetric(horizontal: 8);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
