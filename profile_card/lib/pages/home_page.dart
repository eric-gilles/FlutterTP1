import 'package:flutter/material.dart';
import 'package:profile_card/pages/profile_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card App', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200, // Set the desired width
              height: 50, // Set the desired height
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilList()),
                  );
                },
                child: const Text('View Profiles', style:
                  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}