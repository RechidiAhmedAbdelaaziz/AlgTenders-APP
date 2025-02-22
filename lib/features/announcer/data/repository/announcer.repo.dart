import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/network/repo_base.dart';
import 'package:tender_app/core/network/types/api_result.type.dart';
import 'package:tender_app/core/shared/dto/pagination/pagination.dto.dart';

import '../model/announcer.model.dart';
import '../source/announcer.api.dart';

class AnnouncerRepo extends NetworkRepository {
  final _announcerApi = locator<AnnouncerApi>();

  RepoListResult<AnnouncerModel> getAnnouncers(
    PaginationDto dto,
  ) async {
    apicall() async {
      final response = await _announcerApi.getAnnouncers(
        dto.toJson(),
      );
      return PaginationResult.fromResponse(
        response: response,
        fromJson: AnnouncerModel.fromJson,
      );
    }

    return tryApiCall(apicall);
  }
}
