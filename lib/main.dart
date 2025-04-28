import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isDarkMode = false; // Variable to track dark mode

  //Toggles dark mode on and off
  // This function is called when the user taps the button.
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode; // Toggle the dark mode variable
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(), // Use dark theme when isDarkMode is true
      themeMode:
          isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light, // Set the theme mode based on isDarkMode
      home: HomeScreen(
        toggleTheme: toggleDarkMode,
      ), // Pass the toggleTheme function to the home screen
    );
  }
}

/* 
Creates the Home Screen widget, which is the main screen of the app. 

Define a StatelessWidget class `HomeScreen`.
Accept a callback function `toggleTheme` as a parameter.
Create a Scaffold widget:
  - Add an AppBar with a title "Welcome".
  - Add an IconButton in the AppBar to call `toggleTheme` when pressed.
  - In the body, use a Column:
    - Display a Text widget with a welcome message.
    - Add a Button that navigates to `ProfileScreen` when clicked.

*/

class HomeScreen extends StatelessWidget {
  final Function toggleTheme; // Function to toggle the theme

  const HomeScreen({super.key, required this.toggleTheme}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Flutter App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              toggleTheme();
              /*
              if (toggleTheme != null) {
                // Check if toggleTheme is not null
                toggleTheme(); // Call the toggleTheme function when the button is pressed
              }
              */
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome to my Flutter App!"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: const Text("Go to Profile"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key}); // Constructor
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://example.com/profile.jpg', // Replace with your image URL
              ),
            ),
            const SizedBox(height: 20),
            Text('Sir Man'), // User name
            Text('Software Engineer'), // Desigination
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
