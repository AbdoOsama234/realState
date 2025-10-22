import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isEmail;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.icon = Icons.email_outlined,
    this.isEmail = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // 🔹 تأثير الزجاج (الضبابية)
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2), // 🔹 شفاف مع لمعة خفيفة
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white.withOpacity(0.3)), // 🔹 حدود بيضاء شفافة
          ),
          child: TextField(
            cursorColor: Colors.white,
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.isEmail
                ? TextInputType.emailAddress
                : TextInputType.text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white, // 🔹 الكتابة باللون الأبيض
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(widget.icon, color: Colors.white70),
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                onTap: _togglePassword,
                child: Icon(
                  _obscureText
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash,
                  color: Colors.white70,
                ),
              )
                  : null,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 16, horizontal: 20),
            ),
          ),
        ),
      ),
    );
  }
}
