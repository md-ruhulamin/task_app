import 'package:flutter/material.dart';


class TopRoundedCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textcolor;
  final EdgeInsetsGeometry padding;

  const TopRoundedCard({
    Key? key,
    required this.text,
    required this.textcolor,

    this.color,
    this.padding = const EdgeInsets.all(10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: padding,
        child: Text(
          text,

          textAlign: TextAlign.center,style: TextStyle(color: textcolor),
        ),
      ),
    );
  }
}


class ThreeColumnHeader extends StatelessWidget {
  const ThreeColumnHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        // First item with blue background
        TopRoundedCard(
          text: "Summary",
          color: Colors.blue,
          textcolor: Colors.white,
        ),
        // Second item (no background color)
        TopRoundedCard(
          text: "SLD",
          textcolor: Colors.blueGrey,
        ),
        // Third item (no background color)
        TopRoundedCard(
          text: "Data",
          textcolor: Colors.blueGrey,
        ),
      ],
    );
  }
}