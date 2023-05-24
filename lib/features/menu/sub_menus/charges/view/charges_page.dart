import 'dart:math' as math;
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/charges/bloc/charges_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/charges/widgets/charges_item.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

enum BillableTypeEnum {
  time,
  product,
  disbursement,
  other;

  @override
  String toString() {
    switch (this) {
      case BillableTypeEnum.time:
        return 'time';
      case BillableTypeEnum.product:
        return 'product';
      case BillableTypeEnum.disbursement:
        return 'disbursement';
      case BillableTypeEnum.other:
        return 'other';
    }
  }

  String get name {
    switch (this) {
      case BillableTypeEnum.time:
        return 'Labour';
      case BillableTypeEnum.product:
        return 'Materials';
      case BillableTypeEnum.disbursement:
        return 'Disbursements';
      case BillableTypeEnum.other:
        return 'Other';
    }
  }

  Color get color {
    switch (this) {
      case BillableTypeEnum.time:
        return Colors.green.shade700;
      case BillableTypeEnum.product:
        return Colors.blue;
      case BillableTypeEnum.disbursement:
        return Colors.amber.shade600;
      case BillableTypeEnum.other:
        return Colors.pink;
    }
  }

  String get letter {
    switch (this) {
      case BillableTypeEnum.time:
        return 'L';
      case BillableTypeEnum.product:
        return 'M';
      case BillableTypeEnum.disbursement:
        return 'D';
      case BillableTypeEnum.other:
        return 'O';
    }
  }
}

@RoutePage()
class ChargesPage extends StatelessWidget {
  const ChargesPage({
    super.key,
    required this.job,
    required this.task,
    required this.scrollToHeader,
  });

  final JobInfoLevelModel? job;
  final TaskInfoLevelModel? task;

  final String? scrollToHeader;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChargesBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(
          ChargesFetchEvent(
            id: job?.job_id ?? task!.book_id!,
            isJob: job != null,
          ),
        ),
      child: ChargesView(
        job: job,
        task: task,
        scrollToHeader: scrollToHeader,
      ),
    );
  }
}

class ChargesView extends StatefulWidget {
  const ChargesView({
    super.key,
    required this.job,
    required this.task,
    required this.scrollToHeader,
  });

  final JobInfoLevelModel? job;
  final TaskInfoLevelModel? task;

  final String? scrollToHeader;

  @override
  State<ChargesView> createState() => _ChargesViewState();
}

