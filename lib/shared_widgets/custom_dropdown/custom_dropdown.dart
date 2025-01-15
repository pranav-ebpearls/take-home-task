import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:take_home_task/utils/constants/colors.dart';
import 'package:take_home_task/utils/constants/strings.dart';

class CustomDropdown extends StatefulWidget {
  final String text;

  const CustomDropdown({super.key, required this.text});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late GlobalKey actionKey;
  bool isDropdownOpened = false;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: actionKey,
      onTap: () {
        isDropdownOpened = !isDropdownOpened;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.centerLeft,
        height: 44.h,
        width: 165.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.accentColor,
        ),
        child: Text(
          widget.text.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
