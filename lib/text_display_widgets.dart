import 'package:flutter/material.dart';

class TextDisplayWidgetsPage extends StatelessWidget {
  const TextDisplayWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text & Display Widgets"),
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
            "Text",
            Icons.text_fields,
            "Text displays a string of text.",
            demo: const Text("Hello Flutter!", style: TextStyle(fontSize: 20)),
          ),

          buildGridItem(
            context,
            "RichText",
            Icons.format_color_text,
            "RichText allows multiple text styles.",
            demo: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Flutter ",
                    style: TextStyle(color: Colors.blue, fontSize: 22),
                  ),
                  TextSpan(
                    text: "Widgets",
                    style: TextStyle(color: Colors.green, fontSize: 22),
                  ),
                ],
              ),
            ),
          ),

          buildGridItem(
            context,
            "SelectableText",
            Icons.select_all,
            "SelectableText allows selecting text.",
            demo: const SelectableText(
              "You can select this text.",
              style: TextStyle(fontSize: 18),
            ),
          ),

          buildGridItem(
            context,
            "Icon",
            Icons.star,
            "Icon displays graphical icons.",
            demo: const Icon(Icons.favorite, color: Colors.red, size: 70),
          ),

          buildGridItem(
            context,
            "Image",
            Icons.image,
            "Image displays images.",
            demo: Image.network(
              "https://picsum.photos/150",
              width: 150,
              height: 150,
            ),
          ),

          buildGridItem(
            context,
            "FadeInImage",
            Icons.image_outlined,
            "FadeInImage smoothly loads images.",
            demo: FadeInImage.assetNetwork(
              placeholder: "assets/loading.png",
              image: "https://picsum.photos/200",
              width: 150,
              height: 150,
              imageErrorBuilder: (_, __, ___) {
                return const Icon(Icons.error, size: 80);
              },
            ),
          ),

          buildGridItem(
            context,
            "CircleAvatar",
            Icons.account_circle,
            "CircleAvatar displays circular images.",
            demo: const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
          ),

          buildGridItem(
            context,
            "Card",
            Icons.credit_card,
            "Card provides a material design card.",
            demo: Card(
              elevation: 5,
              child: SizedBox(
                width: 180,
                height: 100,
                child: Center(
                  child: Text("Flutter Card", style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "ListTile",
            Icons.list,
            "ListTile creates rows in lists.",
            demo: const SizedBox(
              width: 250,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("John Doe"),
                subtitle: Text("Flutter Developer"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),

          buildGridItem(
            context,
            "GridTile",
            Icons.grid_view,
            "GridTile is used inside GridView.",
            demo: SizedBox(
              width: 150,
              height: 150,
              child: GridTile(
                footer: Container(
                  color: Colors.black54,
                  child: const Text(
                    "Image",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                child: Image.network(
                  "https://picsum.photos/200",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "GridTileBar",
            Icons.view_module,
            "GridTileBar adds header/footer to GridTile.",
            demo: SizedBox(
              width: 180,
              height: 150,
              child: GridTile(
                footer: const GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text("Flutter"),
                  subtitle: Text("GridTileBar"),
                ),
                child: Image.network(
                  "https://picsum.photos/201",
                  fit: BoxFit.cover,
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
