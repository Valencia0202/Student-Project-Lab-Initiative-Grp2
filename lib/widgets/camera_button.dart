import 'package:flutter/material.dart';

class CameraButton extends StatefulWidget {
  final VoidCallback onTap;
  final double size;

  const CameraButton({super.key, required this.onTap, required this.size});

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _scale = 0.9); // shrink slightly on press
      },
      onTapUp: (_) {
        setState(() => _scale = 1.0); // return to normal
        widget.onTap();
      },
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
          child: Center(
            child: Container(
              width: widget.size * 0.85,
              height: widget.size * 0.85,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF606060)),
              child: Center(
                child: Container(
                  width: widget.size * 0.77,
                  height: widget.size * 0.77,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
