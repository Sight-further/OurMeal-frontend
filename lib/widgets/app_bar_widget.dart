import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback onNotificationPressed;
  final VoidCallback onSettingPressed;

  const MyAppBar({
    Key? key,
    required this.onNotificationPressed,
    required this.onSettingPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: Container(),
      backgroundColor: Color(0xFFF3F4F6),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/notifications.svg',
            width: 24,
            height: 24,
            color: Colors.black,
          ),
          onPressed: onNotificationPressed,
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/setting.svg',
            width: 24,
            height: 24,
            color: Colors.black,
          ),
          onPressed: onSettingPressed,
        )
      ],
    );
  }
}