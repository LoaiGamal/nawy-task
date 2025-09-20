import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy_task/common/base/theme.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  final bool readOnly;

  const SearchFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(color: MyAppTheme.instance.lightGrayColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: MyAppTheme.instance.hintTextStyle(),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: MyAppTheme.instance.blueColor,
                  size: 20.sp,
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),
    );
  }
}
