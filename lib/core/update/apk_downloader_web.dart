import 'package:hananote/core/update/update_service.dart';

/// No-op APK downloader for web platform.
///
/// APK downloads are not supported on web.
Future<String> downloadApkFile(
  String url,
  void Function(DownloadProgress progress) onProgress,
) async {
  throw UnsupportedError('APK download is not supported on web.');
}
