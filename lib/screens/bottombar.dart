import 'package:glampartner/screens/about_us.dart';
import 'package:glampartner/screens/categories.dart';
import 'package:glampartner/screens/find.dart';
import 'package:glampartner/screens/products.dart';
import 'package:glampartner/screens/signup.dart';
import 'package:glampartner/screens/spin.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

// Helps navigate to the different screens

class bar extends StatefulWidget {
  const bar({Key? key}) : super(key: key);

  @override
  _barState createState() => _barState();
}

class _barState extends State<bar> {
  int currentIndex=0;
  final screens = [
    products(),
    find(),
    categories(),
    about(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
          backgroundColor: Color(0xffffbac0),
        elevation: 30,
        actions: <Widget>[
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              icon: Icon(Icons.account_circle_rounded),
            color: Colors.black,
          )
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffffbac0),
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (index) =>setState (()=>currentIndex=index),
        items:  const [
          BottomNavigationBarItem(

            icon:Icon(Icons.shopping_cart,color: Color(0xff34393c),),
            title: Text('All products',style: TextStyle(color: Color(0xff34393c)),),

          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.search,color: Color(0xff34393c)),
            title: Text('Find a product',style: TextStyle(color: Color(0xff34393c))),

          ),

          BottomNavigationBarItem(
            icon:Icon(Icons.view_list,color: Color(0xff34393c)),
            title: Text('Categories',style: TextStyle(color: Color(0xff34393c))),


          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.favorite,color: Color(0xff34393c)),
            title: Text('About Us',style: TextStyle(color: Color(0xff34393c))),

          ),
        ],
      ),
    );
  }
}
