import 'package:flutter/material.dart';

import '../../../consts/images.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key});

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.3; // 90% of screen width
    final cardHeight = 300.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 420,
      height: cardHeight,
      decoration: const BoxDecoration(
        color: Color(0xFF111c45),
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "All Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  3,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: projectDetailCard(index, cardWidth),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget projectDetailCard(int index, double parentWidth) {
    final isHovered = index == hoveredIndex;
    final cardWidth = parentWidth * 0.9; // Slightly smaller than parent width

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          hoveredIndex = -1;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: cardWidth,
        height: isHovered ? 70 : 60,
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFFC23650) : const Color(0xFF1B244A),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  dummy, // Replace with your dummy image asset
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Technology behind the blockchain",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Project #1",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF9ba6c9),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See Details",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  edit,
                  color: Colors.white,
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
