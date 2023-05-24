import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nextminute/core/utils/theme/nm_colors.dart';

class Helpers {
  static Future<void> zoomBetweenPoints(
    GoogleMapController mapController, {
    LatLng? pointA,
    LatLng? pointB,
    LatLngBounds? bounds,
    double padding = 50,
    Duration animationDuration = const Duration(milliseconds: 500),
  }) async {
    LatLngBounds? latLngBounds;
    if (bounds != null) {
      latLngBounds = bounds;
    } else if (pointA != null && pointB != null) {
      // Determine the southwest and northeast corners
      final southwest = LatLng(
        min(pointA.latitude, pointB.latitude),
        min(pointA.longitude, pointB.longitude),
      );
      final northeast = LatLng(
        max(pointA.latitude, pointB.latitude),
        max(pointA.longitude, pointB.longitude),
      );

      latLngBounds = LatLngBounds(
        southwest: southwest,
        northeast: northeast,
      );
    }

    if (latLngBounds != null) {
      final cameraUpdate = CameraUpdate.newLatLngBounds(
        latLngBounds,
        padding,
      );

      await mapController.animateCamera(
        cameraUpdate,
      );
    }
  }

  static Future<Position?> getLatLngNullable() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    if (permission == LocationPermission.deniedForever) return null;

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return Geolocator.getCurrentPosition();
  }

  static Future<Position?> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (context.mounted) {
        await showOkAlertDialog(
          context: context,
          message:
              'Location services is DISABLED. Please enable location services '
              'via Settings and try again.',
        );
      }
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        if (context.mounted) {
          await showOkAlertDialog(
            context: context,
            message: 'Location permissions are DENIED. Please enable location '
                'permissions via Settings and try again.',
          );
        }

        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      if (context.mounted) {
        await showOkAlertDialog(
          context: context,
          message: 'Location permissions are DENIED. Please enable location '
              'permissions via Settings and try again.',
        );
      }

      return null;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return Geolocator.getCurrentPosition();
  }

  static DateTime roundToMinuteInterval(DateTime dateTime, int minuteInterval) {
    final minutes = (dateTime.minute / minuteInterval).round() * minuteInterval;
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      minutes,
    );
  }
}

class NMBorderRadius {
  static const double defaultBorderRadius = 10;
}

Color getStatusColor(String status, {bool isJobType = false}) {
  if (isJobType) {
    switch (status) {
      case 'Small':
        return NMColors.small;
      case 'Medium':
        return NMColors.medium;
      case 'Large':
        return NMColors.large;
      case 'Custom':
        return NMColors.custom;
      case 'Job':
        return NMColors.job;
      case 'Recurring':
        return NMColors.recurring;
      case 'Internal':
        return NMColors.internal;
      default:
        return Colors.grey.shade200;
    }
  }

  switch (status) {
    // JobStatus
    case 'Invited':
      return Colors.grey.shade200;
    case 'Accepted':
      return NMColors.lightGreen;
    case 'Rejected':
      return Colors.red;
    case 'In Progress':
      return NMColors.inProgress;
    case 'New':
      return NMColors.newJob;
    case 'Waiting Materials':
      return NMColors.waitingMaterials;
    case 'Completed':
      return NMColors.completed;
    case 'Postponed':
      return NMColors.postponed;
    case 'Ready to Invoice':
      return NMColors.readyToInvoice;
    case 'Tentative':
      return NMColors.tentative;
    case 'Low':
      return NMColors.lowPrio;
    case 'Medium':
      return NMColors.mediumPrio;
    case 'High':
      return NMColors.highPrio;
    case 'Time & Materials':
      return NMColors.timeAndMaterials;
    default:
      return Colors.grey.shade200;
  }
}
