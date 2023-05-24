import 'package:flutter/material.dart';

class NMEmptyState extends StatelessWidget {
  const NMEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.search_off_rounded,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text('No results found'),
        ],
      ),
    );
  }
}
