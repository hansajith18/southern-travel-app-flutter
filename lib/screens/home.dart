import 'package:elegant_notification/elegant_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '/widgets/app_bar.dart';
import '/widgets/tour_package.dart';

import '../constraints/colors.dart';
import '../widgets/category_item.dart';
import '../widgets/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _scanBarcode = "";
  User? _user;
  String uid = "";

  @override
  void initState() {
    // Detect when a user signs in (or out, when sign out is implemented)
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          _user = FirebaseAuth.instance.currentUser!;
          uid = _user!.uid;
        });
      } else {
        if (mounted) {
          setState(() {
            _user = null;
            uid = "";
          });
        }
      }
    });
    super.initState();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#42f5ef", "Cancel", true, ScanMode.QR);
    if (kDebugMode) {
      print(barcodeScanRes);
    }

    EasyLoading.show(status: 'loading...');

    DatabaseReference touristVisits = FirebaseDatabase.instance.ref("tourist_visits");
    DatabaseReference newVisitRef = touristVisits.push();
    await newVisitRef.set({
      "uid": _user?.uid,
      "name": _user?.displayName,
      "email": _user?.email,
      "barcodeScanRes": barcodeScanRes,
    });
    EasyLoading.dismiss();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ElegantNotification.success(
        width: MediaQuery.of(context).size.width - 20,
        title: const Text("Saving"),
        description: const Text("Your visited place successfully saved"),
      ).show(context);
    });

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    late int selectedIndex = 0;
    return Scaffold(
      appBar: const HeaderNavBar(),
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: scanBarcodeNormal,
          backgroundColor: selectedIndex == 0 ? Colors.amber[800] : Colors.blueGrey,
          tooltip: 'Scan QR code',
          child: const Icon(Icons.qr_code_scanner),
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
                icon: const Icon(Icons.exit_to_app),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamed('/login');
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: _user != null
          ? const SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              AttractionItem(
                                image: "assets/icons/MOUNTAIN.svg",
                                title: "Mountain",
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              AttractionItem(
                                image: "assets/icons/WATERFALL.svg",
                                title: "Waterfall",
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              AttractionItem(
                                image: "assets/icons/RIVER.svg",
                                title: "River",
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              AttractionItem(
                                image: "assets/icons/FOREST.svg",
                                title: "Forest",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 22.0,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
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
                        SizedBox(
                          height: 36.0,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                        SizedBox(
                          height: 22.0,
                        ),
                        TourPackage(
                          address: "Komodo Island, Indonesia",
                          desc: "This exceptional beach gets its striking color from microscopic animals called...",
                          price: 53,
                          title: "The Pink Beach",
                          image: "assets/images/Pink.png",
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        TourPackage(
                          address: "Bali, Indonesia",
                          desc: "A Meru tower or pelinggih meru is the principal shrine of a Balinese temple. It is a wooden..",
                          price: 48,
                          title: "Meru Tower",
                          image: "assets/images/Meru.png",
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        TourPackage(
                          address: "South Sulawesi, Indonesia",
                          desc: "Toraja land is one the tourist destination area in indonesia that must be visited because it..",
                          price: 32,
                          title: "Toraja Land",
                          image: "assets/images/Toraja.png",
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        TourPackage(
                          address: "Komodo Island, Indonesia",
                          desc: "This exceptional beach gets its striking color from microscopic animals called...",
                          price: 53,
                          title: "The Pink Beach",
                          image: "assets/images/Pink.png",
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        TourPackage(
                          address: "Bali, Indonesia",
                          desc: "A Meru tower or pelinggih meru is the principal shrine of a Balinese temple. It is a wooden..",
                          price: 48,
                          title: "Meru Tower",
                          image: "assets/images/Meru.png",
                        ),
                        SizedBox(
                          height: 22.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: Text('No user detected'),
            ),
    );
  }
}
