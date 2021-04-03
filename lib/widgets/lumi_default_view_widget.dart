import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumi/theme/constants/colors.dart';
import 'package:lumi/widgets/lumi_bottom_navigation_bar_widget.dart';

class LumiDefaultView extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>> globalKey;
  final List<Widget> children;

  const LumiDefaultView({Key key, this.globalKey, this.children})
      : super(key: key);

  @override
  _LumiDefaultViewState createState() => _LumiDefaultViewState();
}

class _LumiDefaultViewState extends State<LumiDefaultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget.globalKey,
        bottomNavigationBar: LumiBottomNavigationBar(),
        body: SafeArea(
            child: Column(children: [
          _appBar,
          SingleChildScrollView(child: Column(children: widget.children)),
        ])));
  }

  Widget get _appBar => Container(
      width: double.maxFinite,
      height: 64,
      color: LUMI_DARK_GREY,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Image.asset('assets/images/logo.png',
                      fit: BoxFit.contain),
                ),
                Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            hintText:
                                'Busque por vídeos, disciplinas, gêneros…',
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none)))
              ])));
}
