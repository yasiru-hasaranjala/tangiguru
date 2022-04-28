import 'package:flutter/material.dart';

class FertilizersAC extends StatefulWidget {
  const FertilizersAC({Key? key}) : super(key: key);

  @override
  State<FertilizersAC> createState() => _FertilizersACState();
}

class _FertilizersACState extends State<FertilizersAC> {
  TextEditingController nController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController kController = TextEditingController();

  String UserName = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 70),
                child: Text(
                  "Fertilizers",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Hind',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    color: Colors.black,
                    margin: const EdgeInsets.fromLTRB(20, 20, 2, 20),
                    child: const Center(
                      child: Text(
                        "N",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontFamily: 'Hind',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(4, 20, 20, 20),
                      child: TextField(
                        controller: nController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '',
                        ),
                        onChanged: (text) {
                          setState(() {
                            UserName = text;
                            //you can access nameController in its scope to get
                            // the value of text entered as shown below
                            //UserName = nameController.text;
                          });
                        },
                      ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    color: Colors.black,
                    margin: const EdgeInsets.fromLTRB(20, 20, 2, 20),
                    child: const Center(
                      child: Text(
                        "P",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontFamily: 'Hind',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(4, 20, 20, 20),
                    child: TextField(
                      controller: pController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                      ),
                      onChanged: (text) {
                        setState(() {
                          UserName = text;
                          //you can access nameController in its scope to get
                          // the value of text entered as shown below
                          //UserName = nameController.text;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    color: Colors.black,
                    margin: const EdgeInsets.fromLTRB(20, 20, 2, 20),
                    child: const Center(
                      child: Text(
                        "K",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontFamily: 'Hind',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(4, 20, 20, 20),
                    child: TextField(
                      controller: kController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '',
                      ),
                      onChanged: (text) {
                        setState(() {
                          UserName = text;
                          //you can access nameController in its scope to get
                          // the value of text entered as shown below
                          //UserName = nameController.text;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
