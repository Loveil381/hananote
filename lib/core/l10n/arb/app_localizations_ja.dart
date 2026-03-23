// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'HanaNote';

  @override
  String get loading => '読み込み中...';

  @override
  String get error => 'エラー';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';
}
