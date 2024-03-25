import 'package:flutter/material.dart';
import 'package:login_signup/providers/user_provider.dart';
import 'package:login_signup/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(user.username),
            const SizedBox(
              height: 20,
            ),
            Text(user.email),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => signOutUser(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 2.5, 50),
                ),
              ),
              child: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
