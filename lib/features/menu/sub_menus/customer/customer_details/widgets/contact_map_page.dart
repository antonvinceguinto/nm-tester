import 'dart:async';

import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/widgets/customer_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/utils/jobs_helper.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class ContactMapPage extends StatefulWidget {
  const ContactMapPage({
    super.key,
    required this.contacts,
    this.isEmbedded = false,
  });

  final List<CustomerDatum> contacts;
  final bool isEmbedded;

  @override
  State<ContactMapPage> createState() => _ContactMapPageState();
}

class _ContactMapPageState extends State<ContactMapPage> {
  final Set<Marker> _markers = {};

  bool isLoading = true;

  late CustomInfoWindowController _customInfoWindowController;

  late final CameraPosition _aucklandPos = const CameraPosition(
    target: LatLng(-36.848461, 174.7645),
    zoom: 3,
  );

  @override
  void initState() {
    super.initState();
    _customInfoWindowController = CustomInfoWindowController();
  }

  Future<void> _initMarkers() async {
    if (widget.contacts.isEmpty) return;

    final markers = <Marker>[];

    for (final contact in widget.contacts) {
      final address = contact.contact_address;
      if (address != null && address.isNotEmpty) {
        final latLng = await JobsHelper.getAddressCoords(address: address);
        markers.add(
          Marker(
            markerId: MarkerId(latLng.toString()),
            position: latLng,
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                _buildContent(contact),
                latLng,
              );
            },
          ),
        );
      }
    }

    _markers.addAll(markers);

    if (!widget.isEmbedded && widget.contacts.length == 1) {
      // Add info window on start
      _customInfoWindowController.addInfoWindow!(
        _buildContent(widget.contacts[0]),
        LatLng(
          _markers.first.position.latitude,
          _markers.first.position.longitude,
        ),
      );
    }

    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _customInfoWindowController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isEmbedded
          ? null
          : AppBar(
              title: const Text('Contact Maps'),
            ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                IgnorePointer(
                  ignoring: widget.isEmbedded,
                  child: GoogleMap(
                    initialCameraPosition: _aucklandPos,
                    onTap: widget.isEmbedded
                        ? null
                        : (position) {
                            _customInfoWindowController.hideInfoWindow!();
                          },
                    onCameraMove: (position) {
                      if (_customInfoWindowController.onCameraMove != null) {
                        _customInfoWindowController.onCameraMove!.call();
                      }
                    },
                    onMapCreated: (GoogleMapController controller) async {
                      _customInfoWindowController.googleMapController =
                          controller;
                      await _initMarkers();
                    },
                    markers: !isLoading ? _markers : {},
                    myLocationButtonEnabled: !widget.isEmbedded,
                    myLocationEnabled: !widget.isEmbedded,
                    mapToolbarEnabled: !widget.isEmbedded,
                    zoomControlsEnabled: !widget.isEmbedded,
                  ),
                ),
                CustomInfoWindow(
                  controller: _customInfoWindowController,
                  offset: 0,
                  width: 300,
                  height: 230,
                ),
                if (isLoading)
                  widget.isEmbedded
                      ? const SizedBox.shrink()
                      : Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const NMSmallLoadingIndicator(
                              margin: EdgeInsets.zero,
                              color: NMColors.orange,
                            ),
                          ),
                        ),
              ],
            ),
          ),
          if (!widget.isEmbedded) const NMBottomMenuActions()
        ],
      ),
    );
  }

  Widget _buildContent(CustomerDatum customer) {
    return NMMinSizeContainer(
      child: CustomerItem(
        customer: customer,
        isOnMenu: true,
        onTap: (customer) {
          context.router.push(
            CustomerDetailsRoute(
              id: customer.contact_id!,
            ),
          );
        },
      ),
    );
  }
}
