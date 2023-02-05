import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spy_game/view/Roles/Widgets/NextScreen_Widget.dart';

import '../../Providers/sharedlogic.dart';
import '../Home/HomeScreen.dart';

class NormalPlayerScreen extends StatelessWidget {
  const NormalPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161616),
      appBar: AppBar(
        title: Text("PLAYER ${Provider.of<SharedLogic>(context,listen: false).playerNum}"),
        // if condition for last one
        backgroundColor: Color(0xff161616),
        leading: IconButton(
          onPressed: () =>Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
          icon: Icon(Icons.home,size: 30) ,
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.17,),
            Text("انت مش جاسوس",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold)),
            Image.asset('assets/images/citizenremoved.png',
              width: MediaQuery.of(context).size.height*0.2,
              color: Colors.blue
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(" : المكان",style: TextStyle(color: Colors.white,fontSize: 25,)),
            ),
            Text("${Provider.of<SharedLogic>(context,listen: false).placeRND}",
                style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold)),
            Next_Screen(),

          ],

        ),
      ),

    );
  }
}
