import 'package:flutter/material.dart';
import 'package:ocr_reading/src/bloc/ocr_bloc.dart';
import 'package:ocr_reading/src/widgets/extract_text_view.dart';
import 'package:ocr_reading/src/widgets/floating_action_button.dart';
import 'package:ocr_reading/src/widgets/image_view.dart';
import 'package:provider/provider.dart';

class OcrReading extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OcrBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageView(
              emptyTextMessage: emptyTextMessageForImage,
              imageWidth: imageWidth,
            ),
            ExtractTextView(
              emptyTextMessage: emptyTextMessageForText,
              textFontSize: textFontSize,
            ),
            const OCRFloatingActionButton(),
          ],
        ),
      ),
    );
  }
}
