import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool isPrefixIcon;
  final double height;
  final Function onChange;
  const AppTextField(
      {Key key,
      this.hintText = '',
      @required this.controller,
      this.prefixIcon,
      this.isPrefixIcon = false,
      this.height = 70,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
          )),
      child: TextField(
        onChanged: (v) => this.onChange(v),
        decoration: isPrefixIcon
            ? InputDecoration(
                prefixIcon: isPrefixIcon
                    ? Icon(Icons.search)
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                fillColor: Colors.white,
                filled: true,
                hintText: hintText,
                border: InputBorder.none)
            : InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: hintText,
                border: InputBorder.none),
        controller: controller,
      ),
    );
  }
}
