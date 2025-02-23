part of 'tender.cubit.dart';

enum _TenderStatus { initial, loading, loaded, error }

class TenderState extends ErrorState {
  final TenderModel? _tender;
  final _TenderStatus _status;

  TenderState({
    TenderModel? tender,
    _TenderStatus status = _TenderStatus.initial,
    String? error,
  }) : _tender = tender,
       _status = status,
       super(error);

  bool get isLoading => _status == _TenderStatus.loading;
  bool get isLoaded => _tender != null;

  TenderModel get tender => _tender!;

  TenderState _loading() => _copyWith(status: _TenderStatus.loading);

  TenderState _loaded(TenderModel tender) =>
      _copyWith(tender: tender, status: _TenderStatus.loaded);

  TenderState _error(String error) =>
      _copyWith(error: error, status: _TenderStatus.error);

  TenderState _copyWith({
    TenderModel? tender,
    _TenderStatus? status,
    String? error,
  }) {
    return TenderState(
      tender: tender ?? _tender,
      status: status ?? _status,
      error: error,
    );
  }
}
