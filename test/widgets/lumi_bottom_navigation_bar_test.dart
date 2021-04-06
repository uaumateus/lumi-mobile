import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumi/widgets/lumi_bottom_navigation_bar_widget.dart';

void main() {
  Widget widget =
      MaterialApp(title: 'Test Widget', home: LumiBottomNavigationBar());

  testWidgets('Test of LumiBottomNavigationBar', (WidgetTester tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(LumiBottomNavigationBar), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(2));
  });
}
