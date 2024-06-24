import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/user.dart';


class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  UserProvider() {
    // Fetch fake data initially
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual API call
    _users = List.generate(
      3,
      (index) => User(
        id: index,
        name: 'User ${index + 1}',
        email: 'user${index + 1}@example.com',
        role: index == 0 ? 'Admin' : 'User',
      ),
    );

    notifyListeners();
  }

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void updateUserRole(int userId, String newRole) {
    for (var user in _users) {
      if (user.id == userId) {
        user.role = newRole;
        notifyListeners();
        break;
      }
    }
  }

  void deleteUser(int userId) {
    _users.removeWhere((user) => user.id == userId);
    notifyListeners();
  }
}
