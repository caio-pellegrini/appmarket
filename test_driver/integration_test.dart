import 'dart:io';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  try {
    await integrationDriver(onScreenshot:
        (String screenshotName, List<int> screenshotBytes,
            [Map<String, Object?>? args]) async {
      final File image =
          await File('screenshots/$screenshotName.png').create(recursive: true);
      image.writeAsBytesSync(screenshotBytes);
      print('Screenshot salvo com sucesso em $image');
      return true;
    });
  } catch (e) {
    print('Erro ao salvar screenshot: $e');
  }
}
