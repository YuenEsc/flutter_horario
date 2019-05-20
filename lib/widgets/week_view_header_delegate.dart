import 'package:flutter/material.dart';
import 'package:flutter_horario/widgets/day_tile.dart';

import 'package:flutter_horario/models/colors.dart';

class WeekViewHeaderDelegate extends SliverPersistentHeaderDelegate {

  static const headerHeight = 50.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: maximumBlueGreen,
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DayTile("Hora"),
              DayTile("Lun"),
              DayTile("Mar"),
              DayTile("Mié"),
              DayTile("Jue"),
              DayTile("Vie"),
            ],
          )
      ),
    );
  }

  @override
  double get maxExtent => headerHeight;

  @override
  double get minExtent => headerHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}