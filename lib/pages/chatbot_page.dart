import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  // 🔹 Chatbot predefined responses
  final Map<String, String> botReplies = {
    "hi": "Hello! 🤖 Welcome to our Food App! How can I assist you today? 🍽️",
    "hello": "Hi there! 😊 What can I do for you?",
    "order food": "Sure! What would you like to order? 🍔🍕",
    "burger": "Great choice! 🍔 Would you like to add fries 🍟 or a drink 🥤?",
    "check order": "Let me check... 🧐 Your order is being prepared 🍳. ETA: 20 minutes 🚴💨.",
    "cancel order": "Your order is already being prepared. If you want to cancel, please contact support.\n 📞 Contact No: 771197555",
    "recommend": '''🍽️ Here are some recommended dishes:
    MEALS
    🍔 Chicken Burger
    🍔 Beef Burger
    🍛 Chicken Biriyani
    🍛 Chicken Cheese Pasta
    🍕 Classic Cheese Pizza
    🍛 Chicken Kottu
    🍜 Spicy Kimchi Ramen With Pork
    🍛 Chicken Fried Rice
    DRINKS
    🥤 Chocolate Milkshake
    🥤 Strawberry Milkshake
    🥤 Passion Mojito
    🥤 Classic Mojito
    🥤 Latte
    🥤 Hot Chocolate
    🥤 Watermelon juice
    🥤 Orange Juice''',
    "healthy": "How about our 🍔 Beef Burger or 🍔 Chicken Burger? Fresh, healthy, and delicious! 😃",
    "book table": "Please provide:\n📍 Restaurant Name\n🕒 Time\n👥 Number of Guests",
    "restaurant": '''🏨 Recommended Restaurants:
    1️⃣ Ambrosia Hotel & Restaurant
    2️⃣ Tava Restaurant
    3️⃣ Culinary Canva Cafe
    4️⃣ Java Junction''',
    "bye": "Goodbye! See you next time for your favorite meal! 🍕😋",
  };

  // Function to get chatbot response
  String getChatbotResponse(String userMessage) {
    userMessage = userMessage.toLowerCase(); // Convert user input to lowercase
    return botReplies[userMessage] ?? "Sorry, I didn't understand that. 🤔 Can you try again?";
  }

  // Function to send a message
  void sendMessage() {
    String userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({"user": userMessage});
      _messages.add({"bot": getChatbotResponse(userMessage)});
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FoodMe Chatbot 🤖")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message.containsKey("user");

                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isUser ? message["user"]! : message["bot"]!,
                      style: TextStyle(color: isUser ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
