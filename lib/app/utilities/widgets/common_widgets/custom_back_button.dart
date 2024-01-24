import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const CustomBackButton({super.key, this.top, this.bottom, this.left, this.right});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top ?? 25,
      left: left ?? 5,
      child: Container(
        width: 44,
        height: 44,
        padding: const EdgeInsets.all(11),
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.30000001192092896),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: InkWell(
            onTap: (() => Get.back()),
            child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
