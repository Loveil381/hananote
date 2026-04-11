import 'dart:io';

import 'package:hananote/core/update/update_service.dart';
import 'package:path_provider/path_provider.dart';

/// Downloads APK to cache directory on native platforms.
Future<String> downloadApkFile(
  String url,
  void Function(DownloadProgress progress) onProgress,
) async {
  final client = HttpClient();
  try {
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();
    final contentLength = response.contentLength;

    final cacheDir = await getTemporaryDirectory();
    final file = File('${cacheDir.path}/hananote_update.apk');
    final sink = file.openWrite();
    var received = 0;
    var lastTime = DateTime.now();
    var lastReceived = 0;
    var currentSpeed = 0.0;

    await for (final chunk in response) {
      sink.add(chunk);
      received += chunk.length;

      // Calculate speed every 500ms
      final now = DateTime.now();
      final elapsed = now.difference(lastTime).inMilliseconds;
      if (elapsed >= 500) {
        final bytesInPeriod = received - lastReceived;
        currentSpeed = bytesInPeriod / (elapsed / 1000);
        lastTime = now;
        lastReceived = received;
      }

      onProgress(
        DownloadProgress(
          received: received,
          total: contentLength,
          speed: currentSpeed,
        ),
      );
    }

    await sink.close();
    return file.path;
  } finally {
    client.close();
  }
}
