// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '花笺';

  @override
  String get loading => '加载中...';

  @override
  String get error => '错误';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get goodMorning => '早上好';

  @override
  String get goodAfternoon => '下午好';

  @override
  String get goodEvening => '晚上好';

  @override
  String get addDrug => '添加药物';

  @override
  String get editDrug => '编辑药物';

  @override
  String get drugName => '药物名称';

  @override
  String get genericName => '通用名称';

  @override
  String get dosage => '剂量';

  @override
  String get frequency => '频率';

  @override
  String get takeDose => '服药';

  @override
  String get skipDose => '跳过';

  @override
  String get save => '保存';

  @override
  String get delete => '删除';

  @override
  String get confirm => '确认';

  @override
  String get inventory => '库存';

  @override
  String get remaining => '剩余';

  @override
  String get lowStock => '库存不足';

  @override
  String daysLeft(String days) {
    return '剩余 $days 天';
  }

  @override
  String nextTime(String time) {
    return '下次: $time';
  }

  @override
  String get completedDose => '已完成';

  @override
  String get noActiveDrugs => '暂无药物';

  @override
  String get addFirstDrug => '添加您的第一个药物';

  @override
  String get category => '类别';

  @override
  String get route => '给药方式';

  @override
  String get unit => '单位';

  @override
  String get notes => '备注';

  @override
  String get injectionSite => '注射部位';

  @override
  String get patchSite => '贴片部位';

  @override
  String get quantity => '数量';

  @override
  String get active => '活跃';

  @override
  String get inactive => '已停用';

  @override
  String get today => '今日';

  @override
  String get medications => '药物';
}
