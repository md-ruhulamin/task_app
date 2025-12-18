import 'package:flutter/material.dart';
import 'package:task_app/core/constants/asset_images.dart';

import '../utils/app_style.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle;

  const ReusableAppBar({Key? key, this.centerTitle = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: centerTitle,
      title: Text("SCM", style: AppStyle.textStyle20),
      actions: [
        IconButton(
          icon: Image.asset(AssetImages.bell, width: 22, height: 22),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
