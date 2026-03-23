// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'HanaNote';

  @override
  String get loading => '加载中...';

  @override
  String get error => '错误';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';
}
