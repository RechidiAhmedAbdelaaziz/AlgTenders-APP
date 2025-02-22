import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/network/types/api_result.type.dart';
import 'package:tender_app/core/shared/dto/pagination/pagination.dto.dart';
import 'package:tender_app/core/types/cubitstate/error.state.dart';
import 'package:tender_app/features/announcer/data/model/announcer.model.dart';
import 'package:tender_app/features/announcer/data/repository/announcer.repo.dart';

part 'multi_announcer.state.dart';

class MultiAnnouncerCubit extends Cubit<MultiAnnouncerState> {
  final _announcerRepo = locator<AnnouncerRepo>();
  final _paginationDto = PaginationDto();

  MultiAnnouncerCubit() : super(MultiAnnouncerState.initial());

  void search() {
    _paginationDto.page.setValue(1);
    state._result.clear();
    getAnnouncers();
  }

  TextEditingController get searchController =>
      _paginationDto.keywordController;

  void getAnnouncers() async {
    emit(state._loading());

    final result = await _announcerRepo.getAnnouncers(_paginationDto);

    result.when(
      success: (result) {
        if (result.data.isNotEmpty) _paginationDto.page.increment();
        emit(state._loaded(result));
      },
      error: (error) => emit(state._error(error.message)),
    );
  }
}
