import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constraints/colors.dart';

class AttractionItem extends StatelessWidget {
  final String image;
  final String title;

  const AttractionItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 38.0,
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 9.0),
          onPressed: () {},
          child: Row(
            children: [
              SvgPicture.asset(image, fit: BoxFit.cover, height: 20.0),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Gilroy",
                  color: AppColor.secondTextColor,
                  // height: 1.6,
                ),
              )
            ],
          ),
        ));
  }
}
