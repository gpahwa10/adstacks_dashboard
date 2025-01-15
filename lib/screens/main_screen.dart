import 'package:adstacks_dashboard/screens/attendance_screen/attendance_screen.dart';
import 'package:adstacks_dashboard/screens/employee_screen/employee_screen.dart';
import 'package:adstacks_dashboard/screens/home_screen/home_screen.dart';
import 'package:adstacks_dashboard/screens/info_screen/info_screen.dart';
import 'package:adstacks_dashboard/screens/summary_screen/summary_screen.dart';
import 'package:flutter/material.dart';

import '../consts/images.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0; // Tracks the selected menu item index

  // Menu items data
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Home', 'icon': home},
    {'title': 'Employees', 'icon': group},
    {'title': 'Attendance', 'icon': attendance},
    {'title': 'Summary', 'icon': calender},
    {'title': 'Information', 'icon': information},
  ];

  // Content screens
  final List<Widget> _screens = [
    HomeScreen(),
    EmployeeScreen(),
    AttendanceScreen(),
    SummaryScreen(),
    InfoScreen()
  ];

  void onMenuItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine if the layout is wide or compact based on screen width
          bool isCompact = constraints.maxWidth < 800; // Threshold for compact layout
          return Row(
            children: [
              // Sidebar Section
              Container(
                width: isCompact ? 80 : 250, // Adjust sidebar width dynamically
                color: Colors.white, // Sidebar background color
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!isCompact)
                      Image.asset(
                        logo,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    Divider(
                      color: Colors.grey[200],
                      thickness: 2,
                    ),
                    if (!isCompact)
                    // Profile Section
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              child: Image.asset(
                                dummy,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Pooja Mishra',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 75,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.deepPurpleAccent, width: 2),
                                borderRadius:
                                BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Text(
                                'Admin',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Divider(
                      color: Colors.grey[200],
                      thickness: 2,
                    ),
                    // Sidebar Menu Items
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: menuItems.length + 1, // +1 for the Workspaces item
                        itemBuilder: (context, index) {
                          if (index == menuItems.length) {
                            return ExpansionTile(
                              title: Text('Workspaces'),
                              trailing: Icon(
                                Icons.add,
                                color: Colors.black, // Adjust icon color if needed
                              ),
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero, // Remove padding inside ListTile
                                  title: Text('Adstacks'),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.black, // Adjust icon color if needed
                                  ),
                                  onTap: () {
                                    print('Navigate to Adstacks Workspace');
                                    // Implement navigation to the Adstacks workspace screen
                                  },
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.zero, // Remove padding inside ListTile
                                  title: Text('Finance'),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.black, // Adjust icon color if needed
                                  ),
                                  onTap: () {
                                    print('Navigate to Finance Workspace');
                                    // Implement navigation to the Finance workspace screen
                                  },
                                ),
                              ],
                            );
                          }

                          final item = menuItems[index];
                          final isSelected = selectedIndex == index;

                          return Container(
                            color: isSelected ? Colors.grey[200] : null,
                            child: ListTile(
                              leading: Image.asset(
                                item['icon'],
                                height: isCompact
                                    ? 30
                                    : (isSelected ? 25 : 20), // Adjust icon size
                                width: isCompact
                                    ? 30
                                    : (isSelected ? 25 : 20),
                                fit: BoxFit.contain,
                              ),
                              title: !isCompact
                                  ? Text(
                                item['title'],
                                style: TextStyle(
                                  fontSize: isSelected ? 18 : 14, // Highlighted font
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: Colors.black, // Highlighted color
                                ),
                              )
                                  : null, // Hide text in compact mode
                              onTap: () => onMenuItemTap(index),
                            ),
                          );
                        },
                      ),
                    ),

                    if (!isCompact)
                      Divider(color: Colors.grey),
                    // Settings and Logout
                    Column(
                      children: [
                        ListTile(
                          leading: Image.asset(
                            settings,
                            height: isCompact ? 30 : 20,
                            width: isCompact ? 30 : 20,
                            fit: BoxFit.contain,
                          ),
                          title: !isCompact
                              ? Text('Settings')
                              : null, // Hide text in compact mode
                          onTap: () {
                            print('Navigate to Settings');
                          },
                        ),
                        ListTile(
                          leading: Image.asset(
                            logout,
                            height: isCompact ? 30 : 20,
                            width: isCompact ? 30 : 20,
                            fit: BoxFit.contain,
                          ),
                          title: !isCompact
                              ? Text('Logout')
                              : null, // Hide text in compact mode
                          onTap: () {
                            print('Perform Logout');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Main Content Section
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: _screens,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