class _ChargesViewState extends State<ChargesView> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _labourKey = GlobalKey();
  final GlobalKey _materialsKey = GlobalKey();
  final GlobalKey _disbursementsKey = GlobalKey();
  final GlobalKey _othersKey = GlobalKey();

  bool _hasScrolled = false;

  void _scrollToHeader(String? headerKey) {
    if (headerKey == null) return;

    GlobalKey? targetKey;
    switch (headerKey) {
      case 'Labour':
        targetKey = _labourKey;
        break;
      case 'Materials':
        targetKey = _materialsKey;
        break;
      case 'Disbursements':
        targetKey = _disbursementsKey;
        break;
      case 'Other':
        targetKey = _othersKey;
        break;
      default:
        targetKey = _labourKey;
        break;
    }

    final targetBox =
        targetKey.currentContext!.findRenderObject()! as RenderBox;
    final targetPosition = targetBox.localToGlobal(Offset.zero).dy;
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    const appBarHeight = kToolbarHeight;
    final availableHeight = screenHeight - statusBarHeight - appBarHeight;

    var scrollToPosition =
        targetPosition - (availableHeight / 2) + (targetBox.size.height / 2);

    // Ensure the calculated position is within the scrollable area
    scrollToPosition =
        math.max(scrollToPosition, _scrollController.position.minScrollExtent);
    scrollToPosition =
        math.min(scrollToPosition, _scrollController.position.maxScrollExtent);

    _scrollController.animateTo(
      scrollToPosition,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.job != null ? 'Job Charges' : 'Task Charges',
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: Colors.grey.shade700,
            child: Text(
              'Charges Summary for '
              '${widget.job?.job_number ?? widget.task?.book_number}',
              style: NMTextStyles.caption(context)?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<ChargesBloc>().add(
                      ChargesFetchEvent(
                        id: widget.job?.job_id ?? widget.task!.book_id!,
                        isJob: widget.job != null,
                      ),
                    );
              },
              child: NMBlocConsumer<ChargesBloc, ChargesState>(
                onSuccess: (state) {
                  if (state.status == GenericRequestStatusEnum.success &&
                      !_hasScrolled) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToHeader(widget.scrollToHeader);
                    });
                    _hasScrolled = true;
                  }
                },
                builder: (context, state) {
                  if (state.status == GenericRequestStatusEnum.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final billableModel =
                      state.billable ?? const BillableInfoLevelModel();

                  List<BillableInfoLevelItem> filterItemsByType(String type) {
                    return billableModel.billableItems
                        .where(
                          (element) =>
                              element.billableitem_type == type &&
                              (element.target_billableitem_summaries?.isEmpty ??
                                  false),
                        )
                        .toList();
                  }

                  final labours = filterItemsByType(
                    BillableTypeEnum.time.toString(),
                  );
                  final materials = filterItemsByType(
                    BillableTypeEnum.product.toString(),
                  );
                  final disbursements = filterItemsByType(
                    BillableTypeEnum.disbursement.toString(),
                  );
                  final others = filterItemsByType('');

                  return SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(
                          'Labour',
                          Colors.green.shade700,
                          key: _labourKey,
                        ),
                        buildListView(labours, BillableTypeEnum.time),
                        _addButton(
                          'Add Labour',
                          onPressed: () {},
                        ),
                        _header('Materials', Colors.blue, key: _materialsKey),
                        buildListView(materials, BillableTypeEnum.product),
                        _addButton(
                          'Add Materials',
                          onPressed: () {},
                        ),
                        _header(
                          'Disbursements',
                          Colors.amber.shade600,
                          key: _disbursementsKey,
                        ),
                        buildListView(
                          disbursements,
                          BillableTypeEnum.disbursement,
                        ),
                        _addButton(
                          'Add Disbursements',
                          onPressed: () {},
                        ),
                        _header('Other', Colors.pink, key: _othersKey),
                        buildListView(others, BillableTypeEnum.other),
                        _addButton(
                          'Other',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          NMBottomMenuActions(
            actionsPanel: NMActionList(
              actions: [
                if (context.read<MainMenuBloc>().state.isChargeAddEditEnabled)
                  const NMActionItem(
                    label: 'Create Invoice',
                    icon: FontAwesomeIcons.dollarSign,
                  ),
                const NMActionItem(
                  label: 'Delete Selected Items',
                  icon: FontAwesomeIcons.xmark,
                ),
                const NMActionItem(
                  label: 'Import Items',
                  icon: FontAwesomeIcons.fileImport,
                ),
                NMActionItem(
                  onTap: () {
                    final cb = context.read<ChargesBloc>();

                    cb.add(
                      ChargesSelectAllEvent(
                        billableItems: cb.state.billable!.billableItems,
                      ),
                    );
                  },
                  label: 'Select all',
                  icon: FontAwesomeIcons.checkDouble,
                ),
                const NMActionItem(
                  label: 'Select none',
                  icon: FontAwesomeIcons.square,
                ),
                const NMActionItem(
                  label: 'Sections View',
                  icon: Icons.list_alt_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListView(
    List<BillableInfoLevelItem> items,
    BillableTypeEnum type,
  ) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ChargesItem(
          type: type,
          billable: item,
        ).paddingAll(16);
      },
    );
  }

  Widget _header(String title, Color color, {Key? key}) {
    final isDarkMode = context.isDarkMode;

    return Container(
      key: key,
      height: 30,
      width: double.infinity,
      color: color,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: NMTextStyles.b2(context)?.copyWith(
                color: Colors.white,
              ),
            ).paddingSymmetric(
              horizontal: 8,
              vertical: 4,
            ),
          ),
          Container(
            color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
            height: double.infinity,
            child: const FaIcon(
              FontAwesomeIcons.plus,
              size: 14,
            ).paddingAll(8),
          ),
        ],
      ),
    );
  }

  Widget _addButton(String title, {void Function()? onPressed}) {
    final isDarkMode = context.isDarkMode;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: isDarkMode
                  ? MaterialStateProperty.all(Colors.grey.shade800)
                  : MaterialStateProperty.all(Colors.grey.shade300),
            ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.plus,
              color: isDarkMode ? Colors.white : NMColors.black,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: NMTextStyles.btn(context)?.copyWith(
                color: isDarkMode ? Colors.white : NMColors.black,
              ),
            ),
          ],
        ),
      ).paddingAll(16),
    );
  }
}
