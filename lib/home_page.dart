import 'package:agrimap/pages/calender_page.dart';
import 'package:agrimap/pages/community_page.dart';
import 'package:agrimap/pages/home_pagecontent.dart';
import 'package:agrimap/pages/map_page.dart';
import 'package:agrimap/pages/settings_page.dart';
import 'package:agrimap/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2; // Default to the Home screen (center)

  final List<Widget> _pages = [
    // Placeholder for other pages, can be replaced with actual pages

    CalendarPage(),

    HomePageContent(),
    const MapPage(),
    const ShopPage(),
    const CommunityPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 2 // Show AppBar only on HomePage
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0, // Remove shadow
              // title: Text(
              //   'HEY!!',
              //   style: TextStyle(
              //       color: Color.fromARGB(255, 8, 137, 14), fontSize: 24),
              // ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    // Handle search action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    // Handle notification action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    // Handle cart action
                  },
                ),
              ],
            )
          : null, // No AppBar for other pages
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName:
                  Text("Shivangi singh", style: TextStyle(color: Colors.white)),
              accountEmail: Text("abcde@example.com",
                  style: TextStyle(color: Colors.white)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person,
                    size: 50, color: Color.fromARGB(255, 36, 99, 39)),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person,
                  color: Color.fromARGB(255, 36, 99, 39)),
              title: const Text('Profile'),
              onTap: () {
                // Handle Profile page navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.history,
                  color: Color.fromARGB(255, 36, 99, 39)),
              title: const Text('Order History'),
              onTap: () {
                // Handle Order History page navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings,
                  color: Color.fromARGB(255, 36, 99, 39)),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
                // Handle Settings page navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout,
                  color: Color.fromARGB(255, 36, 99, 39)),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex], // Load the selected page

      // CurvedNavigationBar Implementation
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:
            Colors.transparent, // Make the background of the bar transparent
        color: const Color.fromARGB(255, 0, 0, 0), // Bar color
        buttonBackgroundColor:
            const Color.fromARGB(255, 8, 137, 14), // Button color
        height: 60, // Height of the navigation bar
        index: _selectedIndex, // Default index (middle button)
        items: const <Widget>[
          Icon(Icons.calendar_today, size: 20, color: Colors.white),
          Icon(Icons.home, size: 20, color: Colors.white),
          Icon(Icons.map, size: 20, color: Colors.white),
          Icon(Icons.shopping_bag, size: 20, color: Colors.white),
          Icon(Icons.people, size: 20, color: Colors.white),
        ],
        onTap: (index) {
          _onItemTapped(index);
        },
        animationDuration:
            const Duration(milliseconds: 300), // Smooth animation
        animationCurve: Curves.easeInOut, // Animation curve
      ),
    );
  }
}
