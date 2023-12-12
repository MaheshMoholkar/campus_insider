import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ProfileSection extends StatelessWidget {
  ProfileSection({Key? key}) : super(key: key);
  final Razorpay _razorpay = Razorpay();
  String subscriptionStatus = 'inactive';

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;

    Future<void> _changeProfilePhoto() async {
      var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        var file = File(pickedFile.path);
        var storageRef = FirebaseStorage.instance.ref().child('profile_photos/${user!.uid}');
        await storageRef.putFile(file);
        var downloadURL = await storageRef.getDownloadURL();

        await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
          'photoURL': downloadURL,
        });
      }
    }

    void _openCheckout() async {
      var options = {
        'key': 'rzp_test_jdvQix22sn2F9N',  // Replace with your Razorpay API key
        'amount': 100,  // Replace with the amount in paise (e.g., 100 for ₹1)
        'name': 'Subscription Payment',
        'description': 'Monthly Subscription',
        'timeout': 60
      };

      try {
        _razorpay.open(options);
        subscriptionStatus = 'active';
      } catch (e) {
        print('Error: $e');
      }
    }

    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF26CBE6),
                Color(0xFF26CBC0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Profile',
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
                Navigator.pushNamed(context, 'dashboard');
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Icon(Ionicons.arrow_back, color: Colors.blueAccent),
              ),
            ),
          ),
          body: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Loading indicator while fetching data
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              // Access user data from Firestore snapshot
              Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                }
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }

                                Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;

                                // Display the profile photo dynamically
                                return CircleAvatar(
                                  radius: 50,
                                  backgroundImage: userData['photoURL'] != null
                                      ? NetworkImage(userData['photoURL'])
                                      : const AssetImage('assets/avatar.png') as ImageProvider,
                                );
                              },
                            ),
                            TextButton(onPressed: _changeProfilePhoto, child: const Text("Change")),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Profile Information",
                            style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.black, fontWeightDelta: 2),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Display user data dynamically
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text("Name", style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.grey, fontWeightDelta: 2), overflow: TextOverflow.ellipsis)),
                          Expanded(flex: 5, child: Text(userData['name'], style: Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: 2), overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text("Email", style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.grey, fontWeightDelta: 2), overflow: TextOverflow.ellipsis)),
                          Expanded(flex: 5, child: Text(userData['email'], style: Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: 2), overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text("Phone", style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.grey, fontWeightDelta: 2), overflow: TextOverflow.ellipsis)),
                          Expanded(flex: 5, child: Text(userData['phone'], style: Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: 2), overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      const SizedBox(height: 40), // Add a sized box for separation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subscription",
                            style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.black, fontWeightDelta: 2),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Fetch and display subscription details
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text("Subscription Status", style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.grey, fontWeightDelta: 2), overflow: TextOverflow.ellipsis)),
                          Expanded(flex: 5, child: Text(subscriptionStatus, style: Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: 2), overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Add Buy Subscription Button
                      ElevatedButton(
                        onPressed: () {
                          _openCheckout();  // Call Razorpay checkout method on button press
                        },
                        child: const Text("Buy Subscription"),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
