import 'package:flutter/material.dart';
import 'package:lumi/theme/constants/colors.dart';
import 'package:lumi/widgets/lumi_card_film_widget.dart';

class LumiCardList extends StatelessWidget {
  final List<LumiCardFilm> cards;
  final String emptyStateMessage;
  final String title;

  const LumiCardList(
      {Key key,
      this.cards = const [],
      this.emptyStateMessage = 'Empty List',
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_title, _carousel]));
  }

  get _title => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            width: 32, child: Divider(thickness: 2, color: LUMI_LIGHT_PURPLE)),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(title.toUpperCase(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: LUMI_LIGHT_PURPLE)),
        )
      ]);

  get _carousel => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: cards.isEmpty
            ? [_emptyState]
            : Row(
                children: cards
                    .map((card) => Padding(
                        padding: EdgeInsets.only(right: 8.0), child: card))
                    .toList()),
      );

  get _emptyState => Text(emptyStateMessage);
}
