import 'package:flutter/cupertino.dart';

class AlwaysScroll extends SingleChildScrollView {
  const AlwaysScroll({
    super.key,
    super.child,
    super.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      controller: controller,
      child: SingleChildScrollView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: child,
      ),
    );
  }
}
