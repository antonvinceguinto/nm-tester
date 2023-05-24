import 'package:flutter/widgets.dart';

class NMErrorState extends StatelessWidget {
  const NMErrorState({super.key, this.errorMsg = ''});

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Something went wrong\nPlease try again.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(errorMsg),
          ],
        ),
      ),
    );
  }
}
