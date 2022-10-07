import 'package:app/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';

import 'Authentication.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            width: 50,
            height: 50,
            /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
            child: Image.asset('assets/logo.png'),
        ),
        actions: [
          IconButton(
            onPressed: (){
              AuthenticationHelper()
                  .signOut()
                  .then((result) {
                if (result == null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginDemo()));
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                      result,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ));
                }
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.indigo, borderRadius: BorderRadius.circular(5)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Shane\'s Marks' ,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple, borderRadius: BorderRadius.circular(5)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Age Level 4-5' ,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ExpandablePanel(
              header: Container(
                width: MediaQuery.of(context).size.width*0.93,
                decoration: ShapeDecoration(
                  color: Colors.lightBlue.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.02),
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Color Identification -",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: 'Hind',
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: Icon(
                            Icons.star  ,
                            color: Colors.amber,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: Icon(
                            Icons.star  ,
                            color: Colors.amber,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: Icon(
                            Icons.star  ,
                            color: Colors.amber,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: Icon(
                            Icons.star_half  ,
                            color: Colors.amber,
                            size: 25.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: Icon(
                            Icons.star_border  ,
                            color: Colors.amber,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              collapsed: Container(),
              expanded: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Quiz 1 -",
                          style: TextStyle(
                            fontSize: 19.0,
                            fontFamily: 'Hind',
                            color: Colors.redAccent ,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: Icon(
                            Icons.check_box ,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Quiz 2 -",
                          style: TextStyle(
                            fontSize: 19.0,
                            fontFamily: 'Hind',
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: Icon(
                            Icons.close ,
                            color: Colors.red,
                            size: 30.0,
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              // tapHeaderToExpand: true,
              // hasIcon: true,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.98,
              decoration: ShapeDecoration(
                color: Colors.lightBlue.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Shapes & Sizes -",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontFamily: 'Hind',
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_half  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_border  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.98,
              decoration: ShapeDecoration(
                color: Colors.lightBlue.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Letters -",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontFamily: 'Hind',
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_half  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_border  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.98,
              decoration: ShapeDecoration(
                color: Colors.lightBlue.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Numbers -",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontFamily: 'Hind',
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_half  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_border  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.98,
              decoration: ShapeDecoration(
                color: Colors.lightBlue.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Making Words -",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontFamily: 'Hind',
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_half  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_border  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.98,
              decoration: ShapeDecoration(
                color: Colors.lightBlue.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Mathematics -",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontFamily: 'Hind',
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_half  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Icon(
                          Icons.star_border  ,
                          color: Colors.amber,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}