import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final Color bgColor;
  final Animation<Color> circleColor;
  AppLoader({this.bgColor, this.circleColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor ?? Colors.grey.withOpacity(0.8),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: this.circleColor,
        ),
      ),
    );
  }
}
