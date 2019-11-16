import 'package:flutter/material.dart';
class YLStatisticsIndictor extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return _YLIndictorPainter();
  }
}

class _YLIndictorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = Color(0xff376BD1);
    paint.style = PaintingStyle.fill;
    final w = 24.0;
    final h = 2.5;
    canvas.drawRect(
        Rect.fromLTWH(offset.dx + 16, configuration.size.height - h, w, h),
        paint);
  }
}
