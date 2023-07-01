import 'package:flutter/material.dart';

import '../constraints/colors.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String price;
  final String attraction;
  final String location;

  const CategoryItem({
    Key? key,
    required this.image,
    required this.price,
    required this.attraction,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 222.0,
          height: 143.0,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(13.0),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(13.0),
            child: InkWell(
              onTap: () {},
              splashColor: const Color.fromARGB(255, 245, 242, 242),
            ),
          ),
        ),
        Container(
          // height: 52.h,
          width: 222.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(13.0),
              bottomRight: Radius.circular(13.0),
            ),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 14.0, left: 14.0, top: 6.0, bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment:
                  //     MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attraction,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Gilroy',
                        color: AppColor.thirdTextColor,
                        // height: 1.6,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColor.thirdTextColor,
                          size: 10.0,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Gilroy',
                            color: AppColor.thirdTextColor,
                            // height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Gilroy',
                        color: AppColor.thirdTextColor,
                        // height: 1.6,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          "/person",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Gilroy',
                            color: AppColor.thirdTextColor,
                            // height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
