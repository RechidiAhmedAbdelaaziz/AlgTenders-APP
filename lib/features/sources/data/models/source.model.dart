import 'package:equatable/equatable.dart';
import 'package:tender_app/core/shared/dto/imagedto/image.dto.dart';
import 'package:tender_app/features/newspaper/data/models/newspaper.model.dart';

class SourceModel extends Equatable {
  const SourceModel({
    this.newspaper,
    this.images,
  });

  final NewsPaperModel? newspaper;
  final List<ImageDTO>? images;

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      newspaper: json['newsPaper'] != null
          ? NewsPaperModel.fromJson(json['newsPaper'])
          : null,
      images: json['images'] != null
          ? (json['images'] as List<dynamic>)
              .map((e) => RemoteImageDTO(url: e))
              .toList()
          : null,
    );
  }

  @override
  List<Object?> get props => [newspaper];
}
