import 'dart:async';

import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class SimpleMapPage extends StatefulWidget {
  const SimpleMapPage({
    super.key,
    required this.statusChangeLocation,
    required this.statusContactName,
    this.job,
    this.task,
  });

  final JobInfoLevelModel? job;
  final TaskInfoLevelModel? task;

  final LatLng statusChangeLocation;
  final String statusContactName;

  @override
  State<SimpleMapPage> createState() => _SimpleMapPageState();
}

class _SimpleMapPageState extends State<SimpleMapPage> {
  final Set<Marker> _markers = {};

  bool isLoading = true;

  late CustomInfoWindowController _customInfoWindowController;
  late GoogleMapController _mapController;

  late final CameraPosition _aucklandPos = const CameraPosition(
    target: LatLng(-36.848461, 174.7645),
    zoom: 8,
  );

  @override
  void initState() {
    super.initState();
    _customInfoWindowController = CustomInfoWindowController();
  }

  Future<void> _initMarkers() async {
    final markers = <Marker>[];

    LatLng? jobTaskAddress;

    if ((widget.job != null &&
            widget.job!.job_address != null &&
            widget.job!.job_address!.isNotEmpty) ||
        (widget.task != null &&
            widget.task!.book_address != null &&
            widget.task!.book_address!.isNotEmpty)) {
      jobTaskAddress = await JobsHelper.getAddressCoords(
        address: widget.job != null
            ? widget.job!.job_address!
            : widget.task!.book_address!,
      );

      final title = widget.job != null ? 'Job Address' : 'Task Address';

      markers.add(
        Marker(
          markerId: MarkerId(title),
          position: jobTaskAddress,
          infoWindow: InfoWindow(
            title: title,
          ),
          onTap: () {
            _customInfoWindowController.hideInfoWindow!();
            _customInfoWindowController.addInfoWindow!(
              JobTaskCustomWindowForMap(
                job: widget.job,
                task: widget.task,
              ),
              jobTaskAddress!,
            );
          },
        ),
      );
    }

    markers.add(
      Marker(
        markerId: MarkerId(widget.statusContactName),
        position: widget.statusChangeLocation,
        infoWindow: InfoWindow(
          title: widget.statusContactName,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ),
      ),
    );

    _markers.addAll(markers);

    if (jobTaskAddress == null) {
      await _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: widget.statusChangeLocation,
            zoom: 15,
          ),
        ),
      );
      setState(() {
        isLoading = false;
      });
      return;
    }

    // This function is a bit buggy on Emulators.
    // It works fine on a real device.
    await Helpers.zoomBetweenPoints(
      _mapController,
      pointA: widget.statusChangeLocation,
      pointB: jobTaskAddress,
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _customInfoWindowController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: _aucklandPos,
                  onMapCreated: (GoogleMapController controller) async {
                    _mapController = controller;
                    _customInfoWindowController.googleMapController =
                        _mapController;

                    await _initMarkers();

                    Future.delayed(
                      const Duration(milliseconds: 600),
                      () async {
                        if (_markers.isEmpty) {
                          return;
                        }

                        await _mapController.showMarkerInfoWindow(
                          MarkerId(widget.statusContactName),
                        );
                      },
                    );
                  },
                  onTap: (position) {
                    _customInfoWindowController.hideInfoWindow!();
                  },
                  onCameraMove: (position) {
                    if (_customInfoWindowController.onCameraMove != null) {
                      _customInfoWindowController.onCameraMove!.call();
                    }
                  },
                  markers: !isLoading ? _markers : {},
                  myLocationEnabled: true,
                ),
                CustomInfoWindow(
                  controller: _customInfoWindowController,
                  offset: 0,
                  width: 300,
                  height: 290,
                ),
                if (isLoading)
                  Center(
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
          const NMBottomMenuActions()
        ],
      ),
    );
  }
}
