import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../providers/screen_service.dart';
import '../../routes/app_router.dart';
import '../../utils/storage_utils.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 128,
        ),
      ),
    );
  }

  Future<void> checkSession() async {
    final _token = await StorageUtils.getAccessToken();
    if (_token != null) {
      await router.popAndPush(const LoginRoute());
    } else {
      await router.popAndPush(const DashboardRoute());
    }
  }
}
