import 'package:flutter/material.dart';

import '../constraints/colors.dart';

class TourPackage extends StatelessWidget {
  final String title;
  final String address;
  final String desc;
  final int price;
  final String image;

  const TourPackage({
    Key? key,
    required this.title,
    required this.address,
    required this.desc,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(children: [
          Container(
            width: 95.0,
            height: 85.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              // color: Colors.black,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Expanded(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Gilroy',
                  color: AppColor.textColor,
                  // height: 1.6,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColor.primaryColor,
                    size: 10.0,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy',
                      color: AppColor.primaryColor,
                      // height: 1.6,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 9.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Gilroy',
                  color: AppColor.secondTextColor,
                  // height: 1.6,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Row(
                children: [
                  Text(
                    "\$ $price",
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Gilroy',
                      color: AppColor.textColor,
                      // height: 1.6,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  const Text(
                    "Person",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Gilroy',
                      color: AppColor.secondTextColor,
                      // height: 1.6,
                    ),
                  )
                ],
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
