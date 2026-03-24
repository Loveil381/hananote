// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '花箋';

  @override
  String get loading => '読み込み中...';

  @override
  String get error => 'エラー';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get goodMorning => 'おはようございます';

  @override
  String get goodAfternoon => 'こんにちは';

  @override
  String get goodEvening => 'こんばんは';

  @override
  String get addDrug => 'お薬を追加';

  @override
  String get editDrug => 'お薬を編集';

  @override
  String get drugName => 'お薬の名前';

  @override
  String get genericName => '一般名';

  @override
  String get dosage => '用量';

  @override
  String get frequency => '頻度';

  @override
  String get takeDose => '服薬';

  @override
  String get skipDose => 'スキップ';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get confirm => '確認';

  @override
  String get inventory => '在庫';

  @override
  String get remaining => '残り';

  @override
  String get lowStock => '在庫僅少';

  @override
  String daysLeft(String days) {
    return '残り $days 日';
  }

  @override
  String nextTime(String time) {
    return '次回: $time';
  }

  @override
  String get completedDose => '完了';

  @override
  String get noActiveDrugs => 'アクティブなお薬はありません';

  @override
  String get addFirstDrug => '最初のお薬を追加する';

  @override
  String get category => 'カテゴリ';

  @override
  String get route => '投与ルート';

  @override
  String get unit => '単位';

  @override
  String get notes => 'メモ';

  @override
  String get injectionSite => '注射部位';

  @override
  String get patchSite => 'パッチ部位';

  @override
  String get quantity => '数量';

  @override
  String get active => 'アクティブ';

  @override
  String get inactive => '停止中';

  @override
  String get today => '今日';

  @override
  String get medications => 'お薬';
}
