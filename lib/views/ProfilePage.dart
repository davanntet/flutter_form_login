
import 'package:flutter/material.dart';
import 'package:flutter_form_login/utils/UserData.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text("Profile",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),

      ),
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 30,),
            CircleAvatar(
              radius: 60,
              child: Icon(Icons.person,size: 100,),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Email: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.indigo),),
                      Text(user.email,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.red))
                    ],
                  ),
                  Row(
                    children: [
                      Text("Password: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.indigo),),
                      Text(user.password,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.red))
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
