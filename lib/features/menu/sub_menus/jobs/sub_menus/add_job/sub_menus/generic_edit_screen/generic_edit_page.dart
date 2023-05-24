import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_edit_screen/editable_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/job_generic_state.dart';
import 'package:nextminute/features/wigdets/bottom_action_panel/nm_bottom_action_button.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class GenericEditPage<C extends StateStreamable<S>, S, T>
    extends StatefulWidget {
  const GenericEditPage({super.key});

  @override
  State<GenericEditPage<C, S, T>> createState() => _GenericEditPageState();
}

class _GenericEditPageState<C extends StateStreamable<S>, S, T>
    extends State<GenericEditPage<C, S, T>> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _addNewItemController;

  @override
  void initState() {
    super.initState();
    _addNewItemController = TextEditingController();

    if (mounted) {
      (context.read<C>() as dynamic).fetchItems();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _addNewItemController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        actions: [
          BlocConsumer<C, S>(
            listener: (context, state) {
              if ((state as dynamic).saveStatus == SaveStatus.success) {
                unawaited(
                  (context.read<C>() as dynamic).fetchItems() as Future,
                );
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              if ((state as dynamic).saveStatus == SaveStatus.loading) {
                return const NMSmallLoadingIndicator();
              }

              return NMCupertinoButton(
                key: const Key('saveButton'),
                child: const Text('Save'),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  (context.read<C>() as dynamic).updateitems();
                },
              );
            },
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          unawaited((context.read<C>() as dynamic).fetchItems() as Future);
          return true;
        },
        child: NMBlocConsumer<C, S>(
          builder: (BuildContext context, state) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: AlwaysScroll(
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount:
                                ((state as dynamic).items?.length ?? 0) as int,
                            itemBuilder: (context, index) {
                              final item = state.items![index];

                              return EditableItem<C, S, T>(
                                key: Key(item.id.toString()),
                                status: item as T,
                                onPressed: ((item as dynamic)?.isdeleted ??
                                        false) as bool
                                    ? null
                                    : () {
                                        if (((item.id ?? -1) as int) < 0) {
                                          (context.read<C>() as dynamic)
                                              .removeAddedItem(
                                            item.id ?? -1,
                                          );
                                          return;
                                        }
                                        (context.read<C>() as dynamic)
                                            .markAsDeleted(item);
                                      },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  NMBottomMenuActions(
                    actionButton: NMBottomActionButton(
                      label: 'Add',
                      onPressed: () =>
                          (context.read<C>() as dynamic).addNewItem(),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
