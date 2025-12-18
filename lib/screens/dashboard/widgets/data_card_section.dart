import 'package:flutter/material.dart';
import 'package:task_app/core/constants/asset_images.dart';
import 'package:task_app/core/routes/app_routes.dart';
import 'package:task_app/screens/dashboard/widgets/data_card.dart';
import 'package:task_app/screens/dashboard/widgets/total_solar_card.dart';

class DataCardsSection extends StatelessWidget {
  const DataCardsSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          DataCard(
            onTap: () =>context.navigateTo(Routes.dataViewScreen),
            icon: AssetImages.solarCell,
            title: 'Data View',
            status: 'Active',
            statusColor: const Color(0xFF0EA5E9),
            data1: '55505.63',
            data2: '58805.63',
            backgroundColor: const Color(0xFFE5F4FE),
            indicatorColor: const Color(0xFF0EA5E9),
          ),
          DataCard(
            onTap: () =>context.navigateTo(Routes.emptyScreen),

            icon: AssetImages.power,
            title: 'Data Type 2',
            status: 'Active',
            statusColor: const Color(0xFF0EA5E9),
            data1: '55505.63',
            data2: '58805.63',
            backgroundColor: const Color(0xFFE5F4FE),
            indicatorColor: const Color(0xFFF97316),
          ),
          DataCard(
            onTap: () {},
            icon: AssetImages.power2,
            title: 'Data Type 3',
            status: 'Inactive',
            statusColor: const Color(0xFFEF4444),
            data1: '55505.63',
            data2: '58805.63',
            backgroundColor: const Color(0xFFE5F4FE),
            indicatorColor: const Color(0xFF0EA5E9),
          ),
          TotalSolarCard(
            onTap: () {},
            icon: AssetImages.solarCell,
            title: 'Total Solar',
            status: 'Active',
            statusColor: const Color(0xFF0EA5E9),
            data1: '55505.63',
            data2: '58805.63',
            backgroundColor: const Color(0xFFF0F1FF),
            indicatorColor: const Color(0xFF0EA5E9),
          ),
        ],
      ),
    );
  }
}