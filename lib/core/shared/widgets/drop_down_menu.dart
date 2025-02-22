import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KDropDownMenu extends StatefulWidget {
  final List<String> items;
  final TextEditingController controller;
  final String? title;
  final String? initialValue;

  const KDropDownMenu({
    super.key,
    this.title,
    required this.items,
    required this.controller,
    this.initialValue,
  });

  @override
  State<KDropDownMenu> createState() => _KDropDownMenuState();
}

class _KDropDownMenuState extends State<KDropDownMenu> {
  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.text.isEmpty) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.spMax,
              fontWeight: FontWeight.w600,
            ),
          ),
        CustomDropdown.search(
          decoration: CustomDropdownDecoration(
            closedBorder: Border.all(color: Colors.grey),
          ),
          items: widget.items,
          initialItem:
              widget.items.contains(widget.controller.text)
                  ? widget.controller.text
                  : widget.initialValue,
          onChanged: (value) {
            if (value != null) widget.controller.text = value;
          },
        ),
      ],
    );
  }
}
