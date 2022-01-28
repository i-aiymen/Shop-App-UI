import 'package:flutter/material.dart';

class MyHomeBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20, color: Colors.grey[300], spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildContainer2icons(Icons.person),
            buildContainer2icons(Icons.shopping_bag),
            buildContainer2icons(Icons.home, isSelected: true),
            buildContainer2icons(Icons.favorite),
            buildContainer2icons(Icons.settings),
          ],
        ),
      ),
    );
  }

  Container buildContainer2icons(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? Colors.pink[100] : Colors.white,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : []),
      height: 50,
      width: 50,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}
