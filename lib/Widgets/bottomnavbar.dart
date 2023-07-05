import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/Controllers/mainscreen_provider.dart';
import 'package:shoe_app/Widgets/bottomnavwidgets.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return SafeArea(
        child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 0;
                    print(mainScreenNotifier.pageIndex = 0);
                  },
                  icon: mainScreenNotifier.pageIndex == 0
                      ? Icons.add
                      : Icons.add_circle),
              BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 1;
                    print(mainScreenNotifier.pageIndex = 1);
                  },
                  icon: mainScreenNotifier.pageIndex == 1
                      ? Icons.search
                      : Icons.search_rounded),
              BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 2;
                    print(mainScreenNotifier.pageIndex = 2);
                  },
                  icon: mainScreenNotifier.pageIndex == 2
                      ? Icons.favorite
                      : Icons.favorite_outline),
              BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 3;
                    print(mainScreenNotifier.pageIndex = 3);
                  },
                  icon: mainScreenNotifier.pageIndex == 3
                      ? Icons.shopping_bag
                      : Icons.shopping_bag_outlined),
              BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 4;
                    print(mainScreenNotifier.pageIndex = 4);
                  },
                  icon: mainScreenNotifier.pageIndex == 4
                      ? Icons.person
                      : Icons.person_outline),
            ],
          ),
        ),
      ));
    });
  }
}
