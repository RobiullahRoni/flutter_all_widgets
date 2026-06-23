import 'package:flutter/material.dart';

class ButtonWidgetsPage extends StatefulWidget {
  const ButtonWidgetsPage({super.key});

  @override
  State<ButtonWidgetsPage> createState() => _ButtonWidgetsPageState();
}

class _ButtonWidgetsPageState extends State<ButtonWidgetsPage> {
  bool isChecked = false;
  String selectedOption = "Flutter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Widgets"),
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
            "ElevatedButton",
            Icons.smart_button,
            "ElevatedButton is a Material Design raised button.",
            demo: ElevatedButton(
              onPressed: () {},
              child: const Text("Click Me"),
            ),
          ),

          buildGridItem(
            context,
            "TextButton",
            Icons.text_fields,
            "TextButton is a flat button without elevation.",
            demo: TextButton(
              onPressed: () {},
              child: const Text("Text Button"),
            ),
          ),

          buildGridItem(
            context,
            "IconButton",
            Icons.touch_app,
            "IconButton is a button with an icon.",
            demo: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite, color: Colors.red, size: 40),
            ),
          ),

          buildGridItem(
            context,
            "FloatingActionButton",
            Icons.add_circle,
            "FloatingActionButton performs primary actions.",
            demo: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),

          buildGridItem(
            context,
            "PopupMenuButton",
            Icons.more_vert,
            "PopupMenuButton displays a menu when pressed.",
            demo: PopupMenuButton<String>(
              itemBuilder: (context) => const [
                PopupMenuItem(value: "One", child: Text("Option 1")),
                PopupMenuItem(value: "Two", child: Text("Option 2")),
              ],
            ),
          ),

          buildGridItem(
            context,
            "CheckboxListTile",
            Icons.check_box,
            "CheckboxListTile combines Checkbox with ListTile.",
            demo: StatefulBuilder(
              builder: (context, setModalState) {
                return SizedBox(
                  width: 250,
                  child: CheckboxListTile(
                    title: const Text("Accept Terms"),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                      setModalState(() {});
                    },
                  ),
                );
              },
            ),
          ),

          buildGridItem(
            context,
            "RadioListTile",
            Icons.radio_button_checked,
            "RadioListTile combines Radio with ListTile.",
            demo: StatefulBuilder(
              builder: (context, setModalState) {
                return SizedBox(
                  width: 250,
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        title: const Text("Flutter"),
                        value: "Flutter",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                          setModalState(() {});
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text("Dart"),
                        value: "Dart",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                          setModalState(() {});
                        },
                      ),
                    ],
                  ),
                );
              },
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
            Text(title, textAlign: TextAlign.center),
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
