import 'package:flutter/material.dart';

import '../svg_asset.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.maybePop(context),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      icon: const SvgAsset(
        assetName: 'assets/icons/ic_back.svg',
      ),
    );
  }
}
