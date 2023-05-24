import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';

@RoutePage()
class ResetEmailSentPage extends StatefulWidget {
  const ResetEmailSentPage({
    super.key,
    required this.message,
    required this.messageTitle,
  });

  final String message;
  final String messageTitle;

  @override
  State<ResetEmailSentPage> createState() => _ResetEmailSentPageState();
}

class _ResetEmailSentPageState extends State<ResetEmailSentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Image.asset(
              'assets/images/check_green.png',
              width: 90,
            ),
            const SizedBox(height: 32),
            Text(
              widget.messageTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                key: const Key('__back_to_login_button__'),
                onPressed: () {
                  context.router.replace(const LoginRoute());
                },
                child: const Text('Back to Login'),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 32),
      ),
    );
  }
}
