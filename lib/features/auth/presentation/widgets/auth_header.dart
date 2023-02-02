import 'package:flutter/material.dart';
import '../../../../core/common/theme.dart' as color show morcGradientAccessColorAppBarDark, morcGradientAccessColorAppBarLight;


class AuthHeader extends StatelessWidget {
  const AuthHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: _HeaderWave(),
        )
      ],
    );
  }
}
class _HeaderWave extends CustomPainter{
   final bool isDarkMode = false; //TODO: cambiar verificación del darkMode

  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient = LinearGradient(colors: isDarkMode ? color.morcGradientAccessColorAppBarDark : color.morcGradientAccessColorAppBarLight);

    final Rect  rect = Rect.fromCircle(
        center: const Offset(150.4, 200.0),
        radius: 180);

    final paint = Paint()
      ..shader = gradient.createShader(rect)
    // ..color = Colors.indigo No aplica el color por el gradiente
      ..strokeWidth = 15
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, 211.0)
      ..quadraticBezierTo(size.width * 0.25, 253.2, size.width * 0.5, 211.0)
      ..quadraticBezierTo(size.width * 0.75, 168.8, size.width, 211.0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}