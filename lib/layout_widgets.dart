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
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
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
          ),

          buildGridItem(
            context,
            "Column",
            Icons.view_column,
            "Column arranges widgets vertically.",
          ),

          buildGridItem(
            context,
            "Stack",
            Icons.layers,
            "Stack places widgets on top of each other.",
          ),

          buildGridItem(
            context,
            "Expanded",
            Icons.open_in_full,
            "Expanded fills available space inside Row or Column.",
          ),

          buildGridItem(
            context,
            "Flexible",
            Icons.all_inclusive,
            "Flexible controls how much space a widget uses.",
          ),

          buildGridItem(
            context,
            "Wrap",
            Icons.wrap_text,
            "Wrap automatically moves widgets to the next line.",
          ),

          buildGridItem(
            context,
            "Align",
            Icons.open_with,
            "Align positions a widget within its parent.",
          ),

          buildGridItem(
            context,
            "Center",
            Icons.center_focus_strong,
            "Center places a widget in the middle.",
          ),

          buildGridItem(
            context,
            "Padding",
            Icons.padding,
            "Padding adds empty space around a widget.",
          ),

          buildGridItem(
            context,
            "SizedBox",
            Icons.space_bar,
            "SizedBox provides fixed width and height.",
          ),

          buildGridItem(
            context,
            "AspectRatio",
            Icons.aspect_ratio,
            "Maintains a fixed width and height ratio.",
          ),

          buildGridItem(
            context,
            "FractionallySizedBox",
            Icons.grid_3x3,
            "Sizes child based on available space percentage.",
          ),

          buildGridItem(
            context,
            "LayoutBuilder",
            Icons.build,
            "Builds widgets according to constraints.",
          ),

          buildGridItem(
            context,
            "OrientationBuilder",
            Icons.screen_rotation,
            "Builds UI based on screen orientation.",
          ),

          buildGridItem(
            context,
            "FittedBox",
            Icons.fit_screen,
            "Scales and positions its child.",
          ),

          buildGridItem(
            context,
            "SafeArea",
            Icons.security,
            "Avoids system UI areas like notches.",
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
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Wrap(
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

              // 🔥 Live Widget Demo
              if (demo != null) ...[
                const Text(
                  "Preview:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Center(child: demo),
              ],

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
