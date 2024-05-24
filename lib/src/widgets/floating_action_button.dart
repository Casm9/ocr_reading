import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/ocr_bloc.dart';

class OCRFloatingActionButton extends StatelessWidget {
  const OCRFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<OcrBloc>().pickImage(context);
      },
      child: const Icon(Icons.add),
    );
  }
}
