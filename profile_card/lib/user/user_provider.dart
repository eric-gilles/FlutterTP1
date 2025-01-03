import 'package:profile_card/user/user.dart';

class UserProvider {
  final List<User> _users = List.empty(growable: true);

  List<User> getAllUsers() => _users;

  void addUser(User user) {
    _users.add(user);
  }

  void defaultUsers() {
    User user = User(name: 'Gilles',
        firstName: 'Éric',
        email: 'eric.gilles@etu.umontpellier.fr',
        avatarUrl: 'https://avatars.githubusercontent.com/u/77812690?v=4',
        links: [
          'https://github.com/eric-gilles',
          'https://www.linkedin.com/in/eric-gilles1/'
        ]);

    User user1 = User(name: 'Doe',
        firstName: 'John',
        email: 'johndoe@mail.com',
        avatarUrl: 'https://img.freepik.com/premium-vector/user-icon-set-social-profile-avatar-vector-symbol-person-account-web-sign_268104-14523.jpg',
        links: []);

    _users.add(user);
    _users.add(user1);
  }
}