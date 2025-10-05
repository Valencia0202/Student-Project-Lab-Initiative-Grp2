import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedSvgCheckbox extends StatefulWidget {
  final double size;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final String uncheckedAsset;
  final String checkedAsset;

  const AnimatedSvgCheckbox({
    super.key,
    required this.size,
    this.initialValue = false,
    this.onChanged,
    required this.uncheckedAsset,
    required this.checkedAsset,
  });

  @override
  State<AnimatedSvgCheckbox> createState() => _AnimatedSvgCheckboxState();
}

class _AnimatedSvgCheckboxState extends State<AnimatedSvgCheckbox> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.initialValue;
  }

  void _toggle() {
    setState(() => _checked = !_checked);
    widget.onChanged?.call(_checked);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _toggle,
          borderRadius: BorderRadius.circular(6),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: _checked
                  ? SvgPicture.asset(
                      widget.checkedAsset,
                      key: const ValueKey('checked'),
                      width: widget.size,
                      height: widget.size,
                    )
                  : Opacity(
                      key: const ValueKey('unchecked'),
                      opacity: 0.46,
                      child: SvgPicture.asset(
                        widget.uncheckedAsset,
                        width: widget.size,
                        height: widget.size,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
