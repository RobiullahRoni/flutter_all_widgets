import 'package:flutter/material.dart';

class StructuralWidgetsPage extends StatelessWidget {
  const StructuralWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Structural Widgets"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 5,
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightGreenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width < 600
            ? 3
            : MediaQuery.of(context).size.width < 1000
            ? 4
            : 6,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          buildGridItem(
            context,
            "Scaffold",
            Icons.dashboard,
            "Scaffold provides the basic visual structure of an app.",
            demo: Container(
              width: 180,
              height: 120,
              decoration: BoxDecoration(border: Border.all()),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        "AppBar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade200,
                      child: const Center(child: Text("Body")),
                    ),
                  ),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "AppBar",
            Icons.web_asset,
            "AppBar displays a toolbar at the top.",
            demo: AppBar(
              title: const Text("Title"),
              backgroundColor: Colors.blue,
            ),
          ),

          buildGridItem(
            context,
            "Drawer",
            Icons.menu,
            "Drawer provides a side navigation menu.",
            demo: Container(
              width: 120,
              height: 150,
              color: Colors.grey.shade300,
              child: const Column(
                children: [
                  ListTile(title: Text("Home")),
                  ListTile(title: Text("Profile")),
                  ListTile(title: Text("Settings")),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "BottomSheet",
            Icons.keyboard_arrow_up,
            "BottomSheet appears from the bottom.",
            demo: Container(
              width: 180,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: const Center(
                child: Text(
                  "Bottom Sheet",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "NavigationBar",
            Icons.navigation,
            "NavigationBar is used for bottom navigation.",
            demo: NavigationBar(
              selectedIndex: 0,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          ),

          buildGridItem(
            context,
            "TabBar",
            Icons.tab,
            "TabBar displays tabs for navigation.",
            demo: DefaultTabController(
              length: 2,
              child: SizedBox(
                width: 180,
                child: Column(
                  children: const [
                    TabBar(
                      tabs: [
                        Tab(text: "Tab 1"),
                        Tab(text: "Tab 2"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "PageView",
            Icons.pages,
            "PageView lets users swipe between pages.",
            demo: SizedBox(
              width: 180,
              height: 100,
              child: PageView(
                children: [
                  Container(color: Colors.red),
                  Container(color: Colors.green),
                  Container(color: Colors.blue),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "IndexedStack",
            Icons.layers,
            "IndexedStack shows only one child at a time.",
            demo: SizedBox(
              width: 120,
              height: 80,
              child: IndexedStack(
                index: 1,
                children: [
                  Container(color: Colors.red),
                  Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        "Index 1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "PreferredSize",
            Icons.aspect_ratio,
            "PreferredSize gives a preferred size to widgets.",
            demo: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                width: 180,
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Preferred Size",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridItem(
    BuildContext context,
    String title,
    IconData icon,
    String description, {
    Widget? demo,
  }) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () => showWidgetInfo(context, title, description, demo),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.green),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  void showWidgetInfo(
    BuildContext context,
    String title,
    String description,
    Widget? demo,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Text(description),

              const SizedBox(height: 20),

              if (demo != null) Center(child: demo),

              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
