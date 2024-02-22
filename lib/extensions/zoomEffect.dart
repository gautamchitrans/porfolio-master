import 'package:flutter/material.dart';

class ZoomEffect extends StatefulWidget {
  final Widget? child;
  final double? zoomScale;
  const ZoomEffect({Key? key, this.child, this.zoomScale}) : super(key: key);

  @override
  _ZoomEffectState createState() => _ZoomEffectState();
}

class _ZoomEffectState extends State<ZoomEffect> {
  final nonHoverTransform = Matrix4.identity();
  late final hoverTransform;

  bool isHover = false;

  @override
  void initState() {
    hoverTransform = Matrix4.identity()..scale(widget.zoomScale);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (e) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transformAlignment: Alignment.center,
        child: widget.child,
        curve: Curves.linear,
        transform: isHover ? hoverTransform : nonHoverTransform,
      ),
    );
  }
}
