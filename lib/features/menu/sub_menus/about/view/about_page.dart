import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _version = '';
  String _buildNumber = '';

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = info.version;
      _buildNumber = info.buildNumber;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const NmLogo(),
                  Text('Flutter Version $_version ($_buildNumber)'),
                  const SizedBox(height: 8),
                  const Text('NM Version 22.12.2'),
                  const SizedBox(height: 8),
                  const Text('NM Release Date: 2022.12.20'),
                  const SizedBox(height: 8),
                  TextButton(
                    key: const Key('__aboutPage_privacyPolicyButton__'),
                    onPressed: () async {
                      final url =
                          Uri.parse('https://nextminute.com/privacy-policy/');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Text(
                      'Privacy Policy',
                      style: NMTextStyles.b2(context)?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('© 2023 NextMinute'),
                ],
              ),
            ).paddingAll(16),
          ),
          NMBottomMenuActions(
            actionsPanel: NMActionList(
              actions: [
                NMActionItem(
                  icon: Icons.history,
                  label: 'Version History',
                  onTap: () {
                    context.router.push(const VersionHistoryRoute());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
