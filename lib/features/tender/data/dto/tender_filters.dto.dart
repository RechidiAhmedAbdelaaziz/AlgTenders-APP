import 'package:flutter/material.dart';
import 'package:tender_app/core/extension/map.extension.dart';
import 'package:tender_app/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:tender_app/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:tender_app/core/shared/dto/pagination/pagination.dto.dart';
import 'package:tender_app/features/announcer/data/model/announcer.model.dart';
// import 'package:tender_app/features/announcer/data/models/announcer.model.dart';

class TenderFiltersDto extends PaginationDto {
  final EditingController<AnnouncerModel> announcerController;
  final EditingController<DateTime> publishedAfter;
  final EditingController<DateTime> closingBefore;
  final TextEditingController marketTypeController;
  final ListEditingcontroller<String> categoryController;
  final EditingController<bool> isStartup;
  final ListEditingcontroller<String> regions;

  TenderFiltersDto()
    : announcerController = EditingController<AnnouncerModel>(),
      publishedAfter = EditingController<DateTime>(),
      closingBefore = EditingController<DateTime>(),
      marketTypeController = TextEditingController(),
      categoryController = ListEditingcontroller<String>(),
      isStartup = EditingController<bool>(),
      regions = ListEditingcontroller<String>();

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['announcer'] = announcerController.value?.id;
    json['publishedAfter'] = publishedAfter.value?.toIso8601String();
    json['closingBefore'] = closingBefore.value?.toIso8601String();

    if (marketTypeController.text.isNotEmpty) {
      json['marketType'] = marketTypeController.text;
    }

    if (categoryController.value.isNotEmpty) {
      json['industries'] = categoryController.value;
    }

    if (isStartup.value == true) json['isStartup'] = isStartup.value;
    if (regions.value.isNotEmpty) json['regions'] = regions.value;
    return json.withoutNullsOrEmpty();
  }

  @override
  void dispose() {
    announcerController.dispose();
    publishedAfter.dispose();
    closingBefore.dispose();
    marketTypeController.dispose();
    categoryController.dispose();
    isStartup.dispose();
    regions.dispose();
    super.dispose();
  }

  void clear() {
    announcerController.clear();
    publishedAfter.clear();
    closingBefore.clear();
    marketTypeController.clear();
    categoryController.clear();
    isStartup.clear();
    regions.clear();
  }
}
