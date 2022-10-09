import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectCard extends StatefulWidget {
  final String subName;
  final String subId;
  const SubjectCard(this.subName, this.subId);

  @override
  _SubjectCardState createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.reference();
  String subN = '';
  String subI = '';
  bool hasMark = false;
  String totalMark = '0';
  String question_1 = '0';
  String question_2 = '0';
  String question_3 = '0';
  String question_4 = '0';
  String question_5 = '0';
  String question_6 = '0';
  String question_7 = '0';
  String question_8 = '0';
  String question_9 = '0';
  String question_10 = '0';
  List<String> marks = ['0','0','0','0','0','0','0','0','0','0'];

  void mListener(String uid){
    dbRef.child("users/"+ uid + "/subjects/" + widget.subId +"/totalMarks").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        print('$val');
        if('$val' != 'null' ){
          hasMark = true;
          totalMark = '$val';
        }
      });
    });
  }

  void qListener(String uid, int question, String qid){
    dbRef.child("users/"+ uid + "/subjects/" + widget.subId +"/marks/" + qid).onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        print('$val');
        if('$val' != 'null' ){
          marks[question] = '$val';
        }
      });
    });
  }

  @override
  void initState() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    setState(() {
      subN = widget.subName;
      subI = widget.subId;
    });

    mListener(uid.toString());
    qListener(uid.toString(), 0, "question_1");
    qListener(uid.toString(), 1, "question_2");
    qListener(uid.toString(), 2, "question_3");
    qListener(uid.toString(), 3, "question_4");
    qListener(uid.toString(), 4, "question_5");
    qListener(uid.toString(), 5, "question_6");
    qListener(uid.toString(), 6, "question_7");
    qListener(uid.toString(), 7, "question_8");
    qListener(uid.toString(), 8, "question_9");
    qListener(uid.toString(), 9, "question_10");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
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
            Text(
              subN + " -",
              style: const TextStyle(
                fontSize: 19.0,
                fontFamily: 'Hind',
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            !hasMark ? const Text(
              "Not attempt yet  ",
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Hind',
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ) : Row(
              children: [
                starList(1),
                starList(2),
                starList(3),
                starList(4),
                starList(5),
              ],
            ),
          ],
        ),
      ),
      collapsed: Container(),
      expanded: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: !hasMark ? Row(
          children: const [
            Text(
              "Nothing to show !   ",
              style: TextStyle(
                fontSize: 19.0,
                fontFamily: 'Hind',
                color: Colors.black38 ,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.1),
              child: Icon(
                Icons.hourglass_empty ,
                color: Colors.black38,
                size: 24.0,
              ),
            ),

          ],
        ) : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            mark(1),
            mark(2),
            mark(3),
            mark(4),
            mark(5),
            mark(6),
            mark(7),
            mark(8),
            mark(9),
            mark(10),
          ],
        ),
      ),
      // tapHeaderToExpand: true,
      // hasIcon: true,
    );
  }

  Row mark(int id){
    return Row(
      children:  [
        Text(
          "Quiz $id -",
          style: const TextStyle(
            fontSize: 19.0,
            fontFamily: 'Hind',
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
        marks[id-1] == '1' ? const Padding(
          padding: EdgeInsets.all(0.1),
          child: Icon(
            Icons.check_box ,
            color: Colors.green,
            size: 30.0,
          ),
        ): const Padding(
          padding: EdgeInsets.all(0.1),
          child: Icon(
            Icons.close ,
            color: Colors.red,
            size: 30.0,
          ),
        ),

      ],
    );
  }

  Padding starList(int id){
    if(id <= int.parse(totalMark)/2){
      return const Padding(
        padding: EdgeInsets.all(0.1),
        child: Icon(
          Icons.star  ,
          color: Colors.amber,
          size: 25.0,
        ),
      );
    }
    else if(id > int.parse(totalMark)/2 && id <= (int.parse(totalMark)+1)/2){
      return const Padding(
        padding: EdgeInsets.all(0.1),
        child: Icon(
          Icons.star_half ,
          color: Colors.amber,
          size: 25.0,
        ),
      );
    }
    else{
      return const Padding(
        padding: EdgeInsets.all(0.1),
        child: Icon(
          Icons.star_border  ,
          color: Colors.amber,
          size: 25.0,
        ),
      );
    }

  }
}
