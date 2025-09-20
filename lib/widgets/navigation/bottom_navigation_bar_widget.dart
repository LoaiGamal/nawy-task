import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawy_task/common/base/my_app_images.dart';
import 'package:nawy_task/common/base/theme.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: MyAppTheme.instance.lightGrayColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: MyAppTheme.instance.orangeColor,
        unselectedItemColor: MyAppTheme.instance.grayColor,
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MyAppImages.icSearch,
              colorFilter: ColorFilter.mode(
                currentIndex == 0
                    ? MyAppTheme.instance.orangeColor
                    : MyAppTheme.instance.grayColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MyAppImages.icUpdates,
              colorFilter: ColorFilter.mode(
                currentIndex == 1
                    ? MyAppTheme.instance.orangeColor
                    : MyAppTheme.instance.grayColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MyAppImages.icFavorite,
              colorFilter: ColorFilter.mode(
                currentIndex == 2
                    ? MyAppTheme.instance.orangeColor
                    : MyAppTheme.instance.grayColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MyAppImages.icMore,
              colorFilter: ColorFilter.mode(
                currentIndex == 3
                    ? MyAppTheme.instance.orangeColor
                    : MyAppTheme.instance.grayColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
