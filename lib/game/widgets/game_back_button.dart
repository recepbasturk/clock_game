import 'package:flutter/material.dart';

class GameBackButton extends StatelessWidget {
  const GameBackButton({
    Key? key,
    this.iconColor,
    this.onTap,
    this.icon,
  }) : super(key: key);

  final Color? iconColor;
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon ?? Icons.settings,
        size: 30.0,
        color: iconColor ?? Colors.black,
      ),
    );
  }
}
