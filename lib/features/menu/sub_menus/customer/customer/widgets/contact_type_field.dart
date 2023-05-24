import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class ContactTypeField extends StatefulWidget {
  const ContactTypeField({
    super.key,
    this.onDelete,
    required this.contactType,
    this.initialTitle,
  });

  final void Function()? onDelete;
  final ContactTypeModel contactType;
  final String? initialTitle;

  @override
  State<ContactTypeField> createState() => _ContactTypeFieldState();
}

class _ContactTypeFieldState extends State<ContactTypeField> {
  @override
  Widget build(BuildContext context) {
    final isDeleted = widget.contactType.isdeleted ?? false;
    final isBuiltIn = widget.contactType.contacttype_isbuiltin ?? false;

    return IgnorePointer(
      ignoring: isBuiltIn || isDeleted,
      child: TextField(
        controller: TextEditingController(
          text: isDeleted
              ? '${widget.contactType.contacttype_name} (Deleted)'
              : widget.contactType.contacttype_name,
        ),
        enabled: !isBuiltIn && !isDeleted,
        onChanged: (value) {
          if (isBuiltIn) {
            return;
          }
          final contactTypes = context.read<ContactTypesBloc>().state;

          final newContactType = ContactTypeModel(
            contacttype_name: value,
            contacttype_id: widget.contactType.contacttype_id,
          );

          // Editing old contact type
          if (widget.contactType.contacttype_id != null) {
            final index = contactTypes.editableContactTypes!.indexWhere(
              (element) =>
                  element.contacttype_id == widget.contactType.contacttype_id,
            );

            contactTypes.editableContactTypes![index] = newContactType;

            return;
          }
        },
        style: NMTextStyles.b2(context)?.copyWith(
          decoration: (widget.contactType.isdeleted ?? false)
              ? TextDecoration.lineThrough
              : null,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.contactType.contacttype_isbuiltin! ||
                  (widget.contactType.isdeleted ?? false)
              ? Colors.grey.shade200
              : Colors.white,
          suffixIcon: isBuiltIn
              ? _buildSuffixContainer('Built-in')
              : isDeleted
                  ? _buildSuffixContainer('Save to confirm')
                  : NMCupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: widget.onDelete,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
        ),
      ),
    );
  }

  Widget _buildSuffixContainer(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          textAlign: TextAlign.end,
          style: NMTextStyles.b2(context)?.copyWith(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    ).paddingOnly(right: 8);
  }
}
