import 'package:flutter/material.dart';

class AnimationWidgetsPage extends StatelessWidget {
  const AnimationWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Widgets"),
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
          buildGridItem(
            context,
            "AnimatedContainer",
            Icons.crop_square,
            "AnimatedContainer smoothly animates changes in size, color, and decoration.",
            demo: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          buildGridItem(
            context,
            "AnimatedOpacity",
            Icons.opacity,
            "AnimatedOpacity animates a widget's transparency.",
            demo: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: 0.5,
              child: Container(width: 100, height: 100, color: Colors.green),
            ),
          ),

          buildGridItem(
            context,
            "AnimatedCrossFade",
            Icons.compare_arrows,
            "AnimatedCrossFade smoothly fades between two widgets.",
            demo: AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              crossFadeState: CrossFadeState.showFirst,
              firstChild: Container(width: 100, height: 100, color: Colors.red),
              secondChild: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),

          buildGridItem(
            context,
            "AnimatedDefaultTextStyle",
            Icons.text_fields,
            "AnimatedDefaultTextStyle animates text style changes.",
            demo: AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 1),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              child: const Text("Flutter"),
            ),
          ),

          buildGridItem(
            context,
            "AnimatedRotation",
            Icons.rotate_right,
            "AnimatedRotation animates widget rotation.",
            demo: AnimatedRotation(
              turns: 0.25,
              duration: const Duration(seconds: 1),
              child: const Icon(Icons.refresh, size: 70, color: Colors.orange),
            ),
          ),

          buildGridItem(
            context,
            "AnimatedIcon",
            Icons.animation,
            "AnimatedIcon animates between two icons.",
            demo: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow,
              progress: const AlwaysStoppedAnimation(1.0),
              size: 70,
              color: Colors.deepPurple,
            ),
          ),

          buildGridItem(
            context,
            "Hero",
            Icons.flight,
            "Hero creates a shared animation between two screens.",
            demo: Hero(
              tag: "hero_demo",
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.flight, color: Colors.white),
              ),
            ),
          ),

          buildGridItem(
            context,
            "AnimatedBuilder",
            Icons.build_circle,
            "AnimatedBuilder rebuilds widgets during animation.",
            demo: const Icon(Icons.settings, size: 70, color: Colors.teal),
          ),

          buildGridItem(
            context,
            "AnimatedList",
            Icons.list_alt,
            "AnimatedList animates items when added or removed.",
            demo: SizedBox(
              width: 220,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  ListTile(leading: Icon(Icons.star), title: Text("Item 1")),
                  ListTile(leading: Icon(Icons.star), title: Text("Item 2")),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "AnimatedSwitcher",
            Icons.swap_horiz,
            "AnimatedSwitcher animates when replacing one widget with another.",
            demo: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: Container(
                key: const ValueKey(1),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12),
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
