import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';

class CDHeader extends StatefulWidget {
  const CDHeader({
    super.key,
    required this.contactDetails,
  });

  final CustomerDatum contactDetails;

  @override
  State<CDHeader> createState() => CDHeaderState();
}

class CDHeaderState extends State<CDHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEDB587),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        leading: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(NMBorderRadius.defaultBorderRadius),
            ),
          ),
          child: Center(
            child: Text(
              widget.contactDetails.contact_initials ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.contactDetails.contact_code != null) ...{
              Text(
                widget.contactDetails.contact_code!,
              ),
            },
            if (widget.contactDetails.contact_name_display != null) ...{
              Text(widget.contactDetails.contact_name_display!)
            },
            if (widget.contactDetails.contact_name_business != null) ...{
              Text(widget.contactDetails.contact_name_business!)
            },
          ],
        ),
      ),
    );
  }
}
