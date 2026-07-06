import 'package:flutter/material.dart';
import 'button_widgets.dart';
import 'input_widgets.dart';
import 'interaction_widgets.dart';
import 'layout_widgets.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'profile_page.dart';
import 'structural_widgets.dart';
import 'text_display_widgets.dart';
import 'list_%26_scroll_widgets.dart';
import 'animation_widgets.dart';
import 'async_widgets.dart';

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
        '/structural_widgets': (context) => StructuralWidgetsPage(),
        '/text_display_widgets': (context) => TextDisplayWidgetsPage(),
        '/button_widgets': (context) => ButtonWidgetsPage(),
        '/input_widgets': (context) => InputWidgetsPage(),
        '/interaction_widgets': (context) => InteractionWidgetsPage(),
        '/list_scroll_widgets': (context) => ListScrollWidgetsPage(),
        '/animation_widgets': (context) => AnimationWidgetsPage(),
        '/async_widgets': (context) => AsyncWidgetsPage(),
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
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 5,
            child: ListTile(
              leading: ImageIcon(
                AssetImage('assets/icons/layout.png'),
                color: Colors.green,
                size: 35,
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
              leading: Icon(Icons.account_tree, color: Colors.blue, size: 40),
              title: Text("Structural Widgets"),
              subtitle: Text(
                "Scaffold, AppBar, Drawer, BottomSheet, NavigationBar, TabBar, PageView, IndexedStack, PreferredSize.",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/structural_widgets');
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.text_fields, color: Colors.amber, size: 40),
              title: Text("Text & Display Widgets"),
              subtitle: Text(
                "Text, RichText, SelectableText, Icon, Image, FadeInImage, CircleAvatar, Card, ListTile, GridTile, GridTileBar",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/text_display_widgets');
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(
                Icons.radio_button_checked,
                color: Colors.brown,
                size: 40,
              ),
              title: Text("Button Widgets"),
              subtitle: Text(
                "ElevatedButton, TextButton, IconButton, FloatingActionButton, PopupMenuButton, CheckboxListTile, RadioListTile",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/button_widgets');
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(
                Icons.input,
                color: const Color.fromARGB(255, 24, 65, 65),
                size: 40,
              ),

              title: Text("Input Widgets"),
              subtitle: Text(
                "TextFormField, Form, Slider, Switch, Checkbox, Radio, DatePicker, TimePicker, DateRangePicker, AutoComplete",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/input_widgets');
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(
                Icons.integration_instructions,
                color: Colors.orange,
                size: 40,
              ),
              title: Text("Interaction Widgets"),
              subtitle: Text(
                "GestureDetector, InkWell, InteractiveViewer, Draggable, DragTarget, LongPressDraggable, Dismissible, IgnorePointer",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/interaction_widgets');
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.list, color: Colors.purple, size: 40),
              title: Text("List & Scroll Widgets"),
              subtitle: Text(
                "ListView, GridView, ReorderableListView, RefreshIndicator, DraggableScrollableSheet.",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/list_scroll_widgets');
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(
                Icons.animation,
                color: const Color.fromARGB(255, 137, 149, 12),
                size: 40,
              ),
              title: Text("Animation Widgets"),
              subtitle: Text(
                "AnimatedContainer, AnimatedOpacity, AnimatedCrossFade, AnimatedDefaultTextStyle, AnimatedRotation, AnimatedIcon, Hero, AnimatedBuilder, AnimatedList, AnimatedSwitcher.",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/animation_widgets');
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: ImageIcon(
                AssetImage('assets/icons/layout.png'),
                color: Colors.green,
                size: 40,
              ),
              title: Text("Async Widgets"),
              subtitle: Text(
                "FutureBuilder, StreamBuilder, ValueListenableBuilder, SelectableText, TextSelection, TextField, TextFormField.",
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/async_widgets');
              },
            ),
          ),
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
