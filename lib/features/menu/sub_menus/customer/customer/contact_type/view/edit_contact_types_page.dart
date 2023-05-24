import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/widgets/contact_type_field.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class EditContactTypesPage extends StatelessWidget {
  const EditContactTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditContactTypesView();
  }
}

class EditContactTypesView extends StatefulWidget {
  const EditContactTypesView({super.key});

  @override
  State<EditContactTypesView> createState() => _EditContactTypesViewState();
}

class _EditContactTypesViewState extends State<EditContactTypesView> {
  late TextEditingController _addContactTypeController;

  @override
  void initState() {
    super.initState();
    _addContactTypeController = TextEditingController();

    if (mounted) {
      context.read<ContactTypesBloc>().add(
            const ContactTypesFetchEvent(),
          );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _addContactTypeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact Types'),
        actions: [
          NMCupertinoButton(
            key: const ValueKey('doneButton'),
            child: const Icon(Icons.done),
            onPressed: () async {
              final bloc = context.read<ContactTypesBloc>();

              bloc.add(
                RequestUpdateContactTypesEvent(
                  contactTypes: bloc.state.editableContactTypes!,
                ),
              );

              if (mounted) {
                Navigator.of(context).pop('Apply');
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<ContactTypesBloc, ContactTypesState>(
        builder: (context, state) {
          if (state.status == GenericRequestStatusEnum.loading) {
            return const Center(child: NMLoadingWidget());
          }

          if (state.status == GenericRequestStatusEnum.error) {
            return const Center(child: NMErrorState());
          }

          return AlwaysScroll(
            child: Column(
              children: [
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.editableContactTypes?.length ?? 0,
                  itemBuilder: (context, index) {
                    final contactType = state.editableContactTypes![index];

                    return ListTile(
                      title: ContactTypeField(
                        key: ValueKey(contactType.contacttype_id.toString()),
                        contactType: contactType,
                        initialTitle: contactType.contacttype_name,
                        onDelete: () {
                          // deletes newly added contact types
                          if (contactType.contacttype_id == null ||
                              (contactType.contacttype_id ?? 0) < 0) {
                            context.read<ContactTypesBloc>().add(
                                  RemoveContactTypeEvent(contactType),
                                );
                            setState(() {});
                            return;
                          }

                          // set the contact type to deleted
                          context.read<ContactTypesBloc>().add(
                                MarkAsDeletedEvent(
                                  contactType,
                                ),
                              );
                        },
                      ),
                    ).paddingSymmetric(vertical: 2);
                  },
                ),
                const Divider(),
                TextField(
                  key: const ValueKey('addContactTypeTextField'),
                  controller: _addContactTypeController,
                  decoration: InputDecoration(
                    labelText: 'Add Contact Type',
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: NMCupertinoButton(
                      key: const ValueKey('addContactTypeButton'),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (_addContactTypeController.text.trim().isEmpty) {
                          return;
                        }

                        final state = context.read<ContactTypesBloc>().state;

                        final newCT = ContactTypeModel(
                          contacttype_name: _addContactTypeController.text,
                          // use negative numbers for new contact types
                          contacttype_id:
                              -1 * (state.editableContactTypes!.length + 1),
                        );

                        final isDuplicate = state.editableContactTypes!
                            .map(
                              (e) =>
                                  e.contacttype_name == newCT.contacttype_name,
                            )
                            .contains(true);

                        if (state.editableContactTypes!.contains(newCT) ||
                            isDuplicate) {
                          showOkAlertDialog(
                            context: context,
                            title: 'Oops!',
                            message: 'Contact type already exists. Please '
                                'choose a different name.',
                          );
                          return;
                        }

                        context.read<ContactTypesBloc>().add(
                              AddContactTypeEvent(
                                newCT,
                              ),
                            );

                        setState(_addContactTypeController.clear);
                      },
                      child: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ).paddingSymmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}
