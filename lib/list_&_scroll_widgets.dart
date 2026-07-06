import 'package:flutter/material.dart';

class ListScrollWidgetsPage extends StatelessWidget {
  const ListScrollWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List & Scroll Widgets"),
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
        crossAxisCount: MediaQuery.of(context).size.width < 700
            ? 3
            : MediaQuery.of(context).size.width < 1000
            ? 4
            : 6,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          // ListView
          buildGridItem(
            context,
            "ListView",
            Icons.list,
            "ListView displays a scrollable list of widgets.",
            demo: SizedBox(
              height: 180,
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.person), title: Text("Alice")),
                  ListTile(leading: Icon(Icons.person), title: Text("Bob")),
                  ListTile(leading: Icon(Icons.person), title: Text("Charlie")),
                ],
              ),
            ),
          ),

          // GridView
          buildGridItem(
            context,
            "GridView",
            Icons.grid_view,
            "GridView displays items in a scrollable grid.",
            demo: SizedBox(
              height: 180,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(
                  4,
                  (index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Item ${index + 1}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ReorderableListView
          buildGridItem(
            context,
            "ReorderableListView",
            Icons.reorder,
            "Allows users to reorder list items by dragging.",
            demo: Container(
              width: 250,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.drag_handle),
                    title: Text("Item 1"),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.drag_handle),
                    title: Text("Item 2"),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.drag_handle),
                    title: Text("Item 3"),
                  ),
                ],
              ),
            ),
          ),

          // RefreshIndicator
          buildGridItem(
            context,
            "RefreshIndicator",
            Icons.refresh,
            "Pull down to refresh a scrollable list.",
            demo: SizedBox(
              height: 180,
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                },
                child: ListView(
                  children: const [
                    ListTile(title: Text("Pull down to refresh")),
                    ListTile(title: Text("Item 1")),
                    ListTile(title: Text("Item 2")),
                    ListTile(title: Text("Item 3")),
                  ],
                ),
              ),
            ),
          ),

          // DraggableScrollableSheet
          buildGridItem(
            context,
            "DraggableScrollableSheet",
            Icons.swipe,
            "A draggable bottom sheet that can expand and collapse.",
            demo: Container(
              width: 250,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.drag_handle, size: 35),
                  SizedBox(height: 10),
                  Text(
                    "Drag Up / Down",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Icon(Icons.widgets),
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
        onTap: () {
          showWidgetInfo(context, title, description, demo);
        },
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
        return SingleChildScrollView(
          child: Padding(
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

                Text(description, style: const TextStyle(fontSize: 16)),

                const SizedBox(height: 20),

                if (demo != null) ...[
                  const Text(
                    "Preview:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  Center(child: demo),
                ],

                const SizedBox(height: 25),

                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
