import 'package:flutter/material.dart';
// this page describes the functioning of our app ( for new users )
class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xfff47b7b),Color(0xffffffff)]),

        ),
        child:  Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text("About Us",style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 50),
              Text("GLAM Partner is a make-up store assitant that provides products to clients according to their  ",style: TextStyle(
                fontSize: 20,

              )),
              Text("specific facial features and then gives them",style: TextStyle(
                fontSize: 20,

              )),
              Text("    the chance to obtain a reduction coupon ",style: TextStyle(
                fontSize: 20,

              )),
              Text("at the store.",style: TextStyle(
                fontSize: 20,

              )),
              SizedBox(height: 20,),
              Text("If this is the first time you stumbled upon us,",style: TextStyle(
                fontSize: 20,

              )),
              Text("give us a try and hit that Find Your Product",style: TextStyle(
                fontSize: 20,

              )),
              Text("  button to intiate the customization",style: TextStyle(
                fontSize: 20,

              )),
              Text(" procedure!",style: TextStyle(
                fontSize: 20,

              ))


            ],
          ),

        ),
      ),

    );
  }
}
