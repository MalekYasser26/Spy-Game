import 'package:flutter/material.dart';

class SubtractAdd_Widget extends StatelessWidget {
   SubtractAdd_Widget({Key? key, required this.sign}) : super(key: key);
final String sign;
  late int count ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        width:MediaQuery.of(context).size.width*0.08,
        child: Center(child: Text("$sign",style: TextStyle(fontSize: 38,color: Colors.white))),
        decoration: BoxDecoration(shape: BoxShape.circle,
            border: Border.all(color: Colors.white)),


      ),
    );
  }
}
