import 'package:flutter/material.dart';
import 'package:profile_card/user/user.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Card", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            _getCard(context),
            _getAvatar(context),
          ],
        ),
      ),
    );
  }

  // Méthode pour obtenir la carte de l'utilisateur
  Container _getCard(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.8,
      height: screenHeight * 0.4,
      margin: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Text(
                  '${user.firstName} ${user.name}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user.email,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Links:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildLinksList(),
          ],
        ),
      ),
    );
  }

  // Widget pour construire la liste des liens
  Widget _buildLinksList() {
    if (user.links.isEmpty) {
      return const Text(
        'None',
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: user.links.map((link) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: GestureDetector(
              onTap: () => _launchURL(link),
              child: Text(
                link.substring(8),
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          );
        }).toList(),
      );
    }
  }

  // Méthode pour obtenir l'avatar de l'utilisateur
  Container _getAvatar(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 140),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(user.avatarUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Méthode pour ouvrir un lien
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
