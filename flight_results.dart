import 'package:flutter/material.dart';
import 'booking_details.dart';

class FlightResultsScreen extends StatelessWidget {
  final String departureCity;
  final String destinationCity;
  final DateTime travelDate;

  FlightResultsScreen({super.key, 
    required this.departureCity,
    required this.destinationCity,
    required this.travelDate,
  });

  final List<Map<String, dynamic>> flights = [
    {
      'airline': 'Airways A',
      'price': 200,
      'duration': '2h 30m',
      'departureTime': '10:00 AM',
    },
    {
      'airline': 'Airways B',
      'price': 150,
      'duration': '1h 50m',
      'departureTime': '12:30 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flights: $departureCity to $destinationCity'),
      ),
      body: ListView.builder(
        itemCount: flights.length,
        itemBuilder: (context, index) {
          final flight = flights[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('${flight['airline']} - \$${flight['price']}'),
              subtitle: Text(
                '${flight['duration']} | Departs at ${flight['departureTime']}',
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingDetailsScreen(
                        selectedFlight: flight,
                      ),
                    ),
                  );
                },
                child: const Text('Book'),
              ),
            ),
          );
        },
      ),
    );
  }
}
