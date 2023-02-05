import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spy_game/Providers/sharedlogic.dart';
import 'package:spy_game/view/Roles/SelectionScreen.dart';
class Next_Screen extends StatelessWidget {
   Next_Screen({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () {
          Provider.of<SharedLogic>(context,listen: false).playerNum++;        // if condition for last one
          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen(changedsc:Provider.of<SharedLogic>(context,listen: false).spyCount
          ),));
        },
        child: Container(
          height: MediaQuery.of(context).size.height*0.06,
          width: MediaQuery.of(context).size.width*0.8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
              color: Colors.white
          ),
          child: Center(child: Text("باصي للي جنبك",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        ),
      ),
    )
    ;
  }
}
