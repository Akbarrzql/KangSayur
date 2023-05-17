import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_content.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_head.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_list_transaction.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_two.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Profile_head(),
              SizedBox(
                height: 21,
              ),
              Profile_two(),
              SizedBox(height: 15,),
              Profile_list_transaction(),
              SizedBox(height: 10,),
              Profile_content(),
            ],
          ),
        ),
      ),
    );
  }
}

