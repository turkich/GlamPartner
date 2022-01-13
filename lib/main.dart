
//@dart=2.9
import 'package:glampartner/screens/bottombar.dart';
import 'package:glampartner/screens/find.dart';
import 'package:flutter/material.dart';
import 'package:glampartner/screens/product_viewer.dart';
import 'package:glampartner/screens/spin.dart';


import 'package:glampartner/screens/dropdown_formfield.dart';

import 'package:glampartner/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

//The welcoming screen

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home:  const MyHomePage(
      title: 'Makeup App'
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Color(0xfffee6ea) ,
      floatingActionButton:FloatingActionButton(
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>bar()));},
        child: Icon(Icons.clear,color: Colors.black,),
        backgroundColor: Color(0xfffee6ea) ,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[

            ClipOval(
              child:Image.asset('images/logo.png',height: 280,width: 280),
            ),
            SizedBox(height: 80,),
            const Text("Welcome ", style: TextStyle(color:Color(0xffffbac0),fontStyle: FontStyle.italic , fontSize: 30)),
            const Text("To your Glam assistant ", style: TextStyle(color:Color(0xffffbac0),fontStyle: FontStyle.italic , fontSize: 30)),
            const SizedBox(height: 40,),
            Container(
              width: 300,
              height: 60,
              child: RaisedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>find()));
                },
                child: Text("Get Started", style: TextStyle(fontSize: 20,color: Colors.black54,),),
                color: Color(0xffffbac0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),

              ),

            ),


          ],
        ),
      ),

    );
  }
}
