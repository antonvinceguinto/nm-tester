import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_loading_widget.dart';

class NMPaginateScaffold<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  const NMPaginateScaffold({
    super.key,
    required this.appBar,
    required this.body,
  });

  final AppBar appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          body,
          BlocBuilder<B, S>(
            builder: (
              context,
              state,
            ) {
              if ((state as dynamic).status ==
                  GenericRequestStatusEnum.loading) {
                return Center(
                  child: NMLoadingWidget(
                    loadingIndicator: const CircularProgressIndicator(),
                    bgColor: Colors.black.withOpacity(0.05),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
