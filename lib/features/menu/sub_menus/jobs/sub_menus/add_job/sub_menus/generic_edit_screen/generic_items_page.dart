import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_edit_screen/generic_edit_page.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class GenericItemsPage<C extends StateStreamable<S>, S, T>
    extends StatefulWidget {
  const GenericItemsPage({
    super.key,
    this.isJobDetailsEdit = false,
  });

  // final void Function(FStatusModel)? onSelect;
  final bool isJobDetailsEdit;

  @override
  State<GenericItemsPage<C, S, T>> createState() => _GenericItemsPageState();
}

class _GenericItemsPageState<C extends StateStreamable<S>, S, T>
    extends State<GenericItemsPage<C, S, T>> {
  @override
  void initState() {
    super.initState();
    (context.read<C>() as dynamic).fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle),
        actions: [
          if (context.read<MainMenuBloc>().state.isAdmin)
            NMCupertinoButton(
              key: const Key('__editButton__'),
              child: const Text('Edit'),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => GenericEditPage<C, S, T>(),
                  ),
                );
              },
            ),
        ],
      ),
      body: NMBlocConsumer<C, S>(
        builder: (BuildContext context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              (context.read<C>() as dynamic).fetchItems();
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: ((state as dynamic).items?.length ?? 0) as int,
              itemBuilder: (BuildContext context, int index) {
                final item = state.items![index];

                Color? color = Colors.white;

                if (item?.color != null) {
                  color = Color(item?.color.toString().toHexColor() ?? 0);
                }

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ListTile(
                    onTap: widget.isJobDetailsEdit
                        ? () => Navigator.of(context).pop('${item.id}')
                        : () {
                            (context.read<C>() as dynamic).selectItem(item);
                            Navigator.of(context).pop();
                          },
                    title: Text(
                      item.name!.toString(),
                      style: NMTextStyles.b2(context)?.copyWith(
                        color: color.isDark() ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  String get getTitle {
    switch (C) {
      case JobStatusCubit:
        return 'Job Status';
      case JobTypeCubit:
        return 'Job Type';
      case PricingTypeCubit:
        return 'Pricing';
      case PriorityCubit:
        return 'Priority';
      default:
        return 'Items';
    }
  }
}
