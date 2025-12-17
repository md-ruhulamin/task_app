import 'package:flutter/material.dart';

import '../utils/theme/text_theme/app_style.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {

  final bool centerTitle;


  const ReusableAppBar({
    Key? key,

    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(
        "SCM",
        style: AppStyle.textStyle20,
      ),
      actions:
          [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}