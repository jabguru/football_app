import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkImage(
  String mediaUrl, {
  Color? color,
  double? width,
  double? height,
}) {
  return CachedNetworkImage(
    imageUrl: mediaUrl,
    fit: BoxFit.cover,
    width: width,
    height: height,
    placeholder: (context, url) => Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(13.0),
      ),
      width: 26.0,
      height: 26.0,
      // padding: kScreenSCSVPadding,
      // child: const CustomProgressIndicator(),
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
