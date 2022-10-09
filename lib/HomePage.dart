import 'package:app/login.dart';
import 'package:app/subjectCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';

import 'Authentication.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String childName = "Child";
  String age = "4-5";
  final dbRef = FirebaseDatabase.instance.reference();

  void nListener(String uid){
    dbRef.child("users/"+ uid + "/childName").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        childName = "$val";
      });
    });
  }
  void aListener(String uid){
    dbRef.child("users/"+ uid + "/age").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        age = "$val";
      });
    });
  }

  @override
  void initState() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    nListener(uid.toString());
    aListener(uid.toString());
    super.initState();
  }
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
                        child: Text(
                          childName + '\'s Marks' ,
                          style: const TextStyle(color: Colors.white, fontSize: 17),
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
            const SubjectCard("Color Identification", "color-identification"),
            const SubjectCard("Shapes and Sizes", "shapes-and-sizes"),
            const SubjectCard("Letters", "letters"),
            const SubjectCard("Numbers", "numbers"),
            const SubjectCard("Making Words", "making-words"),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
          ),
          child: Text('Clean All Mark of '+ childName),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Delete all marks of ' + childName + "?"),
              titleTextStyle: const TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    final User? user = auth.currentUser;
                    final uid = user?.uid;
                    setState(() {
                      dbRef.child("users/"+ uid.toString() + "/subjects").set({});
                    });
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}