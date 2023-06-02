import 'package:flutter/material.dart';
import 'package:flutter_form_login/routes/GenerateRouter.dart';


void main(){
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: "login",
        onGenerateRoute: GenerateRouter,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurpleAccent
        ),
    );
  }
}

