import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: const Text(
      'Daily News',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevation: 0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'Profile');
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0XFFF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Ionicons.person, color: Colors.blueAccent),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () => _logout(context),
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
            color: const Color(0XFFF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Ionicons.log_out, color: Colors.blueAccent),
        ),
      ),
    ],
  );
}

void _logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushNamedAndRemoveUntil(context, 'startup', (route) => false);
}
