import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:gallery_picker/gallery_picker.dart';

class OcrBloc extends ChangeNotifier {
  File? _selectedMedia;
  String? _extractedText;

  File? get selectedMedia => _selectedMedia;

  String? get extractedText => _extractedText;

  Future pickImage(BuildContext context) async {
    List<MediaFile>? media =
        await GalleryPicker.pickMedia(context: context, singleMedia: true);
    if (media != null && media.isNotEmpty) {
      _selectedMedia = await media.first.getFile();
      notifyListeners();
      await _extractText(_selectedMedia!);
    }
  }

  Future _extractText(File file) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final InputImage inputImage = InputImage.fromFile(file);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    _extractedText = recognizedText.text;
    textRecognizer.close();
    notifyListeners();
  }
}
