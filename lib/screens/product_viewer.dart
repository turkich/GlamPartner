import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:glampartner/plugins/firetop/storage/fire_storage_service.dart';
import 'package:glampartner/screens/spin.dart';

// Shows the client the accurate product for their inputs

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadFirbaseStorageImage(),
    );
  }
}



final String image1 = "produits/image_picker194290332261710515.png";
final String image2 = "produits/image_picker2413402138824759688.png";
final String image3 = "produits/image_picker3300363739734473953.png";
final String image4 = "produits/image_picker3786477431311547953.png";
final String image5 = "produits/image_picker4055974296759505608.png";
final String image6 = "produits/image_picker4073783481008647479.png";
final String image7 = "produits/image_picker6393987816223763140.png";
final String image8 = "produits/image_picker8123822807338909968.png";
final String image9 = "produits/image_picker8296374413636700040.png";
final String image10 = "produits/image_picker8515986946917643091.png";
final String image11 = "produits/image_picker8947458331811468793.png";
final String image12 = "produits/image_picker9179719879765310584.png";



 String image = image1;

class LoadFirbaseStorageImage extends StatefulWidget {
  @override
  _LoadFirbaseStorageImageState createState() =>
      _LoadFirbaseStorageImageState();
}

class _LoadFirbaseStorageImageState extends State<LoadFirbaseStorageImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                gradient: LinearGradient(
                    colors: [Color(0xffffbac0), Color(0xffF6E5F5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "This product is what best fits you:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: FutureBuilder(
                            future: _getImage(context, image),
                            builder: (context,AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done)
                                return Container(
                                  height:
                                  MediaQuery.of(context).size.height / 1.25,
                                  width:
                                  MediaQuery.of(context).size.width / 1.25,
                                  child: snapshot.data,
                                );

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting)
                                return Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.25,
                                    width: MediaQuery.of(context).size.width /
                                        1.25,
                                    child: CircularProgressIndicator());

                              return Container();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                loadButton(context),
                Button(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
Widget Button(BuildContext context){
 return Container(
    child: Stack(
      children: <Widget>[
        Container(
          padding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          margin: const EdgeInsets.only(
              top: 30, left: 20.0, right: 20.0, bottom: 20.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffffbac0), Color(0xffF6E5F5)],
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: FlatButton(
            onPressed: () {
              // navigate to Spin's screen
              Navigator.push(context, MaterialPageRoute(builder: (context)=>spin()));

            },
            child: Text(
              "Turn the Wheel of Fortune ",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),


      ],
    ),
  );
}
  Widget loadButton(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
            margin: const EdgeInsets.only(
                top: 30, left: 20.0, right: 20.0, bottom: 20.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffffbac0), Color(0xffF6E5F5)],
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: FlatButton(
              onPressed: () {
                //fetch another product
                setState(() {
                  final _random = new Random();
                  var imageList = [image1, image2, image3, image5, image4, image6, image7, image8, image9, image10, image11, image12];
                  image = imageList[_random.nextInt(imageList.length)];
                });
              },
              child: Text(
                "Suggest Me Another Product ",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          //SizedBox(height: 20,),

        ],
      ),
    );
  }

  Future<Widget> _getImage(BuildContext context, String image) async {
    Image m=Image.asset('images/logo.png');
    await FireStorageService.loadFromStorage(context, image)
        .then((downloadUrl) {
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });

    return m;
  }
}
