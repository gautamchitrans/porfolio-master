import 'package:flutter/material.dart';

class FlipEffectWidget extends StatefulWidget {
  const FlipEffectWidget({Key? key}) : super(key: key);

  @override
  State<FlipEffectWidget> createState() => _FlipEffectWidgetState();
}

class _FlipEffectWidgetState extends State<FlipEffectWidget> {
  var color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        color = Colors.blue;
        setState(() {});
      },
      onExit: (event) {
        color = Colors.red;
        setState(() {});
      },
      onHover: (event) {
        color = Colors.yellow;
        setState(() {});
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 200,
          width: 200,
          color: color),
    );
  }
}
