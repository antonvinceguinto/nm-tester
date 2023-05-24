import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';

class ContactAddress extends StatefulWidget {
  const ContactAddress({
    super.key,
    required this.contactDetail,
  });

  final CustomerDatum contactDetail;

  @override
  State<ContactAddress> createState() => _ContactAddressState();
}

class _ContactAddressState extends State<ContactAddress> {
  bool isGettingDirections = false;

  @override
  Widget build(BuildContext context) {
    final hasAddress = widget.contactDetail.contact_address != null &&
        widget.contactDetail.contact_address != 'Not Assigned' &&
        widget.contactDetail.contact_address!.trim().isNotEmpty;

    return Column(
      children: [
        if (!hasAddress)
          const SizedBox.shrink()
        else
          GestureDetector(
            onTap: () {
              context.router.push(
                ContactMapRoute(
                  contacts: [widget.contactDetail],
                ),
              );
            },
            child: Container(
              color: Colors.grey[300],
              height: 150,
              child: ContactMapPage(
                contacts: [widget.contactDetail],
                isEmbedded: true,
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Physical Address',
                      style: _boldText,
                    ),
                    Text(
                      (widget.contactDetail.contact_address != null &&
                              widget.contactDetail.contact_address!.isEmpty)
                          ? 'Not Assigned'
                          : widget.contactDetail.contact_address!,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: !hasAddress
                    ? const SizedBox.shrink()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.router.push(
                                ContactMapRoute(
                                  contacts: [widget.contactDetail],
                                ),
                              );
                            },
                            key: const Key('__view_on_map_btn__'),
                            child: const Text('View on Map'),
                          ),
                          TextButton(
                            onPressed: isGettingDirections
                                ? null
                                : () async {
                                    setState(() {
                                      isGettingDirections = true;
                                    });
                                    await JobsHelper.getDirections(
                                      context,
                                      widget.contactDetail.contact_address!,
                                    );
                                    setState(() {
                                      isGettingDirections = false;
                                    });
                                  },
                            child: isGettingDirections
                                ? Container(
                                    width: 20,
                                    alignment: Alignment.centerRight,
                                    child: const NMSmallLoadingIndicator(
                                      color: NMColors.orange,
                                      margin: EdgeInsets.zero,
                                    ),
                                  )
                                : const Text('Get Directions'),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextStyle? get _boldText => NMTextStyles.b2(context)?.copyWith(
        fontWeight: FontWeight.bold,
      );
}
