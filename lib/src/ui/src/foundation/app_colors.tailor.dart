// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_colors.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppColorsTailorMixin on ThemeExtension<AppColors> {
  Color get white;
  Color get black;
  Color get royal100;
  Color get royal200;
  Color get royal300;
  Color get gold;
  Color get bottomNavBarInactive;

  @override
  AppColors copyWith({
    Color? white,
    Color? black,
    Color? royal100,
    Color? royal200,
    Color? royal300,
    Color? gold,
    Color? bottomNavBarInactive,
  }) {
    return AppColors(
      white: white ?? this.white,
      black: black ?? this.black,
      royal100: royal100 ?? this.royal100,
      royal200: royal200 ?? this.royal200,
      royal300: royal300 ?? this.royal300,
      gold: gold ?? this.gold,
      bottomNavBarInactive: bottomNavBarInactive ?? this.bottomNavBarInactive,
    );
  }

  @override
  AppColors lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this as AppColors;
    return AppColors(
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      royal100: Color.lerp(royal100, other.royal100, t)!,
      royal200: Color.lerp(royal200, other.royal200, t)!,
      royal300: Color.lerp(royal300, other.royal300, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      bottomNavBarInactive:
          Color.lerp(bottomNavBarInactive, other.bottomNavBarInactive, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            const DeepCollectionEquality().equals(white, other.white) &&
            const DeepCollectionEquality().equals(black, other.black) &&
            const DeepCollectionEquality().equals(royal100, other.royal100) &&
            const DeepCollectionEquality().equals(royal200, other.royal200) &&
            const DeepCollectionEquality().equals(royal300, other.royal300) &&
            const DeepCollectionEquality().equals(gold, other.gold) &&
            const DeepCollectionEquality()
                .equals(bottomNavBarInactive, other.bottomNavBarInactive));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(white),
      const DeepCollectionEquality().hash(black),
      const DeepCollectionEquality().hash(royal100),
      const DeepCollectionEquality().hash(royal200),
      const DeepCollectionEquality().hash(royal300),
      const DeepCollectionEquality().hash(gold),
      const DeepCollectionEquality().hash(bottomNavBarInactive),
    );
  }
}

extension AppColorsBuildContextProps on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
  Color get white => appColors.white;
  Color get black => appColors.black;
  Color get royal100 => appColors.royal100;
  Color get royal200 => appColors.royal200;
  Color get royal300 => appColors.royal300;
  Color get gold => appColors.gold;
  Color get bottomNavBarInactive => appColors.bottomNavBarInactive;
}
