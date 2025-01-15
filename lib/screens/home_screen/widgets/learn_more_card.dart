import 'dart:ui';

import 'package:adstacks_dashboard/consts/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnMoreCard extends StatelessWidget {
  const LearnMoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  12.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Dynamically calculate the width based on screen size
          double cardWidth = constraints.maxWidth > 970 ? 970 : constraints.maxWidth - 24;
          bool isCompact = constraints.maxWidth < 800;

          return Container(
            height: 250,
            width: cardWidth, // Set width dynamically based on screen size
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFF401dcf),
                  Color(0xFFfaaeac),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "ETHERIUM 2.0",
                        style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                      // Make the "Top Rating Project" text break into two lines if necessary
                      const Text(
                        "Top Rating\nProject",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 24),
                        maxLines: 2, // Limit text to two lines
                        overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                      ),
                      Text(
                        "Trending project and high rating\nProject Created by team.",
                        style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          color: Color(0xFF261c4d),
                        ),
                        child: const Center(
                          child: Text(
                            "Learn More.",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isCompact)
                  Image.asset(
                    learnMoreBg,
                    fit: BoxFit.fill,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
