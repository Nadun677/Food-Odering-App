import 'package:flutter/material.dart';
import 'dart:math';
import 'reservation_confirmation_page.dart';

class TableAvailabilityPage extends StatefulWidget {
  const TableAvailabilityPage({super.key});

  @override
  _TableAvailabilityPageState createState() => _TableAvailabilityPageState();
}

class _TableAvailabilityPageState extends State<TableAvailabilityPage> {
  List<Map<String, dynamic>> tables = [];
  Set<int> reservedTables = {}; // Store reserved tables

  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _generateTableAvailability();
  }

  // AI-based table availability logic
  void _generateTableAvailability() {
    tables = List.generate(10, (index) {
      int tableId = index + 1;
      bool isAvailable = !reservedTables.contains(tableId) && _random.nextDouble() > 0.3;
      bool isRecommended = isAvailable && _random.nextDouble() > 0.7;

      return {
        'id': tableId,
        'isAvailable': isAvailable,
        'recommended': isRecommended,
      };
    });

    setState(() {});
  }

  // Reserve a table and prevent it from becoming available again
  void _reserveTable(int tableId) {
    setState(() {
      reservedTables.add(tableId); // Mark as permanently reserved
      int index = tables.indexWhere((table) => table['id'] == tableId);
      if (index != -1) {
        tables[index]['isAvailable'] = false;
        tables[index]['recommended'] = false;
      }
    });

    // Navigate to confirmation page
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
        title: const Text('Table Availability'),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _generateTableAvailability, // Refresh button
            tooltip: 'Refresh Availability',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Reserve Your Table',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tables.length,
                itemBuilder: (context, index) {
                  final table = tables[index];

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: table['isAvailable'] ? Colors.green[100] : Colors.red[100],
                    ),
                    child: ListTile(
                      leading: Icon(
                        table['isAvailable'] ? Icons.event_seat : Icons.block,
                        color: table['isAvailable'] ? Colors.green : Colors.red,
                        size: 32,
                      ),
                      title: Text(
                        'Table ${table['id']}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        table['isAvailable']
                            ? (table['recommended'] ? '⭐ Recommended' : 'Available')
                            : '❌ Reserved',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: table['isAvailable'] ? Colors.green[900] : Colors.red[900],
                        ),
                      ),
                      trailing: table['isAvailable']
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: table['recommended']
                                    ? Colors.orangeAccent
                                    : Colors.green,
                              ),
                              onPressed: () => _reserveTable(table['id']),
                              child: const Text('Reserve'),
                            )
                          : const Text(
                              'Reserved',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                            ),
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
