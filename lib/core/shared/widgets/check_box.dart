import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:tender_app/core/themes/colors.dart';

class AppCheckBox extends StatefulWidget {
  final EditingController<bool> controller;
  final String title;
  const AppCheckBox({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  State<AppCheckBox> createState() => AppCheckBoxState();
}

class AppCheckBoxState extends State<AppCheckBox> {
  late bool _value;

  @override
  void initState() {
    widget.controller.initValue(false);
    _value = widget.controller.value!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Checkbox(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value ?? false;
              widget.controller.setValue(_value);
            });
          },
        ),
        Text(
          widget.title,
          style: TextStyle(fontSize: 12.sp, color: KColors.black),
        ),
      ],
    );
  }
}
