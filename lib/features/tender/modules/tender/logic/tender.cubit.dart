import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/types/cubitstate/error.state.dart';
import 'package:tender_app/features/tender/data/models/tender.model.dart';
import 'package:tender_app/features/tender/data/repository/tender.repo.dart';

part 'tender.state.dart';

class TenderCubit extends Cubit<TenderState> {
  final _repo = locator<TenderRepo>();
  TenderCubit() : super(TenderState());

  void loadTender(String id) async {
    emit(state._loading());

    final result = await _repo.getTender(id);

    result.when(
      success: (tender) => emit(state._loaded(tender)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
