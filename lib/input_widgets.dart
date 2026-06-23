import 'package:flutter/material.dart';

class InputWidgetsPage extends StatefulWidget {
  const InputWidgetsPage({super.key});

  @override
  State<InputWidgetsPage> createState() => _InputWidgetsPageState();
}

class _InputWidgetsPageState extends State<InputWidgetsPage> {
  final _formKey = GlobalKey<FormState>();

  double sliderValue = 50;
  bool switchValue = true;
  bool checkboxValue = false;
  String radioValue = "Flutter";

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTimeRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Widgets"),
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
            "TextFormField",
            Icons.text_fields,
            "TextFormField is used for text input with validation.",
            demo: SizedBox(
              width: 250,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "Form",
            Icons.description,
            "Form groups multiple input fields and validates them.",
            demo: SizedBox(
              width: 250,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),

          buildGridItem(
            context,
            "Slider",
            Icons.tune,
            "Slider selects a value from a range.",
            demo: StatefulBuilder(
              builder: (context, setModalState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(sliderValue.toStringAsFixed(0)),
                    Slider(
                      value: sliderValue,
                      min: 0,
                      max: 100,
                      onChanged: (value) {
                        setState(() => sliderValue = value);
                        setModalState(() {});
                      },
                    ),
                  ],
                );
              },
            ),
          ),

          buildGridItem(
            context,
            "Switch",
            Icons.toggle_on,
            "Switch toggles between on and off.",
            demo: StatefulBuilder(
              builder: (context, setModalState) {
                return Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() => switchValue = value);
                    setModalState(() {});
                  },
                );
              },
            ),
          ),

          buildGridItem(
            context,
            "Checkbox",
            Icons.check_box,
            "Checkbox allows multiple selections.",
            demo: StatefulBuilder(
              builder: (context, setModalState) {
                return Checkbox(
                  value: checkboxValue,
                  onChanged: (value) {
                    setState(() => checkboxValue = value!);
                    setModalState(() {});
                  },
                );
              },
            ),
          ),

          buildGridItem(
            context,
            "Radio",
            Icons.radio_button_checked,
            "Radio allows single selection.",
            demo: StatefulBuilder(
              builder: (context, setModalState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<String>(
                      title: const Text("Flutter"),
                      value: "Flutter",
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() => radioValue = value!);
                        setModalState(() {});
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text("Dart"),
                      value: "Dart",
                      groupValue: radioValue,
                      onChanged: (value) {
                        setState(() => radioValue = value!);
                        setModalState(() {});
                      },
                    ),
                  ],
                );
              },
            ),
          ),

          buildGridItem(
            context,
            "DatePicker",
            Icons.calendar_today,
            "DatePicker allows users to pick a date.",
            demo: ElevatedButton(
              onPressed: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                );
              },
              child: const Text("Pick Date"),
            ),
          ),

          buildGridItem(
            context,
            "TimePicker",
            Icons.access_time,
            "TimePicker allows users to pick a time.",
            demo: ElevatedButton(
              onPressed: () async {
                selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
              child: const Text("Pick Time"),
            ),
          ),

          buildGridItem(
            context,
            "DateRangePicker",
            Icons.date_range,
            "DateRangePicker selects a date range.",
            demo: ElevatedButton(
              onPressed: () async {
                selectedDateRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
              },
              child: const Text("Select Range"),
            ),
          ),

          buildGridItem(
            context,
            "AutoComplete",
            Icons.auto_awesome,
            "AutoComplete suggests options while typing.",
            demo: SizedBox(
              width: 250,
              child: Autocomplete<String>(
                optionsBuilder: (textEditingValue) {
                  const options = [
                    "Flutter",
                    "Dart",
                    "Firebase",
                    "Riverpod",
                    "Bloc",
                  ];

                  return options.where(
                    (option) => option.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, '/'),
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
        onTap: () => showWidgetInfo(context, title, description, demo),
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
