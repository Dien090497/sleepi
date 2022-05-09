import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';

class SFImageNetwork extends StatelessWidget {
  const SFImageNetwork({required this.url, this.width, this.height, Key? key})
      : super(key: key);

  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider),
          ),
        );
      },
      placeholder: (_, url) => const LoadingIcon(),
      errorWidget: (_, url, e) => const Icon(Icons.error_outline),
    );
  }
}
