import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glampartner/screens/add_product.dart';
import 'package:transparent_image/transparent_image.dart';

// Visualization of the different products that exist in our project


class products extends StatefulWidget {
  @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffffbac0),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddProduct()));
        },
      ),
      body: StreamBuilder <QuerySnapshot>  (
        stream: FirebaseFirestore.instance.collection('imageURLs2').snapshots(),
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
                        image: snapshot.data.docs[index].get('url2')),
                  );
                }),
          );
        },
      ),
    );
  }
}

