import 'package:flutter/material.dart';
import 'package:profile_card/pages/profile_page.dart';
import 'package:profile_card/user/user_provider.dart';
import 'package:profile_card/user/user.dart';

class ProfilList extends StatelessWidget {
  ProfilList({super.key});
  final UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    userProvider.defaultUsers();
    List<User> users = userProvider.getAllUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile List', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            User user = users[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  backgroundImage: user.avatarUrl.isNotEmpty
                      ? NetworkImage(user.avatarUrl)
                      : null,
                  child: user.avatarUrl.isEmpty
                      ? Text(
                    user.firstName[0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      : null,
                ),
                title: Text(
                  '${user.firstName} ${user.name}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text('Click to view profile'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to the profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileHomePage(user: user),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
