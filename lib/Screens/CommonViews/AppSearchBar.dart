import 'package:flutter/material.dart';

import 'AppTextField.dart';

class AppSearchBar extends StatelessWidget {
  final Function onChange;
  final String hintText;
  final TextEditingController controller;
  const AppSearchBar(
      {Key key, @required this.controller, this.hintText, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: AppTextField(
        controller: this.controller,
        isPrefixIcon: true,
        prefixIcon: Icons.search,
        hintText: this.hintText,
        height: 60,
        onChange: this.onChange,
      ),
    );
  }
}
