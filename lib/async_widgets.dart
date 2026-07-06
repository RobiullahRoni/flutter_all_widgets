import 'package:flutter/material.dart';

class AsyncWidgetsPage extends StatelessWidget {
  const AsyncWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Async Widgets"),
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
            "FutureBuilder",
            Icons.hourglass_bottom,
            "FutureBuilder builds UI based on the result of a Future.",
            demo: FutureBuilder<String>(
              future: Future.delayed(
                const Duration(seconds: 1),
                () => "Future Completed!",
              ),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return Text(
                  snapshot.data!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                );
              },
            ),
          ),

          buildGridItem(
            context,
            "StreamBuilder",
            Icons.stream,
            "StreamBuilder updates the UI whenever new stream data arrives.",
            demo: StreamBuilder<int>(
              stream: Stream.periodic(
                const Duration(seconds: 1),
                (count) => count,
              ).take(5),
              builder: (context, snapshot) {
                return Text(
                  "Count: ${snapshot.data ?? 0}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),

          buildGridItem(
            context,
            "ValueListenableBuilder",
            Icons.update,
            "ValueListenableBuilder rebuilds when a ValueNotifier changes.",
            demo: ValueListenableBuilder<int>(
              valueListenable: ValueNotifier<int>(5),
              builder: (context, value, child) {
                return Text(
                  "Value: $value",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),

          buildGridItem(
            context,
            "SelectableText",
            Icons.text_fields,
            "SelectableText allows users to select and copy text.",
            demo: const SelectableText(
              "Flutter Widgets",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          buildGridItem(
            context,
            "TextSelection",
            Icons.select_all,
            "TextSelection lets users highlight and select text.",
            demo: const SelectableText(
              "Select this text",
              style: TextStyle(fontSize: 18),
            ),
          ),

          buildGridItem(
            context,
            "TextField",
            Icons.edit,
            "TextField allows users to enter text.",
            demo: const SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your name",
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "TextFormField",
            Icons.assignment,
            "TextFormField is used in forms with validation support.",
            demo: SizedBox(
              width: 250,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your email",
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
