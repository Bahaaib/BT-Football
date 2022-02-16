import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bt_football/models/exports.dart';
import 'package:bt_football/resources/dimens.dart';
import 'package:bt_football/resources/strings.dart';

class TeamInfo extends StatelessWidget {
  final Team team;
  final EdgeInsets? margin;

  const TeamInfo({Key? key, required this.team, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
            child: Column(
              children: [
                _buildTeamName(),
                _buildTeamFoundationYear(),
                _buildTeamLogo(),
                _buildTeamBasicInfo()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamName() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Text(
        team.name ?? '',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTeamFoundationYear() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        team.foundationYear.toString(),
        style: const TextStyle(
          //color: Colors.grey,
          fontSize: AppDimens.labelFontSize,
        ),
      ),
    );
  }

  Widget _buildTeamLogo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimens.cardBorderRadius2),
        ),
      ),
      child: _imageSelector(team.logoUrl ?? ''),
    );
  }

  Widget _imageSelector(String url) {
    if (url.isEmpty) return const SizedBox();
    if (url.contains('.svg')) return _renderSvgImage(url);
    return _renderRegularImage(url);
  }

  Widget _renderRegularImage(String url) {
    return FadeInImage.assetNetwork(
        width: 150.0,
        height: 150.0,
        placeholder: CodeStrings.placeholder,
        image: url,
        fit: BoxFit.contain);
  }

  Widget _renderSvgImage(String url) {
    return SizedBox(
      child: SvgPicture.network(url,
          width: 150.0,
          height: 150.0,
          placeholderBuilder: (_) => Image.asset(CodeStrings.placeholder),
          fit: BoxFit.contain),
    );
  }

  Widget _buildTeamBasicInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTeamItem(team.address, Icons.location_on),
        _buildTeamItem(team.phone, Icons.phone),
        _buildTeamItem(team.website, Icons.language),
      ],
    );
  }

  Widget _buildTeamItem(String? text, IconData icon) {
    final String? info = text;
    if (info == null) return const SizedBox();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: Colors.black),
          ),
          Expanded(
            child: Text(
              info,
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
