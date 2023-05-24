import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';

class NMScaffold extends StatelessWidget {
  const NMScaffold({
    super.key,
    required this.body,
    this.actions,
    this.bottomNavigationBar,
    this.leading,
  });

  final Widget body;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onLongPress: () {
            context.read<TabCubit>().toggleDarkMode();
          },
          child: Image.asset(
            'assets/images/logo/nm_text_logo.png',
            fit: BoxFit.cover,
            width: 140,
          ),
        ),
        leading: leading,
        actions: actions,
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: body,
    );
  }
}
