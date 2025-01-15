import 'package:flutter/material.dart';

import '../../../consts/images.dart';

class CreatorCard extends StatelessWidget {
  const CreatorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final creators = [
      {
        'name': '@maddison_c21',
        'artworks': '9821',
        'avatar': dummy,
        'rating': 80,
      },
      {
        'name': '@karl.will02',
        'artworks': '7032',
        'avatar': dummy,
        'rating': 75,
      },
      {
        'name': '@maddison_c21',
        'artworks': '9821',
        'avatar': dummy,
        'rating': 70,
      },
      {
        'name': '@maddison_c21',
        'artworks': '9821',
        'avatar': dummy,
        'rating': 65,
      },
    ];

    return Container(
      width: 420,
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xFF111c45),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF1b244a),
              borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:  Radius.circular(15))
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Top Creators',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Artworks',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Rating',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ...creators.map((creator) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage:
                                AssetImage(creator['avatar'].toString()),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              creator['name'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        creator['artworks'].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 8,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: (creator['rating'] as num) / 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF7452ff),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
