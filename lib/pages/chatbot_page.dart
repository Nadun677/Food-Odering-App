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
    "drink": "What do you want for drink? 🍹",
    "check order":
        "Let me check... 🧐 Your order is being prepared 🍳. ETA: 20 minutes 🚴💨.",
    "cancel order":
        "Your order is already being prepared. If you want to cancel, please contact support.\n 📞 Contact No: 771197555",
    "recommend": '''🍽️ Here are some recommended dishes:
    MEALS🍔
    🍔 Chicken Burger
    🍔 Beef Burger
    🍛 Chicken Biriyani
    🍛 Chicken Cheese Pasta
    🍕 Classic Cheese Pizza
    🍛 Chicken Kottu
    🍜 Spicy Kimchi Ramen With Pork
    🍛 Chicken Fried Rice
    DRINKS🍹
    🥤 Chocolate Milkshake
    🥤 Strawberry Milkshake
    🍹 Passion Mojito
    🍹 Classic Mojito
    🥤 Latte
    🥤 Hot Chocolate
    🍹 Watermelon juice
    🍹 Orange Juice''',
    "healthy":
        "How about our 🍔 Beef Burger or 🍔 Chicken Burger? Fresh, healthy, and delicious! 😃",
    "book table":
        "Please provide:\n📍 Restaurant Name\n🕒 Time\n👥 Number of Guests",
    "restaurant": '''🏨 Recommended Restaurants:
    1️⃣ Ambrosia Hotel & Restaurant
    2️⃣ Tava Restaurant
    3️⃣ Culinary Canva Cafe
    4️⃣ Java Junction''',
    "java junction": "Restaurant Name Received",
    "12.00": "Time Received",
    "canva": "Restaurant Name Received",
    "ambrosia": "Restaurant Name Received",
    "tava": "Restaurant Name Received",
    "11.00": "Time Received",
    "13.00": "Time Received",
    "14.00": "Time Received",
    "15.00": "Time Received",
    "16.00": "Time Received",
    "17.00": "Time Received",
    "18.00": "Time Received",
    "1": "Number of Guests Received",
    "2": "Number of Guests Received",
    "3": "Number of Guests Received",
    "4": "Number of Guests Received",
    "5": "Number of Guests Received",
    "6": "Number of Guests Received",
    "7": "Number of Guests Received",
    "8": "Number of Guests Received",
    "9": "Number of Guests Received",
    "10": "Number of Guests Received",
    "confirm": "Confimation Received✅",
    "chocolate milkshake": "The drink is confirmed🍹✅",
    "strawberry milkshake": "The drink is confirmed🍹✅",
    "passion mojito": "The drink is confirmed🍹✅",
    "classic mojito": "The drink is confirmed🍹✅",
    "latte": "The drink is confirmed🍹✅",
    "hot chocolate": "The drink is confirmed🍹✅",
    "wtermelon juice": "The drink is confirmed🍹✅",
    "orange juice": "The drink is confirmed🍹✅",
    // Meal Confirmations
    "chicken burger": "The meal is confirmed 🍔✅",
    "beef burger": "The meal is confirmed 🍔✅",
    "chicken biriyani": "The meal is confirmed 🍛✅",
    "chicken cheese pasta": "The meal is confirmed 🍝✅",
    "classic cheese pizza": "The meal is confirmed 🍕✅",
    "chicken kottu": "The meal is confirmed 🍛✅",
    "spicy kimchi ramen with pork": "The meal is confirmed 🍜✅",
    "chicken fried rice": "The meal is confirmed 🍛✅",
    "bye": "Goodbye! See you next time for your favorite meal! 🍕😋",
  };

  // Function to get chatbot response
  String getChatbotResponse(String userMessage) {
    userMessage = userMessage.toLowerCase(); // Convert user input to lowercase
    return botReplies[userMessage] ??
        "Sorry, I didn't understand that. 🤔 Can you try again?";
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
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isUser ? message["user"]! : message["bot"]!,
                      style: TextStyle(
                          color: isUser ? Colors.white : Colors.black),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
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
