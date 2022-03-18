/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/jacket.png
  AssetGenImage get jacket => const AssetGenImage('assets/images/jacket.png');

  /// File path: assets/images/shoe_thumb_1.png
  AssetGenImage get shoeThumb1 =>
      const AssetGenImage('assets/images/shoe_thumb_1.png');

  /// File path: assets/images/shoe_thumb_2.png
  AssetGenImage get shoeThumb2 =>
      const AssetGenImage('assets/images/shoe_thumb_2.png');

  /// File path: assets/images/shoe_thumb_3.png
  AssetGenImage get shoeThumb3 =>
      const AssetGenImage('assets/images/shoe_thumb_3.png');

  /// File path: assets/images/shoe_thumb_4.png
  AssetGenImage get shoeThumb4 =>
      const AssetGenImage('assets/images/shoe_thumb_4.png');

  /// File path: assets/images/shoe_thumb_5.png
  AssetGenImage get shoeThumb5 =>
      const AssetGenImage('assets/images/shoe_thumb_5.png');

  /// File path: assets/images/shoe_tilt_2.png
  AssetGenImage get shoeTilt2 =>
      const AssetGenImage('assets/images/shoe_tilt_2.png');

  /// File path: assets/images/shooe_tilt_1.png
  AssetGenImage get shooeTilt1 =>
      const AssetGenImage('assets/images/shooe_tilt_1.png');

  /// File path: assets/images/show_1.png
  AssetGenImage get show1 => const AssetGenImage('assets/images/show_1.png');

  /// File path: assets/images/small_tilt_shoe_1.png
  AssetGenImage get smallTiltShoe1 =>
      const AssetGenImage('assets/images/small_tilt_shoe_1.png');

  /// File path: assets/images/small_tilt_shoe_2.png
  AssetGenImage get smallTiltShoe2 =>
      const AssetGenImage('assets/images/small_tilt_shoe_2.png');

  /// File path: assets/images/small_tilt_shoe_3.png
  AssetGenImage get smallTiltShoe3 =>
      const AssetGenImage('assets/images/small_tilt_shoe_3.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/watch.png
  AssetGenImage get watch => const AssetGenImage('assets/images/watch.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
