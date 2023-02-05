import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spy_game/view/Roles/SelectionScreen.dart';
import 'package:spy_game/view/Roles/Widgets/NextScreen_Widget.dart';

import '../../Providers/sharedlogic.dart';
import '../Home/HomeScreen.dart';

class SpyScreen extends StatelessWidget {
  const SpyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161616),
      appBar: AppBar(
        backgroundColor: Color(0xff161616),
        title: Text("PLAYER ${Provider.of<SharedLogic>(context,listen: false).playerNum}"),
        leading: IconButton(
          onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),)) ,
          icon: Icon(Icons.home,size: 30) ,
        ),
        elevation: 0,
      ),
      body: Center(child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.17,),
          Text("انت جاسوس",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold)),
          Image.asset('assets/images/Spy_logo.png',
            width: MediaQuery.of(context).size.height*0.3,
            color:Colors.red ,
          ),
          Text("اعمل نفسك من بنها",style: TextStyle(color: Colors.white,fontSize: 30,)),
          Text("حاول تعرف المكان",style: TextStyle(color: Colors.white,fontSize: 30,)),
          Next_Screen(),

        ],

      )),


    );
  }
}
