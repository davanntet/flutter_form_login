
import 'package:flutter/material.dart';
import 'package:flutter_form_login/utils/FormType.dart';
import 'package:flutter_form_login/utils/UserData.dart';

import '../components/Form/InputTextTemplate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isOpen=false;
  late IconData passwordIcon;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String wrong="";
  @override
  Widget build(BuildContext context) {

    passwordIcon = isOpen?Icons.visibility_outlined:Icons.visibility_off_outlined;
    print("Bool=$isOpen");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        elevation: 0,
        title: Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              CircleAvatar(
                radius: 60,
                child: Icon(Icons.person,size: 100,),
              ),
              SizedBox(height: 40,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: InputTextTemplate(
                          controller: _emailController,
                          placholder: 'username',
                          label: 'Email',
                          startIcan: Icons.email,
                          lastIcon: Text("@gmail.com",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,color: Colors.purple),), inputType: FormType.email,)
                    ),
                    SizedBox(height: 20,),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: InputTextTemplate(
                          isHint: !isOpen,
                          controller: _pwdController,
                          placholder: 'Password',
                          label: 'Password',
                          startIcan: Icons.security_outlined,
                          lastIcon:InkWell(
                            onTap: (){
                              setState(() {
                                isOpen = !isOpen;
                              });
                            },
                            child: Icon(passwordIcon,size: 20,color: Colors.purple,),
                          ), inputType: FormType.password,
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),

              ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()&&_pwdController.text.length>=8&&_emailController.text.length>=5){
                      print("Email:${_emailController.text}@gmail.com");
                      print("Password:${_pwdController.text}");
                      wrong="";
                      Navigator.pushReplacementNamed(context, "profile",arguments: UserData(email: _emailController.text.trim().toLowerCase()+"@gmail.com", password: _pwdController.text.trim()));
                    }else{
                        wrong="Something went wrong!,please follow to Rules";
                    }
                    setState(() {

                    });
                 },
                  child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(wrong,style: TextStyle(color: Colors.red),),
              )
            ],
          ),
        ),
      ),
    );
  }
}



