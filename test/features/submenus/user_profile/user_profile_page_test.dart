import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextminute/features/menu/sub_menus/user_profile/view/user_profile_page.dart';

import '../../../helpers/helpers.dart';

void main() {
  testWidgets('should render profile page', (tester) async {
    await tester.pumpApp(const UserProfilePage(subscriptionName: ''));
    expect(find.byType(UserProfilePage), findsOneWidget);

    final changePwButton = find.byKey(const Key('__change_pw_button__'));

    expect(changePwButton, findsOneWidget);

    await tester.tap(changePwButton);
    await tester.pumpAndSettle();
  });
}
