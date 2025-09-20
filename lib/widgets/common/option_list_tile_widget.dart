import 'package:flutter/material.dart';
import 'package:nawy_task/common/base/theme.dart';

class OptionListTileWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionListTileWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: MyAppTheme.instance.defaultStyle()),
      trailing: isSelected
          ? Icon(Icons.check, color: MyAppTheme.instance.blueColor)
          : null,
      onTap: onTap,
    );
  }
}
