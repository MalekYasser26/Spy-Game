import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spy_game/Providers/sharedlogic.dart';
import '../Home/HomeScreen.dart';
import '../Home/Widgets/button_widget.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with
    TickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${(count.inMinutes%60).toString().padLeft(2,'0')}:${(count.inSeconds%60).toString().padLeft(2,'0')}';
  }
  @override
  void initState(){
    super.initState();
  }
  void didChangeDependencies(){
    super.didChangeDependencies();
    controller=AnimationController(
        vsync: this,
        duration: Duration(
            seconds: Provider.of<SharedLogic>(context).min*60
        ));
  }
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161616),
      appBar: AppBar(
        backgroundColor: Color(0xff161616),
        leading: IconButton(
          onPressed: () {
            showDialog(

              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("هتخلع؟"),
                  content: Text("متأكد أنك عايز تطلع ؟"),
                  actions: [
                    GestureDetector(onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    }, child: Icon(Icons.close))
                  ],
                );
              },);
          },
          icon: Icon(Icons.home,size: 30) ,
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) =>
                  Text(countText,style: TextStyle(color: Colors.white,
                      fontSize: 40),),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundColor: Color(0xff818181),
                child: IconButton(
                  onPressed: () {
                    if(controller.isAnimating){
                      controller.stop();
                      setState(() {
                        isPlaying= false;
                      });
                    }
                    else{
                      controller.reverse(from:
                      controller.value==0 ?1.0 : controller.value);
                      setState(() {
                        isPlaying=true;
                      });
                    }

                  },
                  icon: isPlaying == true ? Icon(Icons.pause,color: Colors.black,)
                      : Icon(Icons.play_arrow,color: Colors.black,)
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}



