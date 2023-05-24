// helpers_wrapper.dart
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nextminute/core/utils/utils.dart';

// For testing purposes, we need to mock the Helpers class.

abstract class HelpersWrapper {
  Future<Position?> getLatLngNullable();
  Future<Position?> determinePosition(BuildContext context);
}

class HelpersWrapperImpl implements HelpersWrapper {
  @override
  Future<Position?> getLatLngNullable() => Helpers.getLatLngNullable();

  @override
  Future<Position?> determinePosition(BuildContext context) =>
      Helpers.determinePosition(context);
}
