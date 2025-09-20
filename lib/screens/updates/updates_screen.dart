import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nawy_task/common/base/base_screen/base_screen.dart';
import 'package:nawy_task/common/base/my_app_images.dart';
import 'package:nawy_task/common/base/route_manager.dart';
import 'package:nawy_task/common/base/theme.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenWithAppBar(
      title: 'Updates',
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => context.go(RouteManager.search),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MyAppImages.nawyLogo, height: 120.h, width: 120.w,),
            SizedBox(height: 16.h),
            Text(
              'Sorry, There is no updates',
              style: MyAppTheme.instance.largeTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
