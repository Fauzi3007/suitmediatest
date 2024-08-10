import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/app_state.dart';
import 'package:suitmedia_test/pages/second_screnn.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<AppState>().setName(value);
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: palindromeController,
              decoration: InputDecoration(
                labelText: 'Palindrome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AppState>()
                    .checkPalindrome(palindromeController.text);
                bool isPalindrome = context.read<AppState>().isPalindrome;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content:
                          Text(isPalindrome ? 'Palindrome' : 'Not Palindrome'),
                    );
                  },
                );
              },
              child: Text('CHECK'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ),
                );
              },
              child: Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}
