import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constans/colors.dart';

class CustomSkelton extends StatelessWidget {
  final double height, width;
  final Color colorShimmer;
  final BoxShape boxShape;
  final BorderRadius? borderRadius;
  const CustomSkelton({
    required this.height,
    required this.width,
    this.colorShimmer = MyColors.shadow,
    this.boxShape = BoxShape.rectangle,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.brandColor,
      highlightColor: MyColors.shadow,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colorShimmer,
          borderRadius: borderRadius,
          shape: boxShape,
        ),
      ),
    );
  }
}

// class SkeltonCircle extends StatefulWidget {
//   final double height, width;
//   const SkeltonCircle({
//     required this.height,
//     required this.width,
//     super.key,
//   });

//   @override
//   State<SkeltonCircle> createState() => _SkeltonCircleState();
// }

// class _SkeltonCircleState extends State<SkeltonCircle> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width,
//       height: widget.height,
//       padding: const EdgeInsets.all(8),
//       decoration: const BoxDecoration(
//         color: Colors.black26,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }
