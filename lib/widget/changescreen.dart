import 'package:flutter/material.dart';
import 'package:glampartner/screens/bottombar.dart';
import 'package:glampartner/screens/login.dart';


class ChangeScreen extends StatefulWidget {
  //const ChangeScreen({Key? key}) : super(key: key);
  late final Function onTap;
  late final String name;


  @override
  _ChangeScreenState createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children:<Widget> [
        const Text("I already have an account!",style: TextStyle(fontSize: 20),),
        const SizedBox(width: 10,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>bar()));
          },
          child: const  Text(
            "Login",
            style: TextStyle( color: Colors.pinkAccent, fontSize: 20,fontWeight: FontWeight.bold),
          ),)
      ],
    );
  }
}
