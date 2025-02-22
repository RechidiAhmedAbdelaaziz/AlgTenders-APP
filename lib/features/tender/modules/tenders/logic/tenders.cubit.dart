import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/extension/list.extension.dart';
import 'package:tender_app/core/types/cubitstate/error.state.dart';
import 'package:tender_app/features/tender/data/dto/tender_filters.dto.dart';
import 'package:tender_app/features/tender/data/models/tender.model.dart';
import 'package:tender_app/features/tender/data/repository/tender.repo.dart';

part 'tenders.state.dart';

class TendersCubit extends Cubit<TendersState> {
  final _repo = locator<TenderRepo>();
  final _paginationDto = TenderFiltersDto();

  TendersCubit() : super(TendersState.initial()) {
    _paginationDto.limit.setValue(15);
  }

  TenderFiltersDto get filters => _paginationDto;

  void filterTenders() {
    state.tenders.clear();
    _paginationDto.firstPage();
    loadTenders();
  }

  void loadTenders() async {
    emit(state._loading());

    final tenders = await _repo.getTenders(_paginationDto);

    tenders.when(
      success: (result) {
        if (result.data.isNotEmpty) _paginationDto.nextPage();
        emit(state._loaded(result.data));
      },
      error: (error) => emit(state._error(error.message)),
    );
  }

  

  @override
  Future<void> close() {
    _paginationDto.dispose();
    
    state.tenders.clear();
    return super.close();
  }
}
