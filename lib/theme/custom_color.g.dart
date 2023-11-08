import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const alternate = Color(0xFFEDE8DF);


CustomColors lightCustomColors = const CustomColors(
  sourceAlternate: Color(0xFFEDE8DF),
  alternate: Color(0xFF6A5F00),
  onAlternate: Color(0xFFFFFFFF),
  alternateContainer: Color(0xFFF7E467),
  onAlternateContainer: Color(0xFF201C00),
);

CustomColors darkCustomColors = const CustomColors(
  sourceAlternate: Color(0xFFEDE8DF),
  alternate: Color(0xFFDAC84E),
  onAlternate: Color(0xFF373100),
  alternateContainer: Color(0xFF504700),
  onAlternateContainer: Color(0xFFF7E467),
);



/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceAlternate,
    required this.alternate,
    required this.onAlternate,
    required this.alternateContainer,
    required this.onAlternateContainer,
  });

  final Color? sourceAlternate;
  final Color? alternate;
  final Color? onAlternate;
  final Color? alternateContainer;
  final Color? onAlternateContainer;

  @override
  CustomColors copyWith({
    Color? sourceAlternate,
    Color? alternate,
    Color? onAlternate,
    Color? alternateContainer,
    Color? onAlternateContainer,
  }) {
    return CustomColors(
      sourceAlternate: sourceAlternate ?? this.sourceAlternate,
      alternate: alternate ?? this.alternate,
      onAlternate: onAlternate ?? this.onAlternate,
      alternateContainer: alternateContainer ?? this.alternateContainer,
      onAlternateContainer: onAlternateContainer ?? this.onAlternateContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceAlternate: Color.lerp(sourceAlternate, other.sourceAlternate, t),
      alternate: Color.lerp(alternate, other.alternate, t),
      onAlternate: Color.lerp(onAlternate, other.onAlternate, t),
      alternateContainer: Color.lerp(alternateContainer, other.alternateContainer, t),
      onAlternateContainer: Color.lerp(onAlternateContainer, other.onAlternateContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
    );
  }
}