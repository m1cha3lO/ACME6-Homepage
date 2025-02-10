import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  final Map<String, String>? event;
  final String? eventId; // Optional for editing

  const CreateEvent({Key? key, this.event, this.eventId}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.event != null) {
      _titleController.text = widget.event!['title'] ?? '';
      _locationController.text = widget.event!['location'] ?? '';
      _dateController.text = widget.event!['date'] ?? '';
    }
  }

  void saveEvent() async {
    final eventData = {
      'title': _titleController.text,
      'location': _locationController.text,
      'date': _dateController.text,
    };

    if (widget.eventId != null) {
      // Update existing event
      await FirebaseFirestore.instance.collection('events').doc(widget.eventId).update(eventData);
    } else {
      // Create new event
      await FirebaseFirestore.instance.collection('events').add(eventData);
    }

    Navigator.pop(context); // Return to homepage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.eventId == null ? "Create Event" : "Edit Event"),
        backgroundColor: Theme.of(context).primaryColor, // Crimson AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Event Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: "Location",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: "Date",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor, // Crimson button
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: saveEvent,
              child: Text(
                widget.eventId == null ? "Post Event" : "Update Event",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
