import 'package:flutter/material.dart';
import 'package:flutter_pos_app/styles/my_colors.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({required this.title, required this.subTitle, super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: MyColors.fontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '$subTitle',
              style:  TextStyle(
                color: MyColors.subTitleColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
