import 'package:flutter/material.dart';

class HeaderNavBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Southern Tour'),
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      leading: Padding(
        padding:
            const EdgeInsets.only(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0),
        child: Transform.scale(
          scale: 1,
          child: IconButton(
            padding: const EdgeInsets.only(
                top: 5.0, left: 5.0, bottom: 5.0, right: 5.0),
            color: Colors.black12,
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.grey),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/profile');
          },
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: const SizedBox(
              width: 36.0,
              height: 36.0,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profil2.png"),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          // icon: Icon(Icons.tab),
        )
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
