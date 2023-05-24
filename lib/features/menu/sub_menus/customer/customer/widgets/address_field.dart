import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
// ignore: depend_on_referenced_packages
import 'package:google_maps_webservice/places.dart';
import 'package:nextminute/core/utils/strings.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';

class SingleAddressField extends StatefulWidget {
  const SingleAddressField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  State<SingleAddressField> createState() => _SingleAddressFieldState();
}

class _SingleAddressFieldState extends State<SingleAddressField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onAddressTap,
      child: TextFormField(
        enabled: false,
        controller: widget.controller,
        minLines: 3,
        maxLines: 6,
        style: NMTextStyles.b2(context),
        decoration: InputDecoration(
          hintText: widget.label,
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  Future<void> _onAddressTap() async {
    final p = await PlacesAutocomplete.show(
      context: context,
      apiKey: Strings.mapsApiKey,
      onError: (e) => debugPrint('Places error: $e'),
      mode: Mode.overlay,
      language: 'en',
      types: ['address'],
      strictbounds: false,
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [
        Component(Component.country, 'nz'),
      ],
    );

    if (mounted && p != null) {
      await _displayPrediction(p, context);
    }
  }

  Future<void> _displayPrediction(Prediction p, BuildContext context) async {
    if (p.description == null) return;

    widget.controller.text = p.description!;
  }
}

class AddressField extends StatefulWidget {
  const AddressField({
    super.key,
    required this.label,
    required this.autoController,
    required this.manualController,
    required this.isAuto,
    this.onSameAsPhysical,
    this.sameAsPhysical = false,
    required this.onAutoChanged,
  });

  final String label;
  final TextEditingController autoController;
  final TextEditingController manualController;
  final bool isAuto;
  final void Function(bool?)? onSameAsPhysical;
  final void Function(bool?)? onAutoChanged;
  final bool sameAsPhysical;

  @override
  State<AddressField> createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: !widget.isAuto ? null : _onAddressTap,
                child: TextFormField(
                  enabled: false,
                  controller: widget.autoController,
                  maxLines: 3,
                  minLines: 1,
                  style: NMTextStyles.b2(context),
                  decoration: InputDecoration(
                    hintText: widget.label,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CheckboxListTile(
                title: const Text('Auto'),
                contentPadding: EdgeInsets.zero,
                onChanged: widget.onAutoChanged,
                value: widget.isAuto,
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                visualDensity: VisualDensity.compact,
              ),
            ),
          ],
        ),
        if (widget.label.contains('Billing')) ...{
          CheckboxListTile(
            key: const ValueKey('same_as_physical'),
            contentPadding: EdgeInsets.zero,
            onChanged: widget.onSameAsPhysical,
            value: widget.sameAsPhysical,
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: Text(
              'Same as Physical Address',
              style: NMTextStyles.b2(context),
            ),
          ),
        },
        if (!widget.label.contains('Billing')) const SizedBox(height: 8),
        TextFormField(
          controller: widget.manualController,
          style: NMTextStyles.b2(context),
          maxLines: 5,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Future<void> _onAddressTap() async {
    final p = await PlacesAutocomplete.show(
      context: context,
      apiKey: Strings.mapsApiKey,
      onError: (e) => debugPrint('Places error: $e'),
      mode: Mode.overlay,
      language: 'en',
      types: ['address'],
      strictbounds: false,
      // Passing an empty list of components will return all types of results.
      components: [
        // Component(Component.country, 'nz'),
        // Component(Component.country, 'au'),
        // Component(Component.country, 'uk'),
      ],
    );

    if (mounted && p != null) {
      await _displayPrediction(p, context);
    }
  }

  Future<void> _displayPrediction(Prediction p, BuildContext context) async {
    // get detail (lat/lng)
    // final places = GoogleMapsPlaces(
    //   apiKey: mapsApiKey,
    //   apiHeaders: await const GoogleApiHeaders().getHeaders(),
    // );
    // final detail = await places.getDetailsByPlaceId(p.placeId!);
    // final lat = detail.result.geometry!.location.lat;
    // final lng = detail.result.geometry!.location.lng;

    if (p.description == null) return;

    widget.autoController.text = p.description!;

    if (!widget.isAuto) {
      widget.manualController.text = p.description!;
    }
  }
}
