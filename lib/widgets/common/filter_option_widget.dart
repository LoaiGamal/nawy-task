import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy_task/common/base/theme.dart';

class FilterOptionWidget extends StatelessWidget {
  final String title;
  final String selectedValue;
  final VoidCallback onTap;
  final IconData? trailingIcon;

  const FilterOptionWidget({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onTap,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyAppTheme.instance.titleStyle(),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedValue,
                  style: MyAppTheme.instance.detailTextStyle(),
                ),
                Icon(
                  trailingIcon ?? Icons.chevron_right,
                  color: MyAppTheme.instance.lightGrayColor,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: MyAppTheme.instance.lightGrayColor.withOpacity(0.2),
          thickness: 1,
        ),
      ],
    );
  }
}
