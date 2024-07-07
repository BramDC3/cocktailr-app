import 'package:flutter/material.dart';

import '../foundation/app_colors.dart';

class ListItemDivider extends StatelessWidget {
  const ListItemDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 1.5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.royal100,
        ),
      ),
    );
  }
}
