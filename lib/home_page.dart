import 'package:coug_eats_application/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'create_event.dart';
import 'event_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'view_event_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void logOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => logOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Center(
          child: Text(
            "Home",
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color(0xFFA60F2D),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('events').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var events = snapshot.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: events.length,
            itemBuilder: (context, index) {
              var eventDoc = events[index];
              var eventData = eventDoc.data() as Map<String, dynamic>;
              var event = eventData.map((key, value) => MapEntry(key, value.toString()));
              return EventCard(
                event: event,
                onEdit:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateEvent(
                        event: event,
                        eventId: eventDoc.id,
                      ),
                    ),
                  );
                },
                onDelete: () async {
                  await _firestore.collection('events').doc(eventDoc.id).delete();
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-event');
        },
        child: const Icon(Icons.add, color: Colors.white, size: 40),
        backgroundColor: const Color(0xFFA60F2D),
      ),
    );
  }
}
