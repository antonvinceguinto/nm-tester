import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/acceptance_status/cubit/acceptance_status_cubit.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class AcceptanceStatusPage extends StatelessWidget {
  const AcceptanceStatusPage({
    super.key,
    required this.acceptanceComment,
    required this.acceptanceStatus,
    required this.id,
    this.isTask = false,
  });

  final String? acceptanceComment;
  final String? acceptanceStatus;
  final int id;
  final bool isTask;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AcceptanceStatusCubit>(
      create: (_) => AcceptanceStatusCubit(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      ),
      child: AcceptanceStatusView(
        acceptanceComment: acceptanceComment,
        acceptanceStatus: acceptanceStatus,
        id: id,
        isTask: isTask,
      ),
    );
  }
}

class AcceptanceStatusView extends StatefulWidget {
  const AcceptanceStatusView({
    super.key,
    required this.acceptanceComment,
    required this.acceptanceStatus,
    required this.id,
    required this.isTask,
  });

  final String? acceptanceComment;
  final String? acceptanceStatus;
  final int id;
  final bool isTask;

  @override
  State<AcceptanceStatusView> createState() => _AcceptanceStatusViewState();
}

class _AcceptanceStatusViewState extends State<AcceptanceStatusView> {
  late TextEditingController _responseController;
  String? currentAcceptanceStatus;

  @override
  void initState() {
    super.initState();
    currentAcceptanceStatus = widget.acceptanceStatus;
    _responseController = TextEditingController(text: widget.acceptanceComment);
  }

  @override
  void dispose() {
    super.dispose();
    _responseController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acceptance Status'),
        actions: [
          BlocBuilder<AcceptanceStatusCubit, AcceptanceStatusState>(
            builder: (context, state) => NMCupertinoButton(
              onPressed: state.status == GenericRequestStatusEnum.loading
                  ? null
                  : () async {
                      var acceptanceStatusInitial = '';

                      switch (currentAcceptanceStatus) {
                        case 'Accepted':
                          acceptanceStatusInitial = 'A';
                          break;
                        case 'Tentative':
                          acceptanceStatusInitial = 'T';
                          break;
                        case 'Reject':
                          acceptanceStatusInitial = 'R';
                          break;
                        default:
                          acceptanceStatusInitial = 'A';
                      }

                      await context
                          .read<AcceptanceStatusCubit>()
                          .updateAcceptanceResponse(
                            acceptanceStatusInitial,
                            _responseController.text.trim(),
                            widget.id,
                            isTask: widget.isTask,
                          );

                      if (mounted) {
                        Navigator.of(context).pop('Save');
                      }
                    },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
      body: AlwaysScroll(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAcceptanceButton(
                      'Accept',
                      Colors.green,
                    ),
                    const SizedBox(width: 8),
                    _buildAcceptanceButton(
                      'Tentative',
                      NMColors.tentative,
                    ),
                    const SizedBox(width: 8),
                    _buildAcceptanceButton(
                      'Reject',
                      Colors.red,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _responseController,
                  maxLines: 8,
                ),
              ],
            ).paddingSymmetric(horizontal: 8),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              width: double.infinity,
              color: const Color.fromARGB(255, 7, 34, 56),
              child: Text(
                'Recent Responses',
                style: NMTextStyles.b2(context)?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            NMBlocConsumer<AcceptanceStatusCubit, AcceptanceStatusState>(
              loadingWidget: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              builder: (context, state) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 2,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.recentResponses?.length ?? 0,
                  itemBuilder: (context, index) {
                    final response = state.recentResponses![index];
                    return ListTile(
                      title: Text(response),
                      onTap: () {
                        setState(() {
                          _responseController.text = response;
                        });
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAcceptanceButton(
    String label,
    Color color,
  ) {
    if (currentAcceptanceStatus == 'Accepted') {
      currentAcceptanceStatus = 'Accept';
    } else if (currentAcceptanceStatus == 'Rejected') {
      currentAcceptanceStatus = 'Reject';
    }

    final isSelected = currentAcceptanceStatus == label;

    return Expanded(
      child: Builder(
        builder: (context) => InkWell(
          onTap: () {
            setState(() {
              currentAcceptanceStatus = label;
            });
          },
          borderRadius: BorderRadius.circular(4),
          child: Ink(
            decoration: BoxDecoration(
              color: isSelected ? color : color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Center(
                child: Text(
                  label,
                  style: NMTextStyles.b2(context)?.copyWith(
                    color: color.isDark() ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
