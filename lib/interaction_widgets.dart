import 'package:flutter/material.dart';

class InteractionWidgetsPage extends StatefulWidget {
  const InteractionWidgetsPage({super.key});

  @override
  State<InteractionWidgetsPage> createState() =>
      _InteractionWidgetsPageState();
}

class _InteractionWidgetsPageState extends State<InteractionWidgetsPage> {
  String dragText = "Drop Here";
  bool ignore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interaction Widgets"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 5,
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
            "GestureDetector",
            Icons.touch_app,
            "Detects taps and gestures.",
            demo: GestureDetector(
              onTap: () {},
              child: Container(
                width: 120,
                height: 80,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Tap Me",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "InkWell",
            Icons.water_drop,
            "Provides ripple effect on tap.",
            demo: Material(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120,
                  height: 80,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Tap Me",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "InteractiveViewer",
            Icons.zoom_in,
            "Zoom and pan widgets.",
            demo: SizedBox(
              width: 150,
              height: 150,
              child: InteractiveViewer(
                child: const FlutterLogo(size: 100),
              ),
            ),
          ),

          buildGridItem(
            context,
            "Draggable",
            Icons.open_with,
            "Drag widgets freely.",
            demo: Draggable(
              feedback: const FlutterLogo(size: 70),
              childWhenDragging: const Icon(
                Icons.circle_outlined,
                size: 60,
              ),
              child: const FlutterLogo(size: 70),
            ),
          ),

          buildGridItem(
            context,
            "DragTarget",
            Icons.move_down,
            "Receives dragged data.",
            demo: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Draggable<String>(
                  data: "Flutter",
                  feedback: const FlutterLogo(size: 70),
                  child: const FlutterLogo(size: 70),
                ),
                const SizedBox(height: 15),
                DragTarget<String>(
                  onAcceptWithDetails: (details) {
                    setState(() {
                      dragText = details.data;
                    });
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      width: 150,
                      height: 70,
                      color: Colors.blue.shade100,
                      child: Center(
                        child: Text(dragText),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          buildGridItem(
            context,
            "LongPressDraggable",
            Icons.pan_tool,
            "Starts dragging after long press.",
            demo: LongPressDraggable(
              feedback: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 60,
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 60,
              ),
            ),
          ),

          buildGridItem(
            context,
            "Dismissible",
            Icons.delete_sweep,
            "Swipe to dismiss widgets.",
            demo: Dismissible(
              key: const Key("item"),
              onDismissed: (direction) {},
              child: Container(
                width: 150,
                height: 60,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    "Swipe Me",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "IgnorePointer",
            Icons.block,
            "Disables touch interactions.",
            demo: IgnorePointer(
              ignoring: ignore,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Disabled"),
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

                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 20),

                if (demo != null) ...[
                  const Text(
                    "Preview:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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