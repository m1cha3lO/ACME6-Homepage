import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coug Eats',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Coug Eats'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime selectedDate = DateTime.now();
  List<Map<String, dynamic>> posts = [
    {
      'title': 'Meeting with Team A',
      'group': 'Work Group A',
      'date': 'Wednesday, November 6',
      'time': '10:00 AM - 11:30 AM',
      'location': 'Conference Room 1',
      'image': 'https://canadacollege.edu/studentlife/images/food-at-events.jpg',
      'tags': ['Halal', 'Vegetarian', 'Contains Nuts']
    },
    {
      'title': 'Meeting with Team B',
      'group': 'Project B Team',
      'date': 'Thursday, November 7',
      'time': '12:30 PM - 2:00 PM',
      'location': 'Cafeteria',
      'image': 'https://pbs.twimg.com/media/FMs_3cAXwAYIS1w.jpg:large',
      'tags': ['Contains Soy', 'Vegetarian']
    },
    {
      'title': 'Workshop on Flutter',
      'group': 'Development Team',
      'date': 'Friday, November 8',
      'time': '4:00 PM - 6:00 PM',
      'location': 'Room 202',
      'image': 'https://i0.wp.com/swatstories.com/wp-content/uploads/2022/07/free-food-4-sushi-.jpg?ssl=1',
      'tags': ['Halal', 'Contains Nuts']
    }
  ];

  void changeDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
    });
  }

  Color getTagColor(String tag) {
    switch(tag) {
      case 'Halal':
        return Colors.green;
      case 'Vegetarian':
        return Colors.purple;
      case 'Contains Nuts':
        return Colors.red;
      case 'Contains Soy':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => changeDate(-1),
          ),
          Center(
            child: Text(
              DateFormat('EEE, MMM d, yyyy').format(selectedDate),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => changeDate(1),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Thumbnail image
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(posts[index]['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Event details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index]['title']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              posts[index]['group']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              posts[index]['date']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              posts[index]['time']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              posts[index]['location']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Spacing before tags row
                  const SizedBox(height: 8),
                  // Tags Row
                  Wrap(
                    spacing: 8.0,
                    children: (posts[index]['tags'] as List<String>).map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: getTagColor(tag),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Delete Event',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.redAccent,
        onTap: (index) {
          //Handle tab selection
        },
      ),
    );
  }
}
