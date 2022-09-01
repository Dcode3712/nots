import 'package:flutter/material.dart';
import 'package:nots/secondpage.dart';
import 'package:sqflite/sqflite.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

  Database? db;

  TextEditingController _title = TextEditingController();
  TextEditingController _subject = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        actions: [Icon(Icons.more_vert_outlined,size: 30,)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return secondpage();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: GridView.builder(itemCount: 10,
                itemBuilder: (context, index) {
                 
                  return GridTile(

                      child: ListTile(
                    title: Text("Divyesh",style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("Ukani Jitendrabhai"),
                  ));
                },
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
