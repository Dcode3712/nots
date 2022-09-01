import 'package:flutter/material.dart';
import 'package:nots/DbHelper.dart';
import 'package:nots/firstpage.dart';
import 'package:sqflite/sqflite.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  
  Database? db;
  
  TextEditingController _title = TextEditingController();
  TextEditingController _subject = TextEditingController();

  List<Map<String, Object?>> l = List.empty(growable: true);


  @override
  void initState() {
    super.initState();

    getAllData();
  }

  getAllData()
  async {
      db = await DbHelper().createDatabase();

      String qry = "select * from "
      l = await db.rawQuery(qry);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Second Page"),
            actions: [InkWell(onTap: () async{

              String title = _title.text;
              String subject = _subject.text;

              // int id = ""
              String qry = " 'INSERT INTO Test(title, subject) VALUES('$title','$subject')";

              int a = await db!.rawInsert(qry);

              print(a);

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return firstpage();
              },));
            },child: Icon(Icons.done_rounded,size: 30,))],
          ),
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
            TextField(
                controller: _title,
                decoration: InputDecoration(hintText: "Title"),
                keyboardType: TextInputType.multiline,
            ),


            TextField(
                controller: _subject,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(hintText: "Enter Your Message"),
                scrollPadding: EdgeInsets.all(20),
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
            )
          ]),
              )),
        ),
        onWillPop: goback);
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return firstpage();
      },
    ));
    return Future.value();
  }
}
