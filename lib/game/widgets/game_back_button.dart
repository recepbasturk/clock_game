import 'package:flutter/material.dart';

class GameBackButton extends StatelessWidget {
  const GameBackButton({
    super.key,
    this.iconColor,
    this.onTap,
    this.icon,
  });

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
