<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

The ocr_reading package contains a number of useful containers with functionality that can help you with building ocr reading screens for your app. The package contains image container and result text.

## Features

![](https://raw.githubusercontent.com/Casm9/my-github-storage/main/ocr-reading.jpg)

## Usage

```dart
class OcrReading extends StatelessWidget {
  const OcrReading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OcrReading(
          emptyTextMessageForImage = "Pick an image for text recognition",
          imageWidth = 200,
          emptyTextMessageForText = "No result.",
          textFontSize = 25
        ),
      ),
    );
  }
}
```
