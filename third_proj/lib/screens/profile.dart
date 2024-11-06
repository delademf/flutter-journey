import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:food/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:third_proj/helper/constant.dart';
import 'package:third_proj/models/user.dart';
import 'package:third_proj/screens/logIn_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User user = User(email: "", firstName: "firstName", image: "image", id: 0);

  @override
  void initState() {
    super.initState();
    findUser();

  }

  Future<void> findUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');

    if (userId != null) {
      var uri = Uri.parse("$baseUrl/user/find-by-id/$userId");
      var headers = {"Content-Type": "application/json"};
      var response = await http.post(uri, headers: headers);  // Use get instead of post for a fetch by ID

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        setState(() {
          user = User.fromJson(jsonResponse);
        });
      } else {
        // Handle errors (e.g., user not found)
        print("Error: ${response.statusCode}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            // CircleAvatar(
            //   radius: 50,
            //   backgroundColor: Colors.deepPurple,
            //   backgroundImage: user.image != null ? NetworkImage(user.image!) : null,
            //   child: user.image == null
            //       ? const Icon(
            //           Icons.person,
            //           size: 50,
            //           color: Colors.white,
            //         )
            //       : null,
            // ),
            // const SizedBox(height: 20),

            // User Name
            Padding(
                padding: const EdgeInsets.only(left: 15,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFF31B2ED)              )
                        ,child: IconButton(onPressed:(){
                          Navigator.pushNamed(context, "/Mainscreen");
                        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,) )),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: Text("   Profile", style: TextStyle(color: Color(0xFF31B2ED),fontSize: 20),),
                        )
                  ],
                ),
              ),
              SizedBox(height: 40),
              IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined,color: Color(0xFF31B2ED),size: 80,)),  
            Text(
              user.firstName ?? "Unknown User",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF31B2ED),
              ),
            ),
            const SizedBox(height: 8),

            // User Email
            Text(
              user.email ?? "No email available",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            // Options List
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit, color: Color(0xFF31B2ED)),
                    title: const Text(
                      "Update Profile",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pushNamed(context, '/update');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.history, color: Color(0xFF31B2ED)),
                    title: const Text(
                      "Order History",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pushNamed(context, '');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: Color(0xFF31B2ED)),
                    title: const Text(
                      "Log Out",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}