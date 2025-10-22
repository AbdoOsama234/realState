import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    this.onTap,
    this.size,
    required this.width,
    this.iconImage,
    this.color,
    this.height,
    this.textAlignment = TextAlign.center, // ✅ القيمة الافتراضية
  });

  final String text;
  final Function()? onTap;
  final double? size;
  final double width;
  final double? height;
  final String? iconImage;
  final Color? color;
  final TextAlign textAlignment; // ✅ نوعه TextAlign

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        decoration: BoxDecoration(
          color: color ?? Colors.brown,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ✅ النص في المكان اللي المستخدم يختاره
            Align(
              alignment: textAlignment == TextAlign.left
                  ? Alignment.centerLeft
                  : textAlignment == TextAlign.right
                  ? Alignment.centerRight
                  : Alignment.center,
              child: CustomText(
                text: text,
                color: Colors.white,
                weight: FontWeight.bold,
                size: size,
              ),
            ),

            // ✅ الأيقونة لو موجودة تتحط على اليمين
            if (iconImage != null)
              Positioned(
                top: 2,
                right: 0,
                child: Image.asset(
                  iconImage!,
                  width: 17,
                  height: 17,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
