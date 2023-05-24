import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nextminute/core/utils/utils.dart';

class NMSearchField extends StatefulWidget {
  const NMSearchField({
    super.key,
    required this.searchController,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController searchController;
  final void Function(String val) onChanged;
  final void Function() onClear;

  @override
  State<NMSearchField> createState() => _NMSearchFieldState();
}

class _NMSearchFieldState extends State<NMSearchField> {
  Timer? _debounce;

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 40,
      child: TextField(
        controller: widget.searchController,
        onChanged: (val) {
          if (_debounce?.isActive ?? false) _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            widget.onChanged(val);
          });
        },
        decoration: InputDecoration(
          hintText: 'Search',
          fillColor: context.isDarkMode ? NMColors.black : Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade500,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.grey.shade500,
              size: 18,
            ),
            onPressed: () {
              HapticFeedback.lightImpact();
              widget.searchController.clear();
              widget.onClear();
              FocusScope.of(context).unfocus();
            },
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
