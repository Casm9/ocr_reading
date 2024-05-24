import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/ocr_bloc.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.emptyTextMessage,
    required this.imageWidth,
  });

  final String emptyTextMessage;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    final selectedMedia = context.watch<OcrBloc>().selectedMedia;
    if (selectedMedia == null) {
      return Center(
        child: Text(emptyTextMessage),
      );
    }
    return Center(
      child: Image.file(selectedMedia, width: imageWidth),
    );
  }
}
