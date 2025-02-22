import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/extension/localization.extension.dart';
import 'package:tender_app/core/shared/classes/dimensions.dart';
import 'package:tender_app/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:tender_app/core/themes/colors.dart';
import 'package:tender_app/features/announcer/data/model/announcer.model.dart';
import 'package:tender_app/features/announcer/modules/multiannouncers/ui/announcer.dart';
import 'package:tender_app/features/announcer/modules/multiannouncers/ui/announcers.dart';

class SelectableAnnouncer extends StatefulWidget {
  final EditingController<AnnouncerModel> announcerController;
  const SelectableAnnouncer(this.announcerController, {super.key});

  @override
  State<SelectableAnnouncer> createState() =>
      _SelectableAnnouncerState();
}

class _SelectableAnnouncerState extends State<SelectableAnnouncer> {
  @override
  void initState() {
    widget.announcerController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.announcerController.value != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Announcer'.tr(context),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (isSelected) ...[
              InkWell(
                onTap: widget.announcerController.clear,

                child: Icon(Icons.restore, color: KColors.darkGrey),
              ),
            ],
          ],
        ),
        heightSpace(10),
        if (isSelected) ...[
          Announcer(widget.announcerController.value!),
          heightSpace(10),
        ],
        InkWell(
          onTap: () async {
            // context.dialogWith<AnnouncerModel>(
            //   child: Announcers(),
            //   onResult: widget.announcerController.setValue,
            // );
            //show bottom sheet

            final announcer =
                await showModalBottomSheet<AnnouncerModel>(
                  context: context,
                  backgroundColor: KColors.white,
                  builder: (context) => Announcers(),
                );
            if (announcer != null) {
              widget.announcerController.setValue(announcer);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: KColors.darkGrey,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              (isSelected ? "ChangeAnnouncer" : "SelectAnnouncer").tr(
                context,
              ),
              style: TextStyle(fontSize: 14.sp, color: KColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
