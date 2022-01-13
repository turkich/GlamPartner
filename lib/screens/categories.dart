import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:glampartner/screens/add_image.dart';

// Visualization of the different categories that exist in our project

class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xffffbac0),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Addcategorie()));
        },
      ),
      body: StreamBuilder <QuerySnapshot>  (
        stream: FirebaseFirestore.instance.collection('imageURL5').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          return !snapshot.hasData
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Container(
            padding: EdgeInsets.all(4),
            child: GridView.builder(
                itemCount: snapshot.data.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(3),
                    child: FadeInImage.memoryNetwork(
                        fit: BoxFit.cover,
                        placeholder: kTransparentImage,
                        image: snapshot.data.docs[index].get('url5')),
                  );
                }),
          );
        },
      ),
    );
  }
}
