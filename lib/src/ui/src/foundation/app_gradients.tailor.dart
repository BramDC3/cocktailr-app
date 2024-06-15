// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_gradients.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppGradientsTailorMixin on ThemeExtension<AppGradients> {
  LinearGradient get gold;

  @override
  AppGradients copyWith({
    LinearGradient? gold,
  }) {
    return AppGradients(
      gold: gold ?? this.gold,
    );
  }

  @override
  AppGradients lerp(covariant ThemeExtension<AppGradients>? other, double t) {
    if (other is! AppGradients) return this as AppGradients;
    return AppGradients(
      gold: t < 0.5 ? gold : other.gold,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppGradients &&
            const DeepCollectionEquality().equals(gold, other.gold));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(gold),
    );
  }
}

extension AppGradientsBuildContextProps on BuildContext {
  AppGradients get appGradients => Theme.of(this).extension<AppGradients>()!;
  LinearGradient get gold => appGradients.gold;
}
