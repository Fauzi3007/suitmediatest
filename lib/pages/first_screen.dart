// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/app_state.dart';
import 'package:suitmedia_test/pages/second_screen.dart';

class FirstScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    width: 116,
                    height: 116,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person_add_alt_1,
                        size: 40,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: const TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      context.read<AppState>().setName(value);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: TextField(
                    controller: palindromeController,
                    decoration: InputDecoration(
                      hintText: 'Palindrome',
                      hintStyle: const TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B637B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (palindromeController.text.isNotEmpty) {
                        context
                            .read<AppState>()
                            .checkPalindrome(palindromeController.text);
                        bool isPalindrome =
                            context.read<AppState>().isPalindrome;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(isPalindrome
                                  ? 'isPalindrome'
                                  : 'Not Palindrome'),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text('Palindrome input empty'),
                            );
                          },
                        );
                      }
                    },
                    child: const Text('CHECK',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        )),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B637B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondScreen(),
                        ),
                      );
                    },
                    child: const Text('NEXT',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
