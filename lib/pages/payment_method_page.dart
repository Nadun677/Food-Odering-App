import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key, required double getTotalAmount});

  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String _selectedMethod = "Credit/Debit Card";
  bool _saveCard = false;

  void _confirmPayment() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Method: $_selectedMethod Selected!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Method"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Credit/Debit Card
            ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.blue),
              title: const Text("Credit/Debit Card"),
              trailing: Radio(
                value: "Credit/Debit Card",
                groupValue: _selectedMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedMethod = value.toString();
                  });
                },
              ),
            ),

            // Cash on Delivery
            ListTile(
              leading: const Icon(Icons.money, color: Colors.green),
              title: const Text("Cash on Delivery"),
              trailing: Radio(
                value: "Cash on Delivery",
                groupValue: _selectedMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedMethod = value.toString();
                  });
                },
              ),
            ),

            // Google Pay
            ListTile(
              leading: const Icon(Icons.payments, color: Colors.orange),
              title: const Text("Google Pay"),
              trailing: Radio(
                value: "Google Pay",
                groupValue: _selectedMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedMethod = value.toString();
                  });
                },
              ),
            ),

            // Apple Pay
            ListTile(
              leading: const Icon(Icons.apple, color: Colors.black),
              title: const Text("Apple Pay"),
              trailing: Radio(
                value: "Apple Pay",
                groupValue: _selectedMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedMethod = value.toString();
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            // Save Card Option
            if (_selectedMethod == "Credit/Debit Card") ...[
              Row(
                children: [
                  Checkbox(
                    value: _saveCard,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        _saveCard = value!;
                      });
                    },
                  ),
                  const Text("Save card for future payments"),
                ],
              ),
            ],

            const SizedBox(height: 20),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _confirmPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Confirm Payment",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
