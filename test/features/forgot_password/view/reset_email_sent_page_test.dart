import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextminute/features/auth/forgot_password/view/reset_email_sent_page.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('ResetEmailSentPage', () {
    testWidgets('renders ResetEmailSentView', (tester) async {
      await tester.pumpApp(
        const ResetEmailSentPage(
          message: '',
          messageTitle: '',
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ResetEmailSentPage), findsOneWidget);

      final nextButton = find.byKey(const Key('__back_to_login_button__'));

      expect(nextButton, findsOneWidget);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();
    });
  });
}
