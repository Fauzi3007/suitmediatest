import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:suitmedia_test/app_state.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=$page&per_page=10'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      context.read<AppState>().setUsers(data['data']);
      page++;
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    final users = context.watch<AppState>().users;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Center(
            child: Text('Third Screen',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              page = 1;
              context.read<AppState>().setUsers([]);
            });
            await fetchUsers();
          },
          child: ListView.builder(
            itemCount: users.length + 1,
            itemBuilder: (context, index) {
              if (index == users.length) {
                if (isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return const SizedBox.shrink();
              }
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index]['avatar']),
                  radius: 49,
                ),
                title: Text(
                  '${users[index]['first_name']} ${users[index]['last_name']}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(users[index]['email'],
                    style: const TextStyle(fontSize: 10)),
                onTap: () {
                  Navigator.pop(
                      context,
                      users[index]['first_name'] +
                          ' ' +
                          users[index]['last_name']);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
