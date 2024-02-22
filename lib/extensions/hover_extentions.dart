import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:my_portfolio/extensions/zoomEffect.dart';

extension HoverExtentions on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');
  Widget get showCursor {
    return MouseRegion(
      child: this,
      onHover: (event) => appContainer?.style.cursor = 'pointer',
      onExit: (event) => appContainer?.style.cursor = 'default',
    );
  }

  Widget get zoomInOnHover {
    return ZoomEffect(
      child: this,
      zoomScale: 1.5,
    );
  }

  Widget get zoomInOnHoverSmall {
    return ZoomEffect(
      child: this,
      zoomScale: 1.1,
    );
  }
}
