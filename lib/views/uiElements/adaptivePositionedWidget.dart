import 'package:flutter/material.dart';

class AdaptivePositioned extends StatelessWidget {
  final double top;
  final double left;
  final double right;
  final Widget child;

  AdaptivePositioned(this.child, {this.left = 0, this.top = 0, this.right = 0});
  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Positioned(
        left: dynamicSize.width * (left / 360),
        top: MediaQuery.of(context).size.height * (top / 800),
        right: dynamicSize.width * (right / 360),

        //  if the sizing is not correct, then i will add bottom to the adaptive widget to constraint the ui
        child: child);
  }
}
