import 'package:flutter/material.dart';
import 'dart:ui';

class CustomModalProgressHUD extends StatelessWidget {
  final bool inAsyncCall;
  final Widget child;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final double blur;

  const CustomModalProgressHUD({
    super.key,
    required this.inAsyncCall,
    required this.child,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    this.blur = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    Widget layoutProgressIndicator;
    if (offset == null) {
      layoutProgressIndicator = Center(child: progressIndicator);
    } else {
      layoutProgressIndicator = Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: progressIndicator,
      );
    }

    return Stack(
      children: [
        child,
        if (inAsyncCall) ...[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Opacity(
              opacity: opacity,
              child: ModalBarrier(dismissible: dismissible, color: color),
            ),
          ),
          layoutProgressIndicator,
        ],
      ],
    );
  }
}
