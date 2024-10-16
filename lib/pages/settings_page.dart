import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.white, // White background for AppBar
        elevation: 1, // Slight elevation for shadow effect
        iconTheme: IconThemeData(color: Colors.black), // Black icons
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0), // Add padding around the ListView
        children: <Widget>[
          // Change Language ListTile
          Card(
            child: ListTile(
              title: Text('Change Language', style: TextStyle(fontSize: 18)),
              onTap: () {
                _showLanguageDialog(context);
              },
            ),
          ),
          // Privacy Policy ListTile
          Card(
            child: ListTile(
              title: Text('Privacy Policy', style: TextStyle(fontSize: 18)),
              onTap: () {
                _showPrivacyPolicy(context);
              },
            ),
          ),
          // Terms of Service ListTile
          Card(
            child: ListTile(
              title: Text('Terms of Service', style: TextStyle(fontSize: 18)),
              onTap: () {
                _showTermsOfService(context);
              },
            ),
          ),
          // About App ListTile
          Card(
            child: ListTile(
              title: Text('About App', style: TextStyle(fontSize: 18)),
              onTap: () {
                _showAboutApp(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Language selection dialog
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  title: Text('English'),
                  onTap: () {
                    // Handle language change to English
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text('Kannada'),
                  onTap: () {
                    // Handle language change to Spanish
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text('French'),
                  onTap: () {
                    // Handle language change to French
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Privacy policy dialog
  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Privacy Policy'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is the privacy policy of the app.'),
                // Add more detailed privacy policy content here
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Terms of service dialog
  void _showTermsOfService(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terms of Service'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('These are the terms of service of the app.'),
                // Add more detailed terms of service content here
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // About app dialog
  void _showAboutApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About App'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This app is designed for XYZ purposes.'),
                // Add more detailed about content here
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
