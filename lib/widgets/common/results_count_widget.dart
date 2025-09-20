import 'package:flutter/material.dart';
import 'package:nawy_task/common/base/theme.dart';

class ResultsCountWidget extends StatelessWidget {
  final int count;

  const ResultsCountWidget({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count results',
      style: MyAppTheme.instance.hintTextStyle().copyWith(color: Colors.black),
    );
  }
}
