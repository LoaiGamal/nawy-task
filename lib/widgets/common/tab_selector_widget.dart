import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy_task/common/base/theme.dart';

class TabSelectorWidget extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const TabSelectorWidget({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tabs.asMap().entries.map((entry) {
        final index = entry.key;
        final title = entry.value;
        return _buildTab(title, index);
      }).toList(),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25,
              color: isSelected
                  ? MyAppTheme.instance.blueColor
                  : MyAppTheme.instance.grayColor,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 3.h,
            width: title.length * 8.w,
            decoration: BoxDecoration(
              color: isSelected
                  ? MyAppTheme.instance.blueColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
}
