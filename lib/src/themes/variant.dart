import 'package:flutter/material.dart';
import 'package:yaru_colors/yaru_colors.dart';
import 'package:yaru/src/themes/kubuntu.dart';
import 'package:yaru/src/themes/lubuntu.dart';
import 'package:yaru/src/themes/ubuntu_budgie.dart';
import 'package:yaru/src/themes/ubuntu_mate.dart';
import 'package:yaru/src/themes/ubuntu_studio.dart';
import 'package:yaru/src/themes/xubuntu.dart';
import 'package:yaru/src/themes/yaru.dart';

/// Describes a Yaru variant and its primary color.
enum YaruVariant {
  orange(YaruColors.orange),
  bark(YaruColors.bark),
  sage(YaruColors.sage),
  olive(YaruColors.olive),
  viridian(YaruColors.viridian),
  prussianGreen(YaruColors.prussianGreen),
  blue(YaruColors.blue),
  purple(YaruColors.purple),
  magenta(YaruColors.magenta),
  red(YaruColors.red),

  /// Kubuntu
  kubuntuBlue(YaruColors.kubuntuBlue),

  /// Lubuntu
  lubuntuBlue(YaruColors.lubuntuBlue),

  /// Ubuntu Budgie
  ubuntuBudgieBlue(YaruColors.ubuntuBudgieBlue),

  /// Ubuntu MATE
  ubuntuMateGreen(YaruColors.ubuntuMateGreen),

  /// Ubuntu Studio
  ubuntuStudioBlue(YaruColors.ubuntuStudioBlue),

  /// Xubuntu
  xubuntuBlue(YaruColors.xubuntuBlue);

  const YaruVariant(this.color);

  /// The primary color of the variant.
  final MaterialColor color;

  /// A light theme for the variant.
  ThemeData get theme => _yaruLightThemes[this]!;

  /// A dark theme for the variant.
  ThemeData get darkTheme => _yaruDarkThemes[this]!;
}

final _yaruLightThemes = <YaruVariant, ThemeData>{
  YaruVariant.orange: yaruLight,
  YaruVariant.bark: yaruBarkLight,
  YaruVariant.sage: yaruSageLight,
  YaruVariant.olive: yaruOliveLight,
  YaruVariant.viridian: yaruViridianLight,
  YaruVariant.prussianGreen: yaruPrussianGreenLight,
  YaruVariant.blue: yaruBlueLight,
  YaruVariant.purple: yaruPurpleLight,
  YaruVariant.magenta: yaruMagentaLight,
  YaruVariant.red: yaruRedLight,
  YaruVariant.kubuntuBlue: yaruKubuntuLight,
  YaruVariant.lubuntuBlue: yaruLubuntuLight,
  YaruVariant.ubuntuBudgieBlue: yaruUbuntuBudgieLight,
  YaruVariant.ubuntuMateGreen: yaruUbuntuMateLight,
  YaruVariant.ubuntuStudioBlue: yaruUbuntuStudioLight,
  YaruVariant.xubuntuBlue: yaruXubuntuLight,
};

final _yaruDarkThemes = <YaruVariant, ThemeData>{
  YaruVariant.orange: yaruDark,
  YaruVariant.bark: yaruBarkDark,
  YaruVariant.sage: yaruSageDark,
  YaruVariant.olive: yaruOliveDark,
  YaruVariant.viridian: yaruViridianDark,
  YaruVariant.prussianGreen: yaruPrussianGreenDark,
  YaruVariant.blue: yaruBlueDark,
  YaruVariant.purple: yaruPurpleDark,
  YaruVariant.magenta: yaruMagentaDark,
  YaruVariant.red: yaruRedDark,
  YaruVariant.kubuntuBlue: yaruKubuntuDark,
  YaruVariant.lubuntuBlue: yaruLubuntuDark,
  YaruVariant.ubuntuBudgieBlue: yaruUbuntuBudgieDark,
  YaruVariant.ubuntuMateGreen: yaruUbuntuMateDark,
  YaruVariant.ubuntuStudioBlue: yaruUbuntuStudioDark,
  YaruVariant.xubuntuBlue: yaruXubuntuDark,
};
