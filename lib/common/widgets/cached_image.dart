import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(
      {Key? key, required this.image, this.height, this.width, this.boxFit})
      : super(key: key);

  final String image;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 40.0,
          height: 40.0,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) {
        return Container(
            decoration: const BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Icon(Icons.error, color: Colors.red));
      },
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
        ),
      ),
      height: height,
      fit: boxFit,
      width: width,
    );
  }
}
