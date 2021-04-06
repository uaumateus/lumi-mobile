import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumi/widgets/lumi_default_view_widget.dart';

void main() {
  Widget widget = MaterialApp(
      title: 'Test Widget',
      home: LumiDefaultView(children: [Text('This is a body')]));

  testWidgets('Test of LumiDefaultView', (WidgetTester tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(LumiDefaultView), findsOneWidget);
    expect(find.text('This is a body'), findsOneWidget);
    expect(
        find.widgetWithText(
            TextField, 'Busque por vídeos, disciplinas, gêneros…'),
        findsOneWidget);
  });
}
