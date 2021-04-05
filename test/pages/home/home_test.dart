import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumi/core/data/repositories/data_video_repository.dart';
import 'package:lumi/core/domain/entities/video_entity.dart';
import 'package:lumi/pages/home/home_controller.dart';
import 'package:lumi/pages/home/home_page.dart';
import 'package:lumi/widgets/lumi_card_film_widget.dart';
import 'package:mockito/mockito.dart';

class MockVideoRepository extends Mock implements DataVideoRepository {}

void main() {
  Widget widget;
  final mockVideoRepository = MockVideoRepository();
  HomeController controller;

  Video _video =
      Video(title: 'As branquelas', description: 'Narrativas Multimidia');

  setUp(() {
    controller = HomeController(mockVideoRepository);
    widget = MaterialApp(
        title: 'Test Home Page', home: HomePage(controller: controller));
  });

  testWidgets('Default test of Home page', (WidgetTester tester) async {
    when(mockVideoRepository.listVideos())
        .thenAnswer((_) => Future.value([_video]));

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);

    expect(find.widgetWithText(LumiCardFilm, _video.title), findsOneWidget);
    expect(
        find.widgetWithText(LumiCardFilm, _video.description), findsOneWidget);

    expect(find.text('Nenhum vídeo'), findsNothing);
  });

  testWidgets('Test of Home page - Empty list', (WidgetTester tester) async {
    when(mockVideoRepository.listVideos()).thenAnswer((_) => Future.value([]));

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);

    expect(find.widgetWithText(LumiCardFilm, _video.title), findsNothing);
    expect(find.widgetWithText(LumiCardFilm, _video.description), findsNothing);

    expect(find.text('Nenhum vídeo'), findsOneWidget);
  });

  testWidgets('Test of Home page - Error on fetching list',
      (WidgetTester tester) async {
    when(mockVideoRepository.listVideos()).thenThrow(UnimplementedError());

    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);

    expect(find.widgetWithText(LumiCardFilm, _video.title), findsNothing);
    expect(find.widgetWithText(LumiCardFilm, _video.description), findsNothing);

    expect(find.text('Nenhum vídeo'), findsOneWidget);
  });
}
