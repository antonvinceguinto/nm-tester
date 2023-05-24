import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class ContactTypesPage extends StatelessWidget {
  const ContactTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactTypesBloc>.value(
      value: context.read<ContactTypesBloc>()
        ..add(const ContactTypesFetchEvent()),
      child: const ContactTypesView(),
    );
  }
}

class ContactTypesView extends StatefulWidget {
  const ContactTypesView({super.key});

  @override
  State<ContactTypesView> createState() => _ContactTypesViewState();
}

class _ContactTypesViewState extends State<ContactTypesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Types'),
        actions: [
          if (context.read<MainMenuBloc>().state.isAdmin)
            NMCupertinoButton(
              key: const ValueKey('contactTypesPage_editButton'),
              child: const Text('Edit'),
              onPressed: () async {
                final res =
                    await context.router.push(const EditContactTypesRoute());

                if (res == 'Apply') {
                  Future.delayed(
                    const Duration(milliseconds: 300),
                    () {
                      context.read<ContactTypesBloc>().add(
                            const ContactTypesFetchEvent(),
                          );
                    },
                  );
                }
              },
            ),
        ],
      ),
      body: NMBlocConsumer<ContactTypesBloc, ContactTypesState>(
        builder: (context, state) {
          return AlwaysScroll(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.contactTypes.length,
                  itemBuilder: (context, index) {
                    final contactType = state.contactTypes[index];

                    /// Make Customer default
                    if (contactType.contacttype_isdefault! &&
                        !state.selectedContactTypes.contains(contactType) &&
                        state.selectedContactTypes.isEmpty) {
                      context.read<ContactTypesBloc>().add(
                            ContactTypesAddEvent(
                              contactType: contactType,
                            ),
                          );
                    }

                    return CheckboxListTile(
                      key: ValueKey(contactType.contacttype_id),
                      title: Text(contactType.contacttype_name ?? ''),
                      value: state.selectedContactTypes.contains(contactType),
                      onChanged: (value) {
                        if (state.selectedContactTypes.contains(contactType)) {
                          context.read<ContactTypesBloc>().add(
                                ContactTypesRemoveEvent(
                                  contactType: contactType,
                                ),
                              );
                        } else {
                          context.read<ContactTypesBloc>().add(
                                ContactTypesAddEvent(
                                  contactType: contactType,
                                ),
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
