part of 'filepick.service.dart';

class WebFilePicker extends FilePickerService<WebImageDTO> {
  @override
  Future<WebImageDTO?> pickFile() async {
    final xfile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (xfile != null) {
      return WebImageDTO(file: xfile);
    } else {
      throw Exception("No file picked");
    }
  }
}

// Future<html.File> convertXFileToHtmlFile(XFile xfile) async {
//   // Read the file as bytes
//   Uint8List uint8List = await xfile.readAsBytes();

//   // Create a Blob from the Uint8List
//   final blob = html.Blob(
//     JSArray()..add(uint8List.toJS),
//   );

//   // Create an HTML File
//   final htmlFile = html.File(JSArray()..add(blob), xfile.name,
//       html.FilePropertyBag(type: xfile.mimeType!));

//   return htmlFile;
// }
