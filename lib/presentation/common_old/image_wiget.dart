import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:starter_kit/core/constants/api_path.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double borderRadius;
  final BoxFit? fit;
  final double shadowHeight;
  const ImageWidget(
      {super.key,
      required this.imageUrl,
      this.borderRadius = 8,
      this.height = 100,
      this.shadowHeight = 0,
      this.width = double.infinity,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl.startsWith("http")
                ? imageUrl
                : Urls.imgBaseUrl + imageUrl,
            fit: BoxFit.cover,
            height: height,
            width: width,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          shadowHeight != 0
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: shadowHeight,
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
