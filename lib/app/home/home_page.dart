import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const Center(
            child: Text('1'),
          );
        }
        if (currentIndex == 1) {
          return const Center(
            child: Text('2'),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jesteś zalogowany jako ${widget.user.email}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text('Wyloguj się'),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.reviews),
              label: 'Krytyka',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Utwórz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Moje konto',
            ),
          ]),
    );
  }
}
