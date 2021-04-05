import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumi/widgets/lumi_card_film_widget.dart';
import 'package:lumi/widgets/lumi_card_list_widget.dart';

void main() {
  Widget widgetWithCards = MaterialApp(
      title: 'Test Widget',
      home: LumiCardList(title: 'Section Title', cards: [
        LumiCardFilm(title: 'Film Title', subtitle: 'Film Subtitle')
      ]));

  Widget widgetWithoutCards = MaterialApp(
      title: 'Test Widget',
      home: LumiCardList(
          title: 'Section Title', cards: [], emptyStateMessage: 'Empty List'));

  testWidgets('Default test of LumiCardList', (WidgetTester tester) async {
    await tester.pumpWidget(widgetWithCards);

    expect(find.byType(LumiCardList), findsOneWidget);

    expect(find.byType(LumiCardFilm), findsOneWidget);
    expect(find.text('Film Title'), findsOneWidget);
    expect(find.text('Film Subtitle'), findsOneWidget);

    expect(find.text('Empty List'), findsNothing);
  });

  testWidgets('Test of empty list', (WidgetTester tester) async {
    await tester.pumpWidget(widgetWithoutCards);

    expect(find.byType(LumiCardList), findsOneWidget);

    expect(find.byType(LumiCardFilm), findsNothing);
    expect(find.text('Film Title'), findsNothing);
    expect(find.text('Film Subtitle'), findsNothing);

    expect(find.text('Empty List'), findsOneWidget);
  });
}
