import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/app_state.dart';
import 'package:suitmedia_test/pages/third_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = context.watch<AppState>().name;
    final selectedUserName = context.watch<AppState>().selectedUserName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text(name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text(selectedUserName, style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdScreen(),
                  ),
                );

                if (result != null) {
                  context.read<AppState>().setSelectedUserName(result);
                }
              },
              child: Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
