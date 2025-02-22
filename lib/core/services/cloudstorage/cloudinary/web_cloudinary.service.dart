part of 'cloudinary.service.dart';

class WebCloudinaryService extends CloudinaryService<XFile> {
  @override
  Future<http.MultipartRequest> _prepareRequest(XFile file) async {
    final request = this.request;

    final bytes = await file.readAsBytes();

    request.files.add(http.MultipartFile.fromBytes(
      'file',
      bytes.toList(),
      filename: file.name,
    ));

    

    return request;
  }
}
