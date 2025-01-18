import 'package:flutter/material.dart';
import 'flight_results.dart';

class SearchFlights extends StatefulWidget {
  const SearchFlights({super.key});

  @override
  _SearchFlightsState createState() => _SearchFlightsState();
}

class _SearchFlightsState extends State<SearchFlights> {
  String? departureCity;
  String? destinationCity;
  DateTime? travelDate;

  void pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) setState(() => travelDate = date);
  }

  void searchFlights() {
    if (departureCity != null && destinationCity != null && travelDate != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FlightResultsScreen(
            departureCity: departureCity!,
            destinationCity: destinationCity!,
            travelDate: travelDate!,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all details.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Flights')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: departureCity,
              hint: Text('Select Departure City'),
              items: ['New York', 'London', 'Paris', 'Tokyo']
                  .map((city) => DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => departureCity = value),
            ),
            DropdownButton<String>(
              value: destinationCity,
              hint: Text('Select Destination City'),
              items: ['New York', 'London', 'Paris', 'Tokyo']
                  .map((city) => DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => destinationCity = value),
            ),
            GestureDetector(
              onTap: () => pickDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Travel Date',
                ),
                child: Text(
                  travelDate != null
                      ? travelDate.toString().split(' ')[0]
                      : 'Choose a date',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: searchFlights,
              child: Text('Search Flights'),
            ),
          ],
        ),
      ),
    );
  }
}
