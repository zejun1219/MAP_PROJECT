import 'package:template01/models/user.dart';

class AuthService {
  List<User> users = [
    User(
      username: 'admin',
      password: '123',
      phone: '123456',
      email: 'user1@gmail.com',
      role: 'ADMIN',
      createTime: DateTime.now(),
    ),
    User(
      username: 'user1',
      password: '123',
      phone: '123456',
      email: 'user2@gmail.com',
      role: 'CUSTOMER',
      createTime: DateTime.now(),
    ),
    User(
      username: 'guest',
      password: '123',
      phone: '',
      email: '',
      role: 'GUEST',
      createTime: DateTime.now(),
    ),
  ];

  User? authenticateUser(String username, String password) {
    for (User user in users) {
      if (user.username == username && user.password == password) {
        return user;
      }
    }
    return null;
  }

  User getDefaultGuestUser() {
    return users.firstWhere((user) => user.username == 'guest');
  }
}
