import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Map<String, String> event;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EventCard({
    required this.event,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isAvailable = event['availability'] == 'Available';

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Stack(
        children: [
          // PopupMenuButton Positioned in the Top-Right Corner
          Positioned(
            top: 5,
            right: -6,
            child: PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == 'edit') {
                  onEdit();
                } else if (value == 'delete') {
                  onDelete();
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Details
                Text(
                  event['title'] ?? 'No Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['date'] ?? 'No Date',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          '${event['startTime']} - ${event['endTime']}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          event['location'] ?? 'No Location',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    // Availability Chip
                    Chip(
                      label: Text(
                        isAvailable ? 'Available' : 'Not Available',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: isAvailable
                        ? Colors.green : Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(color: const Color.fromARGB(255, 105, 90, 90)),
                Text(
                  "${event['foodDescription']} | ${event['foodTags']} | Contains ${event['allergens']?.toLowerCase()}",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
