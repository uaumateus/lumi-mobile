import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumi/widgets/lumi_card_film_widget.dart';

void main() {
  Widget widget = MaterialApp(
      title: 'Test Widget',
      home: LumiCardFilm(title: 'Film Title', subtitle: 'Film Subtitle'));

  testWidgets('Test of LumiCardFilm', (WidgetTester tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(LumiCardFilm), findsOneWidget);
    expect(find.text('Film Title'), findsOneWidget);
    expect(find.text('Film Subtitle'), findsOneWidget);
  });
}
