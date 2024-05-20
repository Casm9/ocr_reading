import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OcrReading extends StatefulWidget {
  const OcrReading(
      {Key? key,
      this.emptyTextMessageForImage = "Pick an image for text recognition",
      this.imageWidth = 200,
      this.emptyTextMessageForText = "No result.",
      this.textFontSize = 25})
      : super(key: key);

  final String emptyTextMessageForImage;
  final double imageWidth;
  final String emptyTextMessageForText;
  final double textFontSize;

  @override
  OcrReadingState createState() => OcrReadingState();
}

class OcrReadingState extends State<OcrReading> {
  File? selectedMedia;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUI(),
      ],
    );
  }

  Widget _buildUI() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_imageView(), _extractTextView(), _floatingActionButton()],
    );
  }

  Widget _imageView() {
    if (selectedMedia == null) {
      return Center(
        child: Text(widget.emptyTextMessageForImage),
      );
    }
    return Center(
      child: Image.file(selectedMedia!, width: widget.imageWidth),
    );
  }

  Widget _extractTextView() {
    if (selectedMedia == null) {
      return Center(
        child: Text(widget.emptyTextMessageForText),
      );
    }
    return FutureBuilder(
        future: _extractText(selectedMedia!),
        builder: (context, snapshot) {
          return Text(
            snapshot.data ?? "",
            style: TextStyle(fontSize: widget.textFontSize),
          );
        });
  }

  Future<String?> _extractText(File file) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final InputImage inputImage = InputImage.fromFile(file);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    textRecognizer.close();

    return text;
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        List<MediaFile>? media =
            await GalleryPicker.pickMedia(context: context, singleMedia: true);
        if (media != null && media.isNotEmpty) {
          var data = await media.first.getFile();
          setState(() {
            selectedMedia = data;
          });
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
