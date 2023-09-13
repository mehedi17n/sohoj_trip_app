import 'package:flutter/material.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';
import '../../core/helpers/image_helper.dart';

class ItemOptionsWidget extends StatelessWidget {
  const ItemOptionsWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String value;
  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            ImageHelper.loadFromAsset(
              icon,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.defaultStyle.fontCaption,
                ),
                SizedBox(
                  height: kMinPadding,
                ),
                Text(
                  value,
                  style: TextStyles.defaultStyle.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
