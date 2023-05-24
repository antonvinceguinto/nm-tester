import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key, required this.subscriptionName});
  final String subscriptionName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: NMColors.orange,
                width: 4,
              ),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: NMColors.orange,
                size: 50,
              ),
            ),
          ).paddingOnly(top: 16),
          const SizedBox(width: 26),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.read<SharedPrefs>().subscriberNameDisplay,
                  style: NMTextStyles.b2(context)?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  context.read<SharedPrefs>().subscriberEmail,
                ),
                const SizedBox(height: 6),
                Text(
                  subscriptionName,
                ),
                NMCupertinoButton(
                  key: const Key('__change_pw_button__'),
                  onPressed: () {
                    context.router.push(const ChangePasswordRoute());
                  },
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: const [
                      Text(
                        'Change Password',
                        style: TextStyle(
                          color: NMColors.orange,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.edit,
                        color: NMColors.orange,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ).paddingAll(16),
    );
  }
}
