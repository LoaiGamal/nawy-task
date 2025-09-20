import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawy_task/common/base/theme.dart';

class RangeSliderWidget extends StatelessWidget {
  final String title;
  final RangeValues values;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<RangeValues> onChanged;
  final String Function(RangeValues) valueFormatter;

  const RangeSliderWidget({
    super.key,
    required this.title,
    required this.values,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
    required this.valueFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: MyAppTheme.instance.titleStyle(),
            ),
            Text(
              valueFormatter(values),
              style: MyAppTheme.instance.detailTextStyle(),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        RangeSlider(
          values: values,
          min: min,
          max: max,
          divisions: divisions,
          activeColor: MyAppTheme.instance.blueColor,
          inactiveColor: MyAppTheme.instance.lightBlueColor,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
