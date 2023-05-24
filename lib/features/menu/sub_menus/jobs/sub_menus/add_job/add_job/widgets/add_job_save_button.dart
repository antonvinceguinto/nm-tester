import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/bloc/add_job_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class AddJobSaveButton extends StatelessWidget {
  const AddJobSaveButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddJobBloc, AddJobState>(
      listener: (context, state) {
        if (state.status == GenericRequestStatusEnum.success) {
          context.router.pop('added');
        }

        if (state.status == GenericRequestStatusEnum.error) {
          showOkAlertDialog(
            context: context,
            message: state.errorMessage,
            title: 'Oops!',
          );
        }
      },
      builder: (context, state) {
        if (state.status == GenericRequestStatusEnum.loading) {
          return const NMSmallLoadingIndicator();
        }
        return NMCupertinoButton(
          onPressed: onPressed,
          child: const Text('Save'),
        );
      },
    );
  }
}
