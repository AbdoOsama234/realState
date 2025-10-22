import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
    this.activeColor = Colors.redAccent,
    this.inactiveColor = Colors.white,
    this.backgroundColor = Colors.brown,
    this.size = 24,
  });

  final bool isFavorite;
  final VoidCallback onTap;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final double size;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 60),
    lowerBound: 0.9,
    upperBound: 1.0,
  )..value = 1;

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _c,
      child: InkWell(
        onTap: () async {
          await _c.reverse();
          await _c.forward();
          widget.onTap();
        },
        borderRadius: BorderRadius.circular(widget.size),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.size),
          ),
          child: Icon(
            widget.isFavorite ? Icons.favorite : Icons.favorite_border,
            color:
            widget.isFavorite ? widget.activeColor : widget.inactiveColor,
            size: widget.size,
          ),
        ),
      ),
    );
  }
}
