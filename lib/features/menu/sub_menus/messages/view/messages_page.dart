import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/messages/bloc/messages_bloc.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: MessagesBloc(),
      child: const MessagesView(),
    );
  }
}

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                NMSearchField(
                  searchController: _searchController,
                  onChanged: (val) {},
                  onClear: () {},
                ),
              ],
            ),
          ),
          const NMBottomMenuActions(
            actionsPanel: NMActionList(
              actions: [],
            ),
          ),
        ],
      ),
    );
  }
}
