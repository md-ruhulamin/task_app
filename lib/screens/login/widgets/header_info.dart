import 'package:flutter/material.dart';
import 'package:task_app/core/constants/asset_images.dart';
import 'package:task_app/core/utils/app_style.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(AssetImages.logo),
            height: 98,
            width: 98,
          ),
          SizedBox(height: 10),
          Text(
            "SCUBE",
            style: AppStyle.textStyle22.copyWith(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " Control & Monitoring System",
            style: AppStyle.textStyle22.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}