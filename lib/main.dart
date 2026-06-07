import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Object? get primarySwatch => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widgetsPage(),
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
        '/layout_widgets': (context) => LayoutWidgetsPage(),
        '/about': (context) => AboutPage(),
        '/profile': (context) => ProfilePage(),
      },
      title: "My Flutter App - AppBar",
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
      darkTheme: ThemeData.dark(),
      navigatorKey: GlobalKey<NavigatorState>(),
      supportedLocales: [Locale('en', 'US'), Locale('es', 'ES')],
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return child!;
      },
    );
  }
}

// ignore: camel_case_types
class widgetsPage extends StatelessWidget {
  const widgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 5,
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.lightGreenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        titleSpacing: 20,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('Search Clicked');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              print('Notification Clicked');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              print('Settings Clicked');
            },
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 5,
            child: ListTile(
              leading: ImageIcon(
                AssetImage('assets/icons/layout.png'),
                color: Colors.green,
                size: 40,
              ),
              title: Text("Layout Widgets"),
              subtitle: Text(
                "Container, Row, Column, Stack, Expanded, Flexible, Wrap, Align, Center, Padding, SizedBox, AspectRatio, FractionallySizedBox, LayoutBuilder, OrientationBuilder, FittedBox, SafeArea.",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/layout_widgets');
              },
            ),
          ),

          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.blue, size: 40),
              title: Text("About"),
              subtitle: Text("About this application"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pushNamed(context, '/home'); // drawer close
                print("Home Clicked");
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile'); // page open
              },
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),

      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Right Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                print("Settings Clicked");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: Icon(Icons.home),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green, // Selected icon + text color
        unselectedItemColor: Colors.green, // Unselected icon + text color

        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/about');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Widgets"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
