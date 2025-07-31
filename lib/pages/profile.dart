import 'package:flutter/material.dart';



class UserProfile {
  final String name;
  final String email;
  final String profileImage;
  final String location;
  final String bio;

  UserProfile({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.location,
    required this.bio,
  });
}

final user = UserProfile(
  name: 'Donut Guy',
  email: 'me@donutmail.com',
  profileImage:  'https://images.pexels.com/photos/2228553/pexels-photo-2228553.jpeg',
  location: 'Nairobi, Kenya',
  bio: 'Fullstack dev by day, donut slayer by night 🍩⚔️',
);


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
                  Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Avatar + Name + Email
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    backgroundImage:
                     NetworkImage(user.profileImage),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.email,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.red),
                      const SizedBox(width: 4),
                      Text(user.location),
                    ],
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Edit Profile'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// About section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                user.bio,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ),

            const SizedBox(height: 24),

            /// Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionTile(Icons.shopping_bag, 'Orders'),
                _buildActionTile(Icons.favorite, 'Wishlist'),
                _buildActionTile(Icons.logout, 'Logout'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 28,
          child: Icon(icon, size: 28, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
