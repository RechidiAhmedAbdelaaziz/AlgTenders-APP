part of 'image.dto.dart';

class WebImageDTO extends LocalImageDTO<XFile> {
  WebImageDTO({required super.file});

  @override
  ImageProvider get image {
    return NetworkImage(file.path);
  }

  // Future<String?> _readFileAsDataUrl(html.File file) async {
  //   final reader = html.FileReader();
  //   final completer = Completer<String?>();

  //   reader.onLoadEnd.listen((event) {
  //     completer.complete(reader.result as String?);
  //   });

  //   reader.readAsDataUrl(
  //       file); // Reads the file as a Data URL (useful for images)
  //   return completer.future;
  // }

  @override
  Future<String> get imageUrl async {
    return await _cloudStorageService.upload(file);
  }
}
