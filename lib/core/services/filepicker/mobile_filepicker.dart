part of 'filepick.service.dart';

class MobileFilePicker extends FilePickerService<LocalImageDTO> {
  @override
  Future<LocalImageDTO?> pickFile() async {
    final imagePicker = ImagePicker();
    final xfile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (xfile != null) {
      return MobileImageDTO(file: File(xfile.path));
    } else {
      throw Exception("No file picked");
    }
  }
}
