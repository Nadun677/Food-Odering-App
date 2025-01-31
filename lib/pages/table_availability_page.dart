import 'package:flutter/material.dart';
import 'dart:math'; // For AI-based table suggestions
import 'reservation_confirmation_page.dart'; // Import the new page

class TableAvailabilityPage extends StatefulWidget {
  const TableAvailabilityPage({super.key});

  @override
  _TableAvailabilityPageState createState() => _TableAvailabilityPageState();
}

class _TableAvailabilityPageState extends State<TableAvailabilityPage> {
  List<Map<String, dynamic>> tables = [];

  @override
  void initState() {
    super.initState();
    _generateTableAvailability();
  }

  void _generateTableAvailability() {
    final random = Random();
    tables = List.generate(10, (index) {
      bool isAvailable = random.nextBool(); // AI decision (randomized for now)
      return {
        'id': index + 1,
        'isAvailable': isAvailable,
        'recommended': isAvailable && random.nextInt(10) > 6,
      };
    });
    setState(() {});
  }

  void _reserveTable(int tableId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReservationConfirmationPage(tableId: tableId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Availability'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Reserve Your Table',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tables.length,
                itemBuilder: (context, index) {
                  final table = tables[index];
                  return Card(
                    elevation: 3,
                    color: table['isAvailable'] ? Colors.green[100] : Colors.red[100],
                    child: ListTile(
                      leading: Icon(
                        table['isAvailable'] ? Icons.event_seat : Icons.block,
                        color: table['isAvailable'] ? Colors.green : Colors.red,
                      ),
                      title: Text('Table ${table['id']}'),
                      subtitle: Text(table['isAvailable']
                          ? (table['recommended'] ? '✔️ Recommended' : 'Available')
                          : 'Reserved'),
                      trailing: table['isAvailable']
                          ? ElevatedButton(
                              onPressed: () => _reserveTable(table['id']),
                              child: Text('Reserve'),
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
