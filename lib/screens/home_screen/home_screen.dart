import 'package:adstacks_dashboard/screens/home_screen/widgets/creator_card.dart';
import 'package:adstacks_dashboard/screens/home_screen/widgets/graph_card.dart';
import 'package:adstacks_dashboard/screens/home_screen/widgets/learn_more_card.dart';
import 'package:adstacks_dashboard/screens/home_screen/widgets/project_card.dart';
import 'package:adstacks_dashboard/screens/home_screen/widgets/search_bar.dart';
import 'package:adstacks_dashboard/screens/home_screen/widgets/side_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          Expanded(
            child: Scrollbar(  // Enable scrollbar for vertical scrolling
              child: SingleChildScrollView(  // Vertical scrolling
                child: Column(
                  children: [
                    Scrollbar(  // Enable scrollbar for horizontal scrolling
                      child: SingleChildScrollView(  // Horizontal scrolling
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                LearnMoreCard(),
                                SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ProjectCard(),
                                    SizedBox(width: 10),
                                    CreatorCard(),
                                  ],
                                ),
                                SizedBox(height: 20,),

                                Center(child: PerformanceGraph())
                              ],
                            ),
                            SideCard() // Uncomment if needed
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}