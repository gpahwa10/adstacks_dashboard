import 'package:flutter/material.dart';
import '../../../consts/images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Decide the layout based on screen width
          bool isWideScreen = constraints.maxWidth > 800;

          return Row(
            children: [
              Text(
                "Home",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.grey[600]),
              ),
              Spacer(),
              // Adjust the row containing search and icons
              if (isWideScreen)
              // If wide screen, show the search bar and all icons in a row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 33,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Color(0xff2e283d),
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search",
                              style: TextStyle(color: Color(0xFFcdc3e6)),
                            ),
                            Image.asset(
                              search,
                              height: 15,
                              width: 15,
                              fit: BoxFit.contain,
                              color: Color(0xFFcdc3e6),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Image.asset(notification, height: 25, width: 25, fit: BoxFit.contain),
                    SizedBox(width: 20),
                    Image.asset(bell, height: 25, width: 25, fit: BoxFit.contain),
                    SizedBox(width: 20),
                    Image.asset(power, height: 25, width: 25, fit: BoxFit.contain),
                  ],
                ),
              if (!isWideScreen)
              // If narrow screen (e.g., mobile), hide the search bar and show only icons
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(notification, height: 25, width: 25, fit: BoxFit.contain),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(bell, height: 25, width: 25, fit: BoxFit.contain),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(power, height: 25, width: 25, fit: BoxFit.contain),
                      onPressed: () {},
                    ),
                  ],
                ),
              SizedBox(width: 100),
              CircleAvatar(
                backgroundColor: Color(0xFF4a435c),
                child: Image.asset(
                  boy,
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
