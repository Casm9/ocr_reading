import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/ocr_bloc.dart';

class ExtractTextView extends StatelessWidget {
  const ExtractTextView({
    super.key,
    required this.emptyTextMessage,
    required this.textFontSize,
  });

  final String emptyTextMessage;
  final double textFontSize;

  @override
  Widget build(BuildContext context) {
    final extractedText = context.watch<OcrBloc>().extractedText;
    if (extractedText == null) {
      return Center(
        child: Text(emptyTextMessage),
      );
    }
    return Text(
      extractedText,
      style: TextStyle(fontSize: textFontSize),
    );
  }
}
