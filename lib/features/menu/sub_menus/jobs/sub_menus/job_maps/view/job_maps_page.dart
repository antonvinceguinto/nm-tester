import 'dart:async';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/theme/nm_colors.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class JobMapsPage extends StatefulWidget {
  const JobMapsPage({
    super.key,
    this.jobs,
    this.tasks,
    this.isEmbedded = false,
  });

  final List<JobInfoLevelModel>? jobs;
  final List<TaskInfoLevelModel>? tasks;
  final bool isEmbedded;

  @override
  State<JobMapsPage> createState() => _JobMapsPageState();
}

class _JobMapsPageState extends State<JobMapsPage> {
  final List<LatLng?> _jobPoints = [];
  final Set<Marker> _markers = {};

  bool isLoading = true;

  late CustomInfoWindowController _customInfoWindowController;
  late GoogleMapController _mapController;

  final CameraPosition _aucklandPos = const CameraPosition(
    target: LatLng(-36.848461, 174.7645),
    zoom: 3,
  );

  @override
  void initState() {
    super.initState();
    _customInfoWindowController = CustomInfoWindowController();
  }

  Future<void> _initMarkers() async {
    final locations = (widget.tasks?.isNotEmpty ?? false)
        ? List<TaskInfoLevelModel>.from(widget.tasks!)
        : List<JobInfoLevelModel>.from(widget.jobs!)
      ..removeWhere((location) {
        final address = location is JobInfoLevelModel
            ? location.job_address
            : (location as TaskInfoLevelModel).book_address;
        return address == null || address.isEmpty;
      });

    if (locations.isEmpty) {
      isLoading = false;
      setState(() {});
      return;
    }

    final points = <LatLng>[];
    final markers = <Marker>[];

    for (final location in locations) {
      final address = location is JobInfoLevelModel
          ? location.job_address
          : (location as TaskInfoLevelModel).book_address;
      if (address != null && address.isNotEmpty) {
        final latLng = await JobsHelper.getAddressCoords(address: address);
        points.add(latLng);
        markers.add(
          Marker(
            markerId: MarkerId(latLng.toString()),
            position: latLng,
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                JobTaskCustomWindowForMap(
                  job: location is JobInfoLevelModel ? location : null,
                  task: location is TaskInfoLevelModel ? location : null,
                ),
                latLng,
              );
            },
          ),
        );
      }
    }

    if (points.isEmpty) return;

    final tempLatLng = points.length == 1 ? points[0] : null;

    _jobPoints.addAll(points);
    _markers.addAll(markers);

    if (tempLatLng != null) {
      if (!widget.isEmbedded) {
        _customInfoWindowController.addInfoWindow!(
          JobTaskCustomWindowForMap(
            job: locations.first is JobInfoLevelModel
                ? (locations.first as JobInfoLevelModel)
                : null,
            task: locations.first is TaskInfoLevelModel
                ? (locations.first as TaskInfoLevelModel)
                : null,
          ),
          tempLatLng,
        );
      }

      await _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              tempLatLng.latitude,
              tempLatLng.longitude,
            ),
            zoom: 15,
          ),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _customInfoWindowController.dispose();
    // _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isEmbedded
          ? null
          : AppBar(
              title: Text(
                widget.tasks != null ? 'Tasks Map' : 'Jobs Map',
              ),
            ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                IgnorePointer(
                  ignoring: widget.isEmbedded,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        _jobPoints.isNotEmpty
                            ? _jobPoints.first!.latitude
                            : _aucklandPos.target.latitude,
                        _jobPoints.isNotEmpty
                            ? _jobPoints.first!.longitude
                            : _aucklandPos.target.longitude,
                      ),
                      zoom: 3,
                    ),
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
                      _mapController = controller;
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
                  height: 290,
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
}

class JobTaskCustomWindowForMap extends StatelessWidget {
  const JobTaskCustomWindowForMap({
    super.key,
    this.job,
    this.task,
  });

  final JobInfoLevelModel? job;
  final TaskInfoLevelModel? task;

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      thumbVisibility: true,
      child: AlwaysScroll(
        child: job != null
            ? JobsItem(
                job: job!,
                hasUnbilled: false,
              )
            : task != null
                ? DetailedTaskItem(
                    task: task!,
                    onTaskSelected: (task) {
                      context.router.push(
                        TaskDetailsRoute(
                          task: TaskInfoLevelModel(
                            book_id: task.book_id,
                            book_start: task.book_start,
                            book_is_recurring: task.book_is_recurring,
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink(),
      ),
    );
  }
}
