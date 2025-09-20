import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy_task/common/base/theme.dart';

class ModalBottomSheetWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Widget? actionButton;

  const ModalBottomSheetWidget({
    super.key,
    required this.title,
    required this.children,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: MyAppTheme.instance.titleStyle(),
          ),
          SizedBox(height: 20.h),
          ...children,
          if (actionButton != null) ...[
            SizedBox(height: 20.h),
            actionButton!,
          ],
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    required List<Widget> children,
    Widget? actionButton,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ModalBottomSheetWidget(
        title: title,
        children: children,
        actionButton: actionButton,
      ),
    );
  }
}
