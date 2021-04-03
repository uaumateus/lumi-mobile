import 'package:flutter/material.dart';
import 'package:lumi/theme/constants/colors.dart';

class LumiBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      color: LUMI_DARK_GREY_2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _option(icon: Image.asset('assets/icons/home.png'), active: true),
          _option(icon: Image.asset('assets/icons/discover.png'))
        ]),
      ),
    );
  }

  Widget _option({Image icon, bool active = false}) => Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: active ? LUMI_DARK_PURPLE : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0)),
      child: icon);
}
