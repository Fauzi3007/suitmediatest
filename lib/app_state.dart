import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _name = '';
  String _selectedUserName = 'Selected User Name';
  bool _isPalindrome = false;
  List _users = [];

  String get name => _name;
  String get selectedUserName => _selectedUserName;
  bool get isPalindrome => _isPalindrome;
  List get users => _users;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void checkPalindrome(String text) {
    String cleanText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    _isPalindrome = cleanText == cleanText.split('').reversed.join('');
    notifyListeners();
  }

  void setSelectedUserName(String name) {
    _selectedUserName = name;
    notifyListeners();
  }

  void setUsers(List users) {
    _users = users;
    notifyListeners();
  }
}
