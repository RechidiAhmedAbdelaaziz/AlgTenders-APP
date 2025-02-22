import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/network/repo_base.dart';
import 'package:tender_app/core/network/types/api_result.type.dart';
import 'package:tender_app/core/shared/dto/pagination/pagination.dto.dart';
import 'package:tender_app/features/tender/data/models/tender.model.dart';
import 'package:tender_app/features/tender/data/source/tender.api.dart';

class TenderRepo extends NetworkRepository {
  final _api = locator<TenderApi>();

  RepoListResult<TenderModel> getTenders(PaginationDto dto) async {
    return tryApiCall(() async {
      final response = await _api.getTenders(dto.toJson());
      return PaginationResult.fromResponse(
        response: response,
        fromJson: TenderModel.fromJson,
      );
    });
  }

  RepoResult<TenderModel> getTender(String id) async {
    return tryApiCall(() async {
      final response = await _api.getTender(id);
      return TenderModel.fromJson(response.data!);
    });
  }
}
