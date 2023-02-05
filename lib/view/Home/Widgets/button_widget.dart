import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spy_game/Providers/sharedlogic.dart';
import 'package:spy_game/view/Preparation/PreparationScreen.dart';

class homeButton extends StatelessWidget {
   homeButton({Key? key, required this.home_text, required this.button_icon, required this.ScreenRoute}) : super(key: key);
   final String home_text;
   final IconData button_icon;
   final Widget ScreenRoute ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Pressed");
        Navigator.push(context, MaterialPageRoute(
          builder: (context) =>ScreenRoute ,));
      },

      child: Container(
        height: MediaQuery.of(context).size.height*0.06,
        decoration: BoxDecoration(color: Color(0xffe7e7e7),borderRadius: BorderRadius.circular(40)),
        child: Row(

          children: [
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(button_icon),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.18 ,),
            Center(child: Text("$home_text",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),))
          ],
        ),


      ),
    );
  }
}
