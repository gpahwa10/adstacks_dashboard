import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../consts/images.dart';

class SideCard extends StatelessWidget {
  const SideCard({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Container(
      padding: EdgeInsets.all(16),
      width: 300,
      height: 900,
      color: const Color(0xFF2D2D3A),
      child: Column(
        children: [
          Text(
            'GENERAL 10:00 AM TO 7:00 PM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 280, // Reduced height from 250
              width: 280, // Reduced width from 250
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TableCalendar(
                firstDay: DateTime(now.year - 1, 1, 1),
                lastDay: DateTime(now.year + 1, 12, 31),
                focusedDay: now,
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFF8B5CF6),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xFF8B5CF6),
                    shape: BoxShape.circle,
                  ),
                  // Add these properties to make calendar more compact
                  cellMargin: EdgeInsets.zero,
                  cellPadding: EdgeInsets.zero,
                  defaultTextStyle: TextStyle(fontSize: 10),
                  weekendTextStyle: TextStyle(fontSize: 10),
                  selectedTextStyle:
                      TextStyle(fontSize: 10, color: Colors.white),
                  todayTextStyle: TextStyle(fontSize: 10, color: Colors.white),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(fontSize: 12),
                  // Reduced title size
                  leftChevronIcon: Icon(Icons.chevron_left, size: 16),
                  // Smaller icons
                  rightChevronIcon: Icon(Icons.chevron_right, size: 16),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(fontSize: 8),
                  weekendStyle: TextStyle(fontSize: 8),
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
                rowHeight:
                    25, // Reduced row height to make calendar more compact
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildSection(
            title: 'Today Birthday',
            count: 2,
            buttonText: 'Birthday Wishing',
            avatars: 2,
          ),
          const SizedBox(height: 20),
          _buildSection(
            title: 'Anniversary',
            count: 3,
            buttonText: 'Anniversary Wishing',
            avatars: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required int count,
    required String buttonText,
    required int avatars,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: Color(0xFF3c354a),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Row(
          children: [
            Image.asset(star,height: 20,width: 20,fit: BoxFit.contain,),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Image.asset(star,height: 20,width: 20,fit: BoxFit.contain,),


          ],
        ),
        Row(
          children: List.generate(avatars, (index) {
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child:Container(
               decoration: BoxDecoration(
                 shape: BoxShape.circle, // Ensures the border is circular
                 border: Border.all(
                   color: Color(0xFF5c438f), // Border color
                   width: 1.0,         // Border width
                 ),
               ),
               child: CircleAvatar(
                 radius: 25,
                 backgroundColor: Colors.transparent, // Optional: Background color for CircleAvatar
                 child: Image.asset(
                   boy,
                   fit: BoxFit.contain,
                   height: 25,
                   width: 25,
                 ),
               ),
             )

           );
          })
        ),
        Row(
          children: [
            Text(
              'Total',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12, // Reduced size
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 1,               // Divider width
              height: 30,             // Divider height
              color: Colors.grey,     // Divider color
              margin: EdgeInsets.symmetric(horizontal: 10), // Space around the divider
            ),
            Text(
              count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14, // Reduced size
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 1,               // Divider width
              height: 30,             // Divider height
              color: Colors.grey,     // Divider color
              margin: EdgeInsets.symmetric(horizontal: 10), // Space around the divider
            ),
            // VerticalDivider(color: Color(0xFF84808c),width: 5,)
          ],
        ),
        Center(
          child: Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFb879f2),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(send,height: 20,width: 20,fit: BoxFit.contain,color: Colors.white,),
                SizedBox(width: 10,),
                Text(buttonText,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white),)
              ],
            ),
          ),
        )
      ]),
    );
  }
}