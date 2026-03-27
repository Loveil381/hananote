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

  @override
  String get goodMorning => 'おはよう';

  @override
  String get goodAfternoon => 'こんにちは';

  @override
  String get goodEvening => 'こんばんは';

  @override
  String get addDrug => '薬を追加';

  @override
  String get editDrug => '薬を編集';

  @override
  String get drugName => '薬の名前';

  @override
  String get genericName => '一般名';

  @override
  String get dosage => '用量';

  @override
  String get frequency => '頻度';

  @override
  String get takeDose => '服薬を記録';

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
  String get lowStock => '在庫が少ないです';

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
  String get noActiveDrugs => '有効な薬がありません';

  @override
  String get addFirstDrug => '最初の薬を追加する';

  @override
  String get category => 'カテゴリ';

  @override
  String get route => '投与経路';

  @override
  String get unit => '単位';

  @override
  String get notes => 'メモ';

  @override
  String get injectionSite => '注射部位';

  @override
  String get patchSite => '貼付部位';

  @override
  String get quantity => '数量';

  @override
  String get active => '有効';

  @override
  String get inactive => '無効';

  @override
  String get today => '今日';

  @override
  String get medications => '薬';

  @override
  String get photoGallery => '暗号化アルバム';

  @override
  String get addPhoto => '写真を追加';

  @override
  String get takePhoto => '撮影する';

  @override
  String get chooseFromLibrary => 'アルバムから選ぶ';

  @override
  String get photoEmptyTitle => 'まだ暗号化写真がありません';

  @override
  String get photoEmptyDescription => '写真はエンドツーエンドで暗号化され、あなた以外は閲覧できません。';

  @override
  String get photoDeleteTitle => '写真を削除';

  @override
  String get photoDeleteMessage => '暗号化ファイルと記録をまとめて削除します。';

  @override
  String get retry => '再試行';

  @override
  String get fileSize => 'ファイルサイズ';

  @override
  String get errorFallbackTitle => '問題が発生しました';

  @override
  String get errorFallbackDescription => 'アプリを再度開いてください。問題が続く場合はサポートに連絡してください。';
}
