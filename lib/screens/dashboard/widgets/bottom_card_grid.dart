import 'package:flutter/material.dart';
import 'package:task_app/core/constants/asset_images.dart';
import 'package:task_app/screens/dashboard/dashboard.dart';
import 'package:task_app/screens/dashboard/widgets/bottom_card.dart';

class BottomCardsGrid extends StatelessWidget {
  const BottomCardsGrid();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3.2,
        children: [
          BottomCard(icon: AssetImages.chart, title: 'Analysis Pro', context: context),
          BottomCard(icon: AssetImages.gGenerator, title: 'G. Generator', context: context),
          BottomCard(icon: AssetImages.charge, title: 'Plant Summery', context: context),
          BottomCard(icon: AssetImages.fire, title: 'Natural Gas', context: context),
          BottomCard(icon: AssetImages.dGenerator, title: 'D. Generator', context: context),
          BottomCard(icon: AssetImages.faucet, title: 'Water Process', context: context),
        ],
      ),
    );
  }
}