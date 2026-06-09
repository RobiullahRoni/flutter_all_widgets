import 'package:flutter/material.dart';

class LayoutWidgetsPage extends StatelessWidget {
  const LayoutWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout Widgets"),
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
        crossAxisCount: 3,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          buildGridItem(
            context,
            "Container",
            Icons.crop_square,
            "Container is used to create a box and apply height, width, color, padding, margin, etc.",
            demo: Container(
              width: 120,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Container", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),

          buildGridItem(
            context,
            "Row",
            Icons.view_stream,
            "Row arranges widgets horizontally.",
            demo: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const SizedBox(width: 10),
                  Container(width: 50, height: 50, color: Colors.green),
                  const SizedBox(width: 10),
                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "Column",
            Icons.view_column,
            "Column arranges widgets vertically.",
            demo: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const SizedBox(height: 10),
                  Container(width: 50, height: 50, color: Colors.green),
                  const SizedBox(height: 10),
                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "Stack",
            Icons.layers,
            "Stack places widgets on top of each other.",
            demo: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 120, height: 120, color: Colors.red),
                  Container(width: 90, height: 90, color: Colors.green),
                  Container(width: 60, height: 60, color: Colors.blue),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "Expanded",
            Icons.open_in_full,
            "Expanded fills available space inside Row or Column.",
            demo: SizedBox(
              width: 250,
              height: 80,
              child: Row(
                children: [
                  Container(width: 50, color: Colors.red),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          "Expanded",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(width: 50, color: Colors.blue),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "Flexible",
            Icons.all_inclusive,
            "Flexible controls how much space a widget uses.",
            demo: SizedBox(
              width: 250,
              height: 80,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text("1", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                      child: const Center(
                        child: Text("2", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.blue,
                      child: const Center(
                        child: Text("3", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "Wrap",
            Icons.wrap_text,
            "Wrap automatically moves widgets to the next line.",
            demo: SizedBox(
              width: 250,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text("Flutter")),
                  Chip(label: Text("Dart")),
                  Chip(label: Text("UI")),
                  Chip(label: Text("Widgets")),
                  Chip(label: Text("Wrap")),
                  Chip(label: Text("Demo")),
                  Chip(label: Text("API")),
                  Chip(label: Text("Color")),
                  Chip(label: Text("Center")),
                  Chip(label: Text("Wrap")),
                  Chip(label: Text("Wrap automatically moves.")),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "Align",
            Icons.open_with,
            "Align positions a widget within its parent.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
            ),
          ),

          buildGridItem(
            context,
            "Center",
            Icons.center_focus_strong,
            "Center places a widget in the middle.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: Center(
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
            ),
          ),

          buildGridItem(
            context,
            "Padding",
            Icons.padding,
            "Padding adds empty space around a widget.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
            ),
          ),

          buildGridItem(
            context,
            "SizedBox",
            Icons.space_bar,
            "SizedBox provides fixed width and height.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Container(color: Colors.blue),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "AspectRatio",
            Icons.aspect_ratio,
            "Maintains a fixed width and height ratio.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(color: Colors.blue),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "FractionallySizedBox",
            Icons.grid_3x3,
            "Sizes child based on available space percentage.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  heightFactor: 0.6,
                  child: Container(color: Colors.blue),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "LayoutBuilder",
            Icons.build,
            "Builds widgets according to constraints.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: Container(
                      width: constraints.maxWidth * 0.5,
                      height: constraints.maxHeight * 0.5,
                      color: Colors.blue,
                    ),
                  );
                },
              ),
            ),
          ),

          buildGridItem(
            context,
            "OrientationBuilder",
            Icons.screen_rotation,
            "Builds UI based on screen orientation.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: OrientationBuilder(
                builder: (context, orientation) {
                  return Center(
                    child: Container(
                      width: orientation == Orientation.portrait ? 60 : 100,
                      height: orientation == Orientation.portrait ? 60 : 40,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          orientation == Orientation.portrait
                              ? "Portrait"
                              : "Landscape",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          buildGridItem(
            context,
            "FittedBox",
            Icons.fit_screen,
            "Scales and positions its child.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: Center(
                child: Container(
                  width: 80,
                  height: 40,
                  color: Colors.blue,
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "FLUTTER",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "SafeArea",
            Icons.security,
            "Avoids system UI areas like notches.",
            demo: Container(
              width: 200,
              height: 120,
              color: Colors.grey.shade300,
              child: SafeArea(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      "Safe Area",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
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
