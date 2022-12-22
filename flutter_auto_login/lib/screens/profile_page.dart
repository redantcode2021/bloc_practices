import 'package:flutter/material.dart';
import 'package:flutter_auto_login/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class ProfilPage extends StatelessWidget {
  final String name;
  const ProfilPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page', style: GoogleFonts.inter())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100, shape: BoxShape.circle),
              child: Icon(
                Icons.person_sharp,
                size: 70,
                color: Colors.blueGrey.shade800,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 200,
              child: Divider(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  onPressed: () {
                    context.goNamed('edit_profile',
                        params: {'name': name},
                        extra: User(name: name, email: 'abcd@ymail.com'));
                  },
                  child: Text('Edit Profile', style: GoogleFonts.inter())),
            ),
          ],
        ),
      ),
    );
  }
}
