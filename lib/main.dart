import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:coug_eats_application/login_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'create_event.dart';
import 'view_event_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        primaryColor: const Color(0xFFDC143C), //crimson color
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDC143C),
          primary: const Color(0xFFDC143C),
          secondary: const Color(0xFF808080), //gray color
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          background: Colors.white,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFDC143C),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFDC143C),
          foregroundColor: Colors.white,
        ),
      ),
      //home: const MyHomePage(title: 'Coug Eats'),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(),
        '/homepage': (context) => const HomePage(),
        '/create-event': (context) => CreateEvent(),
        '/view-event': (context) => EventDetailsPage(event: {}),
        '/edit-event': (context) => const PlaceholderEditEventPage(),
        '/delete-event': (context) => const PlaceholderDeleteEventPage(),
      },
    );
  }
}

class PlaceholderLoginPage extends StatelessWidget {
  const PlaceholderLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //logging in to the home page
            Navigator.pushReplacementNamed(context, '/homepage');
          },
          child: const Text('Go to Homepage'),
        ),
      ),
    );
  }
}

class PlaceholderEditEventPage extends StatelessWidget {
  const PlaceholderEditEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Event')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Return to homepage
          },
          child: const Text('Edit Event Placeholder'),
        ),
      ),
    );
  }
}

class PlaceholderDeleteEventPage extends StatelessWidget {
  const PlaceholderDeleteEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Event')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Return to homepage
          },
          child: const Text('Delete Event Placeholder'),
        ),
      ),
    );
  }
}


class PlaceholderCreateEventPage extends StatelessWidget {
  const PlaceholderCreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Event')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); //return to homepage
          },
          child: const Text('Submit Event'),
        ),
      ),
    );
  }
}

class PlaceholderViewEventPage extends StatelessWidget {
  const PlaceholderViewEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> eventData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text(eventData['title'] ?? 'Event Details'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventData['title'] ?? 'Unknown Event',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Group: ${eventData['group'] ?? 'Unknown'}'),
            Text('Date: ${eventData['date'] ?? 'Unknown'}'),
            Text('Time: ${eventData['time'] ?? 'Unknown'}'),
            Text('Location: ${eventData['location'] ?? 'Unknown'}'),
            //show tags
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              children: (eventData['tags'] as List<String>).map((tag) {
                return Container(
                  padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
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
      'date': 'Monday, December 2, 2024',
      'time': '10:00 AM - 11:30 AM',
      'location': 'Conference Room 1',
      'image': 'https://canadacollege.edu/studentlife/images/food-at-events.jpg',
      'tags': ['Halal', 'Vegetarian', 'Contains Nuts']
    },
    {
      'title': 'Meeting with Team B',
      'group': 'Project B Team',
      'date': 'Monday, December 2, 2024',
      'time': '12:30 PM - 2:00 PM',
      'location': 'Cafeteria',
      'image': 'https://pbs.twimg.com/media/FMs_3cAXwAYIS1w.jpg:large',
      'tags': ['Contains Soy', 'Vegetarian']
    },
    {
      'title': 'Workshop on Flutter',
      'group': 'Development Team',
      'date': 'Sunday, December 1, 2024',
      'time': '4:00 PM - 6:00 PM',
      'location': 'Room 202',
      'image': 'https://i0.wp.com/swatstories.com/wp-content/uploads/2022/07/free-food-4-sushi-.jpg?ssl=1',
      'tags': ['Halal', 'Contains Nuts']
    },
    {
      'title': 'Cyber Security Expo',
      'group': 'Crimson Code Team',
      'date': 'Tuesday, December 3, 2024',
      'time': '1:00 PM - 4:00 PM',
      'location': 'Room 355',
      'image': 'https://www.harpercollege.edu/about/news/images/IMG_7102.jpg',
      'tags': ['Contains Nuts']
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
        itemCount: posts.where((post) {
          final eventDate = DateFormat('EEEE, MMMM d, yyyy').parse(post['date']!);
          return eventDate.year == selectedDate.year && eventDate.month == selectedDate.month && eventDate.day == selectedDate.day;
        }).length,
        itemBuilder: (context, index) {
          final filteredPosts = posts.where((post) {
            final eventDate = DateFormat('EEEE, MMMM d, yyyy').parse(post['date']!);
            return eventDate.year == selectedDate.year && eventDate.month == selectedDate.month && eventDate.day == selectedDate.day;
          }).toList();
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/view-event', arguments: filteredPosts[index]);
            },
            child: Card(
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
                              image: NetworkImage(filteredPosts[index]['image']!),
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
                                filteredPosts[index]['title']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                filteredPosts[index]['group']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                filteredPosts[index]['date']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                filteredPosts[index]['time']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                filteredPosts[index]['location']!,
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
                    const SizedBox(height: 8), // Spacing before tags
                    Wrap(
                      spacing: 8.0,
                      children: (filteredPosts[index]['tags'] as List<String>).map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
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
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
          if (index == 1)
            {
              Navigator.pushNamed(context, '/create-event');
            }
          else if (index == 2)
            {
              Navigator.pushNamed(context, '/edit-event');
            }
          else if (index == 3)
            {
              Navigator.pushNamed(context, '/delete-event');
            }
        },
      ),
    );
  }
}
