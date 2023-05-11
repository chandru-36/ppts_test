import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List tasks=['New task','User Accepted','Started for job site','Delayed','Reached Site','Request Installation','Job closed'];
  int on_task=0;
  bool create_task=true;

  restart(){
    Timer(Duration(seconds: 5), () {
      setState(() {
        on_task=0;
        create_task=true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      title: Text(
        "Status Tracker"
      )
      ),
      drawer: Drawer(
        width:size.width*0.5,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                height: size.height*0.1,
                child: Text(
                  "Menu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Status Tracker'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
           /* ListTile(
              title: const Text('Work Flow'),
              onTap: () {
                Navigator.pop(context);
              },
            ),*/

          ],
        ),
      ),
      body: SingleChildScrollView(
      child:
      create_task?Container(
            height: size.height*0.9,
            width: size.width*1,
        child: Align(
          alignment: Alignment.center,
          child: GestureDetector(
           onTap: (){
             setState(() {
               create_task=false;
             });
           },
            child:Container(
            padding: EdgeInsets.all(10),
            color: Colors.blue,
            child: Text(
              "Create",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
      )
          ),
        ),
          ):
      Container(
        child:Column(
          children: [
            DataTable(
              columnSpacing:size.width*0.085,
        dataRowHeight:size.height*0.15,
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Sequence',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Task Name',
                      style: TextStyle(fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Next Tasks',
                      style: TextStyle(fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,),
                    ),
                  ),
                ),

              ],
              rows: <DataRow>[
                for(var i=0;i<=on_task;i++)
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text((i+1).toString())),
                      DataCell(Text(tasks[i])),
                      DataCell(
                        i==6?Text(''):
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink,
      ),
      child:Text(tasks[i+1],
      style: TextStyle(
        color: Colors.white,
          fontWeight: FontWeight.w500
      ),
      )
      ),
      i==2 || i==4?Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.pink,
          ),
          child:Text(tasks[i+2],
            style: TextStyle(
                color: Colors.white,
              fontWeight: FontWeight.w500
            ),
          )
      ):Container(),
    ],
    )

                      ),
                    ],
                  ),
              ],
            ),
            on_task!=6?GestureDetector(
              onTap: (){
                print(on_task);
                setState(() {
                  on_task=on_task+1;
                });
                if(on_task==6){
                  print("yesssssssssssss");
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return
                  AlertDialog(
                    title: const Text('Close the job?'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text('Are you sure want to close the job?'),
                          Text('after 5 seconds data will removed.'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          restart();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
    },
    );
                }
              },
              child:
            Container(
              height: size.height*0.08,
             width: size.width*1,
              margin: EdgeInsets.only(left: 20,right: 10),
              //color: Colors.blue,
              child: Text(
                "Add a line...",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ),
            ):Container()
          ],
        ),
      )
      )
    );
  }
}
