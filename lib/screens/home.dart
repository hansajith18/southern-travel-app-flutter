import 'package:flutter/material.dart';
import '/widgets/app_bar.dart';
import '/widgets/tour_package.dart';

import '../constraints/colors.dart';
import '../widgets/category_item.dart';
import '../widgets/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late int selectedIndex = 0;
    return Scaffold(
      appBar: const HeaderNavBar(),
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor:
              selectedIndex == 0 ? Colors.amber[800] : Colors.blueGrey,
          tooltip: 'Increment Counter',
          child: const Icon(Icons.home),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 50,
        height: 60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 0,
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.mark_unread_chat_alt_outlined),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
            const Expanded(child: SizedBox()),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.local_offer_outlined),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        Category(
                          image: "assets/icons/MOUNTAIN.svg",
                          title: "Mountain",
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Category(
                          image: "assets/icons/WATERFALL.svg",
                          title: "Waterfall",
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Category(
                          image: "assets/icons/RIVER.svg",
                          title: "River",
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Category(
                          image: "assets/icons/FOREST.svg",
                          title: "Forest",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        CategoryItem(
                          image: 'assets/images/Rinjani.png',
                          price: '36',
                          attraction: "Rinjani Mountain",
                          location: "Lombok, Indonesia",
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        CategoryItem(
                          image: 'assets/images/Bromo.png',
                          price: '20',
                          attraction: "Bromo Mountain",
                          location: "East Java, Indonesia",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 36.0,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Popular Destination",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Gilroy',
                          color: AppColor.textColor,
                          // height: 1.3,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryColor,
                          fontFamily: 'Gilroy',
                          // color: AppColor.secondTextColor,
                          // height: 1.6,
                        ),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColor.primaryColor,
                        size: 12.0,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22.0,
                  ),
                  const TourPackage(
                    address: "Komodo Island, Indonesia",
                    desc:
                        "This exceptional beach gets its striking color from microscopic animals called...",
                    price: 53,
                    title: "The Pink Beach",
                    image: "assets/images/Pink.png",
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  const TourPackage(
                    address: "Bali, Indonesia",
                    desc:
                        "A Meru tower or pelinggih meru is the principal shrine of a Balinese temple. It is a wooden..",
                    price: 48,
                    title: "Meru Tower",
                    image: "assets/images/Meru.png",
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  const TourPackage(
                    address: "South Sulawesi, Indonesia",
                    desc:
                        "Toraja land is one the tourist destination area in indonesia that must be visited because it..",
                    price: 32,
                    title: "Toraja Land",
                    image: "assets/images/Toraja.png",
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  const TourPackage(
                    address: "Komodo Island, Indonesia",
                    desc:
                        "This exceptional beach gets its striking color from microscopic animals called...",
                    price: 53,
                    title: "The Pink Beach",
                    image: "assets/images/Pink.png",
                  ),
                  const SizedBox(
                    height: 22.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
