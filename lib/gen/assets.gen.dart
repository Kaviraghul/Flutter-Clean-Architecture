/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/hollow_circle_ic.svg
  SvgGenImage get hollowCircleIc =>
      const SvgGenImage('assets/images/hollow_circle_ic.svg');

  /// File path: assets/images/left_arrow_ic.svg
  SvgGenImage get leftArrowIc =>
      const SvgGenImage('assets/images/left_arrow_ic.svg');

  /// File path: assets/images/login_ic.png
  AssetGenImage get loginIc =>
      const AssetGenImage('assets/images/login_ic.png');

  /// File path: assets/images/on_boarding_image_1.png
  AssetGenImage get onBoardingImage1 =>
      const AssetGenImage('assets/images/on_boarding_image_1.png');

  /// File path: assets/images/on_boarding_image_2.png
  AssetGenImage get onBoardingImage2 =>
      const AssetGenImage('assets/images/on_boarding_image_2.png');

  /// File path: assets/images/on_boarding_image_3.png
  AssetGenImage get onBoardingImage3 =>
      const AssetGenImage('assets/images/on_boarding_image_3.png');

  /// File path: assets/images/on_boarding_image_4.png
  AssetGenImage get onBoardingImage4 =>
      const AssetGenImage('assets/images/on_boarding_image_4.png');

  /// File path: assets/images/right_arrow_ic.svg
  SvgGenImage get rightArrowIc =>
      const SvgGenImage('assets/images/right_arrow_ic.svg');

  /// File path: assets/images/solid_circle_ic.svg
  SvgGenImage get solidCircleIc =>
      const SvgGenImage('assets/images/solid_circle_ic.svg');

  /// List of all assets
  List<dynamic> get values => [
        hollowCircleIc,
        leftArrowIc,
        loginIc,
        onBoardingImage1,
        onBoardingImage2,
        onBoardingImage3,
        onBoardingImage4,
        rightArrowIc,
        solidCircleIc
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
