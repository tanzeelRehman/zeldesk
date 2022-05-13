import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeldesk/core/constants/colors.dart';

Column textDesc(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        'lib/assets/images/support2.svg',
        width: 300,
        height: 250,
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Text(
            'Welcome to',
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 40),
          ),
          const Text(
            ' ZelDesk',
            style: TextStyle(
              color: klightblack,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const Text(
        'Support Center',
        style: TextStyle(
          color: faddedGreen,
          fontSize: 80,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Text(
            "Very simple & fast tickting soloution for your company",
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 20),
          ),
        ],
      ),
    ],
  );
}
