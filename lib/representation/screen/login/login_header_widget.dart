import 'package:flutter/material.dart';

import '../../../core/constants/dimension_constants.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/helpers/asset_helper.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Image(image: const AssetImage(tlogo), height: size.height * 0.2),
        Text(
          tLoginTitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kMediumPadding * 2, vertical: kDefaultPadding),
        ),
        // Text(
        //   tLoginSubTitle,
        //   style: Theme.of(context).textTheme.bodyMedium,
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }
}
