import 'package:flutter/material.dart';
import 'package:bt_football/models/exports.dart';
import 'package:bt_football/resources/dimens.dart';
import 'package:bt_football/resources/strings.dart';
import 'package:bt_football/utils/player_utils.dart';
import 'package:intl/intl.dart';

class SquadItem extends StatelessWidget {
  final Player? player;
  final EdgeInsets? margin;

  const SquadItem({Key? key, required this.player, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (player == null) return const SizedBox();
    return Container(
      margin: margin ??
          const EdgeInsets.symmetric(
              vertical: AppDimens.zero, horizontal: AppDimens.zero),
      child: Card(
        elevation: AppDimens.actionElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              _buildPlayerAvatar(),
              _buildPlayerBasicInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerAvatar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimens.cardBorderRadius2),
        ),
      ),
      child: CircleAvatar(
        backgroundColor: PlayerUtils.getPositionColor(player?.position ?? ''),
        child: Text(
          PlayerUtils.getPositionInitials(player?.position ?? ''),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPlayerBasicInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPlayerName(),
        _buildPlayerDateOfBirth(),
        _buildPlayerText(text: player?.nationality ?? '', fontSize: 12.0)
      ],
    );
  }

  Widget _buildPlayerName() {
    return _buildPlayerText(
        text: player?.name ?? '',
        fontSize: AppDimens.labelFontSize,
        fontWeight: FontWeight.w600);
  }

  Widget _buildPlayerDateOfBirth() {
    final DateTime? playerDateOfBirth =
    DateTime.tryParse(player?.dateOfBirth ?? '');
    if (playerDateOfBirth == null) return const SizedBox();

    return _buildPlayerText(
        text: DateFormat.yMMMMd(CodeStrings.dateFormatterLocale)
            .format(playerDateOfBirth),
        fontColor: Colors.grey);
  }

  Widget _buildPlayerText(
      {required String text,
        String? label,
        double? fontSize,
        FontWeight? fontWeight,
        Color? fontColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Text(
        label ?? '' + text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
    );
  }
}
