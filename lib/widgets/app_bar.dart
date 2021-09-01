import 'package:flutter/material.dart';

class RapupAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool isProfileScreen;
  final Widget leading;
  final Widget center;
  final Widget trailing;
  final Color backgroundColor;

  const RapupAppBar({
    Key key,
    @required this.height,
    this.leading,
    @required this.center,
    this.trailing,
    this.isProfileScreen = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: height,
      color: backgroundColor == null
          ? Theme.of(context).primaryColor
          : backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: leading,
            ),
          ),
          Expanded(
            child: Align(
              child: center,
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.centerRight,
              child: trailing,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}