// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_typography.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppTypographyTailorMixin on ThemeExtension<AppTypography> {
  TextStyle get title1;
  TextStyle get title2;
  TextStyle get title3;
  TextStyle get title4;
  TextStyle get ingredientItem;
  TextStyle get paragraph;
  TextStyle get bottomNavBar;

  @override
  AppTypography copyWith({
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? title4,
    TextStyle? ingredientItem,
    TextStyle? paragraph,
    TextStyle? bottomNavBar,
  }) {
    return AppTypography(
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      title4: title4 ?? this.title4,
      ingredientItem: ingredientItem ?? this.ingredientItem,
      paragraph: paragraph ?? this.paragraph,
      bottomNavBar: bottomNavBar ?? this.bottomNavBar,
    );
  }

  @override
  AppTypography lerp(covariant ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this as AppTypography;
    return AppTypography(
      title1: TextStyle.lerp(title1, other.title1, t)!,
      title2: TextStyle.lerp(title2, other.title2, t)!,
      title3: TextStyle.lerp(title3, other.title3, t)!,
      title4: TextStyle.lerp(title4, other.title4, t)!,
      ingredientItem: TextStyle.lerp(ingredientItem, other.ingredientItem, t)!,
      paragraph: TextStyle.lerp(paragraph, other.paragraph, t)!,
      bottomNavBar: TextStyle.lerp(bottomNavBar, other.bottomNavBar, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTypography &&
            const DeepCollectionEquality().equals(title1, other.title1) &&
            const DeepCollectionEquality().equals(title2, other.title2) &&
            const DeepCollectionEquality().equals(title3, other.title3) &&
            const DeepCollectionEquality().equals(title4, other.title4) &&
            const DeepCollectionEquality()
                .equals(ingredientItem, other.ingredientItem) &&
            const DeepCollectionEquality().equals(paragraph, other.paragraph) &&
            const DeepCollectionEquality()
                .equals(bottomNavBar, other.bottomNavBar));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(title1),
      const DeepCollectionEquality().hash(title2),
      const DeepCollectionEquality().hash(title3),
      const DeepCollectionEquality().hash(title4),
      const DeepCollectionEquality().hash(ingredientItem),
      const DeepCollectionEquality().hash(paragraph),
      const DeepCollectionEquality().hash(bottomNavBar),
    );
  }
}

extension AppTypographyBuildContextProps on BuildContext {
  AppTypography get appTypography => Theme.of(this).extension<AppTypography>()!;
  TextStyle get title1 => appTypography.title1;
  TextStyle get title2 => appTypography.title2;
  TextStyle get title3 => appTypography.title3;
  TextStyle get title4 => appTypography.title4;
  TextStyle get ingredientItem => appTypography.ingredientItem;
  TextStyle get paragraph => appTypography.paragraph;
  TextStyle get bottomNavBar => appTypography.bottomNavBar;
}
