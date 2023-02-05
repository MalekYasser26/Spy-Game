import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spy_game/Providers/sharedlogic.dart';
import 'package:spy_game/view/Appbar/CustomInstructionsAppBar.dart';

class InstructionsScreen extends StatefulWidget {
   InstructionsScreen({Key? key}) : super(key: key);

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
int count = 0 ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customInstappBar(

        ),

      backgroundColor: Color(0xff161616),
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (count>=1){
                        print("left");
                        count--;
                        setState(() {
                        });
                      }
                    },
                    child: Container(
                      color: Color(0xff161616),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
             if (count<11){
              print("right");
              print(count);
              count++;
              setState(() {
              });}
            },
                      // Increment the variable here

                    child: Container(
                      color: Color(0xff818181).withOpacity(.2),
                    ),
                  ),
                ),

              ],
            ),
            Center(
              child: ListView.builder(itemBuilder:(context, index) {
                return Center(
                  child: Column(
                    children: [
                      Text("${Provider.of<SharedLogic>(context).instructions[count]}",
                        style: TextStyle(color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height*0.04 ,
                        fontWeight: FontWeight.bold),
                          textAlign:TextAlign.center),
                      Padding(
                        padding:  EdgeInsets.all(20.0),
                        child: Text("${count+1}",
                          style: TextStyle(color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height*0.04 ,
                              fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                );
              },
                itemCount: 1,
                padding: EdgeInsets.all(20),
                scrollDirection:Axis.vertical ,
                shrinkWrap: true,
              ),
            ),
          ],

        ),
        //   body: InkWell(
        //     onTap: () {
        //       if (count<11){
        //         print(count);
        //         count++;
        //         setState(() {
        //         });}
        //       },
        //     child: Center(
        //     child: ListView.builder(itemBuilder:(context, index) {
        //       return Center(
        //              child: Column(
        //                children: [
        //                  Text("${Provider.of<SharedLogic>(context).instructions[count]}",
        //                    style: TextStyle(color: Colors.white,),),
        //                  SizedBox(
        //                    height: MediaQuery.of(context).size.height*0.1,
        //                  ),
        //                  Text("${count+1}",
        //                    style: TextStyle(color: Colors.white),),
        //                ],
        //              ),
        //            );
        //     },
        //         itemCount: 1,
        //       padding: EdgeInsets.all(20),
        //       scrollDirection:Axis.vertical ,
        //       shrinkWrap: true,
        //         ),
        // ),
        //   )
          // divide the screen into two halves , left press dec count , right press inc count















          ),
    );
  }
}
