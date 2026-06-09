import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "What are Widgets?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text(
                  "In Flutter, everything is a widget. Widgets are the building blocks of UI "
                  "that define how your app looks and behaves.",
                ),

                SizedBox(height: 20),

                Text(
                  "Types of Widgets",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text("• StatelessWidget → UI that does not change."),
                Text("• StatefulWidget → UI that can change dynamically."),

                SizedBox(height: 20),

                Text(
                  "Basic Widgets",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text(
                  "• Container → Box with styling (padding, color, border).",
                ),
                Text("• Text → Displays text on screen."),
                Text("• Icon → Shows icons."),
                Text("• Image → Displays images."),

                SizedBox(height: 20),

                Text(
                  "Layout Widgets",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text("• Row → Horizontal layout."),
                Text("• Column → Vertical layout."),
                Text("• Stack → Overlapping widgets."),
                Text("• Center → Centers child widget."),
                Text("• Align → Positions child inside parent."),

                SizedBox(height: 20),

                Text(
                  "Advanced Layout Widgets",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text("• Padding → Space around widget."),
                Text("• SizedBox → Fixed size or spacing."),
                Text("• Expanded → Takes available space."),
                Text("• Flexible → Flexible space control."),
                Text("• AspectRatio → Maintains width/height ratio."),
                Text("• LayoutBuilder → Responsive layout based on size."),
                Text("• OrientationBuilder → Changes UI on rotation."),
                Text("• FittedBox → Scales child to fit space."),
                Text("• SafeArea → Avoid system UI overlap."),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: Icon(Icons.widgets),
      ),
    );
  }
}
