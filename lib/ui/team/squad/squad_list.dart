import 'package:flutter/material.dart';

class SquadList extends StatelessWidget {
  final IndexedWidgetBuilder squadItemBuilder;
  final int? itemsCount;

  const SquadList({
    Key? key,
    required this.squadItemBuilder,
    this.itemsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemsCount ?? 0,
        padding: const EdgeInsets.all(0.0),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: squadItemBuilder);
  }
}
